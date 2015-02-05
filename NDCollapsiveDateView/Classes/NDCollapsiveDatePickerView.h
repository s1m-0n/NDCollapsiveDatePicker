//
//  NDCollapsiveDatePickerView.h
//  NDCollapsiveDatePicker
//
//  Created by Simon Wicha on 4/02/2015.
//  Copyright (c) 2015 Simon Wicha. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NDCollapsiveDatePickerView : UIPickerView <UIPickerViewDelegate>

@property (nonatomic, strong) NSDate *maximumDate;
@property (nonatomic, strong) NSDate *date;
@property (nonatomic, strong) UIColor *attributedTitleColor;
@property (nonatomic, assign) CGFloat fontSize;

-(NSDate*)getDate;

@end
