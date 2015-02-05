//
//  NDCollapsiveDatePickerView.m
//  NDCollapsiveDatePicker
//
//  Created by Simon Wicha on 4/02/2015.
//  Copyright (c) 2015 Simon Wicha. All rights reserved.
//

#import "NDCollapsiveDatePickerView.h"

#define MIN_YEAR_VALUE 1900

NSString * const kDateFormater = @"YYYY-MM-DD";



@implementation NDCollapsiveDatePickerView {
    NSMutableArray* years;
    NSArray *month;
    NSMutableArray* days;
    NSCalendar *calendar;
    NSDate *minimumDate;
    NSInteger year;
    NSInteger minYear;
    NSString *selectedDay;
    NSString *selectedMonth;
    NSString *selectedYear;
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

-(id)init {
    self = [super init];
    if (self) {
        [self createObject];
    }
    return self;
}

-(id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self createObject];
    }
    return self;
}


-(void)createObject {
    self.delegate = self;
    self.showsSelectionIndicator=YES;
    // create datasource
    self.date = [NSDate date];
    calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    [comps setDay:1];
    [comps setMonth:1];
    [comps setYear:MIN_YEAR_VALUE];
    
    minimumDate = [[NSCalendar currentCalendar] dateFromComponents:comps];
    self.maximumDate = [NSDate date];
    self.date = minimumDate;
    if (!self.attributedTitleColor) {
        self.attributedTitleColor = [UIColor blackColor];
    }
    [self createDataSource];
}

-(void)createDataSource {
    
    // Creating Year
    
    if (self.maximumDate < self.date)
    {
        self.date = self.maximumDate;
    }
    if (self.maximumDate) {
        NSDateComponents *components = [calendar components:(NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit) fromDate:self.maximumDate];
        NSInteger yearComponent = [components year];
        years = [NSMutableArray array];
        minYear = [[calendar components:(NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit) fromDate:minimumDate] year];
        
        for (NSInteger i = minYear ; i<=yearComponent; i++) {
            [years addObject:[NSString stringWithFormat:@"%ld",(long)i]];
        }
    }
    
    
    //Creating Month
    
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    // change locale if the standard is not what you want
    
    month = [dateFormatter standaloneMonthSymbols];
    
    NSCalendar* cal = [NSCalendar currentCalendar];
    NSDateComponents* comps = [[NSDateComponents alloc] init];
    
    
    NSRange range = [cal rangeOfUnit:NSDayCalendarUnit inUnit:NSMonthCalendarUnit forDate:[cal dateFromComponents:comps]];
    
    //Creating Days
    days = [NSMutableArray array];
    
    for (int i= 1; i<=range.length; i++)
    {
        [days addObject:[NSString stringWithFormat:@"%d",i]];
    }
}

-(void)preselectPickerWithDate:(NSDate*)date {
    
    if (date) {
        NSCalendar* cal = [NSCalendar currentCalendar];
        NSDateComponents* components = [cal components:(NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit) fromDate:date]; // Get necessary date components
        
        [self selectRow:[components day] - 1 inComponent:0 animated:YES];
        [self selectRow:[components month] - 1 inComponent:1 animated:YES];
        [self selectRow:[components year] - MIN_YEAR_VALUE inComponent:2 animated:YES];
    }
}

-(void)setDate:(NSDate *)date {
    [self preselectPickerWithDate:date];
    _date = date;
}

-(NSDate*)getDate {
    NSString *daySelected = [NSString stringWithFormat:@"%@",[days objectAtIndex:[self selectedRowInComponent:0]]];
    NSString *monthSelected = [NSString stringWithFormat:@"%ld",(long)[self selectedRowInComponent:1] + 1];
    NSString *yearSelected = [NSString stringWithFormat:@"%@",[years objectAtIndex:[self selectedRowInComponent:2]]];
    [NSDateFormatter setDefaultFormatterBehavior:NSDateFormatterBehavior10_4];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd-MM-yyyy"];
    
    NSString *dateString = [NSString stringWithFormat:@"%@-%@-%@", daySelected, monthSelected, yearSelected];
    _date = [dateFormatter dateFromString:dateString];
    return _date;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    switch (component) {
        case 0:
            return [days count];
            break;
        case 1:
            return [month count];
            break;
        case 2:
            return [years count];
            break;
        default:
            return 0;
            break;
    }
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 3;
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    switch (component) {
        case 0:
            return [days objectAtIndex:row];
            break;
        case 1:
            return [month objectAtIndex:row];
            break;
        case 2:
            return [years objectAtIndex:row];
            break;
        default:
            return nil;
            break;
    }
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
    UILabel *columnView = (id)view;
    if (!columnView) {
        columnView= [[UILabel alloc] initWithFrame:CGRectMake(0.0f, 0.0f, [pickerView rowSizeForComponent:component].width, [pickerView rowSizeForComponent:component].height)];
    }
    if (self.fontSize) {
        columnView.font = [UIFont systemFontOfSize:self.fontSize];
    }
    columnView.textColor = self.attributedTitleColor;
    
    switch (component) {
        case 0:
            columnView.text = [days objectAtIndex:row];
            break;
        case 1:
            columnView.frame = CGRectMake(30.f, columnView.frame.origin.y, columnView.frame.size.width, columnView.frame.size.height);
            columnView.text = [month objectAtIndex:row];
            break;
        case 2:
            columnView.text = [years objectAtIndex:row];
            break;
        default:
            return nil;
            break;
    }
    
    return columnView;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component {
    
    int sectionWidth = 50;
    
    if (component == 1) {
        sectionWidth = self.frame.size.width - sectionWidth * 2;
    }
    return sectionWidth;
}


@end
