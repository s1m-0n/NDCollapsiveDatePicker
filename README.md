# NDCollapsiveDatePicker

[![CI Status](http://img.shields.io/travis/Simon Wicha/NDCollapsiveDatePicker.svg?style=flat)](https://travis-ci.org/Simon Wicha/NDCollapsiveDatePicker)
[![Version](https://img.shields.io/cocoapods/v/NDCollapsiveDatePicker.svg?style=flat)](http://cocoadocs.org/docsets/NDCollapsiveDatePicker)
[![License](https://img.shields.io/cocoapods/l/NDCollapsiveDatePicker.svg?style=flat)](http://cocoadocs.org/docsets/NDCollapsiveDatePicker)
[![Platform](https://img.shields.io/cocoapods/p/NDCollapsiveDatePicker.svg?style=flat)](http://cocoadocs.org/docsets/NDCollapsiveDatePicker)



## Installation

NDCollapsiveDatePicker is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

    pod 'NDCollapsiveDatePicker'

## Usage

To run the example project, clone the repo, and run `pod install` from the NDCollapsiveDateViewDemo directory first.

Add delegate to protocol into your .h
``` objective-c
#import <NDCollapsiveDatePicker/NDCollapsiveDateView.h>

@interface NDViewController : UIViewController <NDCollapsiveDateViewDelegate>
```
Use one of two init methods:
``` objective-c
NDCollapsiveDateView collapsiveDateView = [[NDCollapsiveDateView alloc] initWithFrame:frame title:@"Date" andImage:[UIImage imageNamed:@"calendar"]];
[collapsiveDateView setShown:200.f andHiddenHeight:50];
```
Or use combined init method:
``` objective-c
NDCollapsiveDateView collapsiveDateView = [[NDCollapsiveDateView alloc] initWithFrame:frame title:@"Date" andImage:UIImage imageNamed:@"calendar" hiddenHeight:50 andShownHeight:200.f];
```
Set delegate:
``` objective-c
collapsiveDateView.delegate = self;
```

include delegate method:
``` objective-c
-(void)datePickerViewDidCollapse:(NDCollapsiveDatePickerView *)datePickerView
```

Example how to get the selected date from NDCollapsiveDateView:
``` objective-c
-(void)datePickerViewDidCollapse:(NDCollapsiveDatePickerView *)datePickerView {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd-MM-yyyy"];
    NSString *stringDate = [dateFormatter stringFromDate:datePickerView.date];
    NSLog(@"selected date: %@",stringDate);
}
```

Feel free to customize the NDCollapsiveDateView
``` objective-c
collapsiveDateView.backgroundColor = [UIColor whiteColor];
collapsiveDateView.layer.borderColor = [[UIColor blackColor] CGColor];
...
```

## Screenshot

Animated gif of working NDCollapsiveDateView

![](https://github.com/s1m-0n/NDCollapsiveDatePicker/blob/master/demo1.gif "NDCollapsiveDateView")

## Author

Simon Wicha | simon.wicha@nomis-development.net

## License

NDCollapsiveDatePicker is available under the MIT license. See the LICENSE file for more info.

