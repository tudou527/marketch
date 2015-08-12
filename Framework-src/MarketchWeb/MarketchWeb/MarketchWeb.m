//
//  MarketchWeb.m
//  MarketchWeb
//
//  Created by MForever78 on 15/8/11.
//  Copyright (c) 2015年 MForever78. All rights reserved.
//

#import "MarketchWeb.h"
#import <WebKit/WebKit.h>

@interface MarketchWeb ()

@property (retain) NSWindow *window;
@property (retain) WebView *webView;

@end

@implementation MarketchWeb

- (void)initWebView:(NSString *)scriptPath {
    NSUInteger styleMask = NSTitledWindowMask | NSClosableWindowMask;
    self.window = [[NSWindow alloc] initWithContentRect:NSMakeRect(0, 0, 540, 260) styleMask:styleMask backing:NSBackingStoreBuffered defer:NO];
    
    // init webview
    WebView *webView = [[WebView alloc] initWithFrame:NSMakeRect(0, 0, 540, 260)];
    self.webView = webView;
    [webView setAutoresizesSubviews:YES];
    [webView setAutoresizingMask:NSViewWidthSizable | NSViewHeightSizable];
    [self.window.contentView addSubview:webView];
    webView.frameLoadDelegate = self;
    
    // convert ".../Plugins/Contents/Sketch/export.cocoascript"
    // to ".../Plugins/Contents/Resources/index.html"
    NSRegularExpression *pathReg = [NSRegularExpression regularExpressionWithPattern:@"(.+\\/).+\\/.+$" options:0 error:nil];
    NSTextCheckingResult *match = [pathReg firstMatchInString:scriptPath options:NSMatchingAnchored range:NSMakeRange(0, scriptPath.length)];
    NSRange needleRange = [match rangeAtIndex:1];
    NSString *indexFolder = [scriptPath substringWithRange:needleRange];
    NSString *indexFile = [indexFolder stringByAppendingString:@"Resources/index.html"];
    
    // load local html
    [[webView mainFrame] loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:indexFile]]];
    
    [self.window orderFront:nil];
}

- (void)callJSFunction:(NSString *)name withArguments:(NSArray *)args {
    if (!self.webView) return;
    [[self.webView windowScriptObject] callWebScriptMethod:name withArguments:args];
}

- (void)closeSelf {
    [self.window close];
}

- (void)webView:(WebView *)sender didFinishLoadForFrame:(WebFrame *)frame {
    //[self callJSFunction:@"changeTitle" withArguments:@[]];
}

- (void)webView:(WebView *)sender didClearWindowObject:(WebScriptObject *)windowObject forFrame:(WebFrame *)frame {
    [[[self webView] windowScriptObject] setValue:self forKey:@"controller"];
    [[[self webView] windowScriptObject] setValue:self.window forKey:@"viewWindow"];
}

- (BOOL)isSelectorExcludedFromWebScript:(SEL)aSelector {
    if (aSelector == @selector(closeSelf)) return NO;
    return YES;
}

- (BOOL)isKeyExcludedFromWebScript:(const char*)name {
    if (!strcmp(name, "window")) return NO;
    return YES;
}

@end