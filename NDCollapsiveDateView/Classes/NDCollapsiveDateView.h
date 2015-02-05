//
//  NDCollapsiveDateView.h
//  NDCollapsiveDatePicker
//
//  Created by Simon Wicha on 4/02/2015.
//  Copyright (c) 2015 Simon Wicha. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NDCollapsiveDatePickerView.h"

@protocol NDCollapsiveDateViewDelegate <NSObject>

-(void)datePickerViewDidCollapse:(NDCollapsiveDatePickerView*)datePickerView;

@end

@interface NDCollapsiveDateView : UIView

@property (strong, nonatomic) IBOutlet NDCollapsiveDatePickerView *collapsiveDatePickerView;
@property (strong, nonatomic) IBOutlet UIButton* collapseButton;
@property (strong, nonatomic) IBOutlet UILabel *collapsiveLabel;
@property (strong, nonatomic) IBOutlet UIImageView *collapsiveImageView;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *collapsivePickerViewHeightConstraint;
@property (assign, nonatomic) CGFloat hiddenHeight;
@property (assign, nonatomic) CGFloat shownHeight;
@property (nonatomic, weak) id <NDCollapsiveDateViewDelegate> delegate;


-(id)initWithFrame:(CGRect)frame title:(NSString*)title andImage:(UIImage*)image;
-(id)initWithFrame:(CGRect)frame title:(NSString*)title image:(UIImage*)image hiddenHeight:(CGFloat)hiddenHeight andShownHeight:(CGFloat)shownHeight;
-(void)setShown:(CGFloat)collapsed andHiddenHeight:(CGFloat)show;
+ (id)collapsiveDateView;

@end
