//
//  TSSetDateController.m
//  VolDuTemps
//
//  Created by Zhuangwei PENG on 2017/10/18.
//  Copyright © 2017年 Zhuangwei PENG. All rights reserved.
//

#import "TSSetDateController.h"
#define kUserBirthKey @"userBirth"

@interface TSSetDateController ()

@property (nonatomic, weak) UIDatePicker *datePicker;
//@property (nonatomic, weak) UITextField *dateField;
@end

@implementation TSSetDateController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.saveKey = @"userBirth";
    self.inputField.text = [self getUserSetting];
    [self setupUI];
    
}

- (void)setupUI{
    [self chooseDate];
}

#pragma mark - datePicker keyboard
- (void)finishedSelection{
    //获取时间
    NSDate *date = self.datePicker.date;
    //格式化日期
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy-MM-dd";
    //将日期转换成字符串
    NSString *dateStr = [formatter stringFromDate:date];
    self.inputField.text = dateStr;
    
    [self.inputField resignFirstResponder];
    self.navigationItem.rightBarButtonItem.enabled = YES;
}

- (void)chooseDate{
    UIDatePicker *date = [[UIDatePicker alloc] init];
    self.datePicker = date;
    //国际化
    self.datePicker.locale = [NSLocale localeWithLocaleIdentifier:@"zh"];
    
    //设置DatePicker模式为日期
    self.datePicker.datePickerMode = UIDatePickerModeDate;
    
    //设置最大日期为当前日期
    self.datePicker.maximumDate = [NSDate date];
    
    //设置键盘为DatePicker
    self.inputField.inputView = self.datePicker;
    
    //创建键盘辅助条
    UIToolbar *toorBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 44)];
    toorBar.backgroundColor = [UIColor lightGrayColor];
    
    //创建完成按钮
    UIBarButtonItem *finishBtn = [[UIBarButtonItem alloc] initWithTitle:@"完成" style:UIBarButtonItemStylePlain target:self action:@selector(finishedSelection)];
    //创建弹簧按钮
    UIBarButtonItem *spaceBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    //将两个按钮添加到toolbar上
    toorBar.items = @[spaceBtn, finishBtn];
    //将toolBar添加到键盘上面
    self.inputField.inputAccessoryView = toorBar;
    
}

@end
