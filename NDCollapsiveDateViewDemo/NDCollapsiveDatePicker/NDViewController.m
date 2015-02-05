//
//  ViewController.m
//  NDCollapsiveDatePicker
//
//  Created by Simon Wicha on 4/02/2015.
//  Copyright (c) 2015 Simon Wicha. All rights reserved.
//

#import "NDViewController.h"

@interface NDViewController ()

@end

NDCollapsiveDateView *collapsiveDateView;

@implementation NDViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    CGRect frame = CGRectMake(self.view.frame.size.width / 2 - 150, self.view.frame.size.height / 2 - 100, 300, 60);
    //Init seperately
    collapsiveDateView = [[NDCollapsiveDateView alloc] initWithFrame:frame title:@"Date" andImage:[UIImage imageNamed:@"calendar"]];
    collapsiveDateView.delegate = self;
    [collapsiveDateView setShown:200.f andHiddenHeight:50];
    
    //or directly with show and hide
    /*
     collapsiveDateView = [[NDCollapsiveDateView alloc] initWithFrame:frame title:@"Date" andImage:UIImage imageNamed:@"calendar" hiddenHeight:50 andShownHeight:200.f];
     */
    
    //customize as much as you want!
    collapsiveDateView.backgroundColor = [UIColor whiteColor];
    collapsiveDateView.layer.borderColor = [[UIColor blackColor] CGColor];
    [self.view addSubview:collapsiveDateView];
}

-(void)viewDidAppear:(BOOL)animated {
    collapsiveDateView.collapsiveDatePickerView.date = [NSDate dateWithTimeIntervalSinceNow:3600];
}

-(void)datePickerViewDidCollapse:(NDCollapsiveDatePickerView *)datePickerView {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd-MM-yyyy"];
    NSString *stringDate = [dateFormatter stringFromDate:datePickerView.date];
    NSLog(@"selected date: %@",stringDate);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
