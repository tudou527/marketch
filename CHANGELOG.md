# Change Log 

## v1.0.24 fix

- Workaround Sketch v52 API breaking change by removing sharedObject lookup.
  - Export function should be recovered.
  - The text and shape will not appear in the right panel in this version.
  - Still trying to figure out a long term fix.

## v1.0.23 fix

* [fix] support sketch 46.2 and macOS 10.13

## v1.0.22 fix

* [fix] multiple line text only show the first.

## v1.0.21 fix

* [fix] support sketch 4.1

## v1.0.21

* [update] symbol export available

## v1.0.19

* [update] support sketch 3.7+

## v1.0.18

* [update] new interface

## v1.0.13

* [update] support sketch 3.5

## v1.0.10

* [new] use "svg" prefix for layer name to tell marketch export the layer as svg file.

## v1.0.6

* [update] support 3.4.4

## v1.0.5

* [new] use "-" prefix for page name or artboard name to prevent them to be exported. if you realy want "-", just use "\\-". also use "\\\" to get a "\".

## v1.0.4

* [update] add sketch beta 3.4 support

## v1.0.0

* [add] supports export slice.
* [add] css attribute support multiple radius.
* [update] keep the export css arrtibute consistent with sketch.
* [fixed] artboard screenshots of abnormal.
