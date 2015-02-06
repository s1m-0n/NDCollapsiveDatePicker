# NDCollapsiveDatePicker

[![CI Status](http://img.shields.io/travis/Simon Wicha/NDCollapsiveDatePicker.svg?style=flat)](https://travis-ci.org/Simon Wicha/NDCollapsiveDatePicker)
[![Version](https://img.shields.io/cocoapods/v/NDCollapsiveDatePicker.svg?style=flat)](http://cocoadocs.org/docsets/NDCollapsiveDatePicker)
[![License](https://img.shields.io/cocoapods/l/NDCollapsiveDatePicker.svg?style=flat)](http://cocoadocs.org/docsets/NDCollapsiveDatePicker)
[![Platform](https://img.shields.io/cocoapods/p/NDCollapsiveDatePicker.svg?style=flat)](http://cocoadocs.org/docsets/NDCollapsiveDatePicker)



## Installation

NDCollapsiveDatePicker is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

    pod "NDCollapsiveDatePicker"

## Usage

To run the example project, clone the repo, and run `pod install` from the NDCollapsiveDateViewDemo directory first.

``` objective-c
NDCollapsiveDateView collapsiveDateView = [[NDCollapsiveDateView alloc] initWithFrame:frame title:@"Date" andImage:[UIImage imageNamed:@"calendar"]];
collapsiveDateView.delegate = self;
[collapsiveDateView setShown:200.f andHiddenHeight:50];
```

``` objective-c
NDCollapsiveDateView collapsiveDateView = [[NDCollapsiveDateView alloc] initWithFrame:frame title:@"Date" andImage:UIImage imageNamed:@"calendar" hiddenHeight:50 andShownHeight:200.f];
```

![Alt text](https://github.com/s1m-0n/NDCollapsiveDatePicker/blob/master/demo.gif "NDCollapsiveDateView")

## Author

Simon Wicha, simon.wicha@nomis-development.net

## License

NDCollapsiveDatePicker is available under the MIT license. See the LICENSE file for more info.

