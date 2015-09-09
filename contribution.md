# Contribution

## Brief introduction to the project

```
.
└── Contents
    └── Sketch
        ├── checkupdate.cocoascript
        ├── export.cocoascript
        ├── index.html
        ├── manifest.json
        ├── util.cocoascript
        └── zip.cocoascript
```

The project can be devided into two major parts.

First of which is the CocoaScript part. We grub the information we need from Sketch using the [offical API](http://bohemiancoding.com/sketch/support/developer/01-introduction/01.html) and store it into a json file, which can be found in every zip file you export.

The second part is the all-in-one `index.html`. It uses the json data and displays the images and layers. It really just normal front-end stuff, which means you would deal with HTML, CSS and JavaScript.

## Bug targeting guide

Since the `index.html` is just responsible for displaying, if you find any bugs related to information, such as counting extra 1 pixel here and there, it mostly is the cocoascript's bad. And of course when it comes to the UI problem, you should go and see the HTML file.

If you have any questions, feel free to open an issue.

