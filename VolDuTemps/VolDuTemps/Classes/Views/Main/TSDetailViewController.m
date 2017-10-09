//
//  TSDetailViewController.m
//  VolDuTemps
//
//  Created by Zhuangwei PENG on 2017/10/9.
//  Copyright © 2017年 Zhuangwei PENG. All rights reserved.
//

#import "TSDetailViewController.h"

@interface TSDetailViewController ()


@end

@implementation TSDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupUI];
   
}

+ (instancetype)detailView{
    return [[self alloc] init];
}

- (void)saveData{
    NSLog(@"保存数据");
    self.titleDetail = self.titleField.text;
    self.textDetail = self.textField.text;

}
- (void)finishedSelection{
    //获取时间
}

- (void)chooseDate{
    UIDatePicker *date = [[UIDatePicker alloc] init];
    date.locale = [NSLocale localeWithLocaleIdentifier:@"zh"];
    
    //设置DatePicker模式为日期
    date.datePickerMode = UIDatePickerModeDate;
    
    //设置键盘为DatePicker
    self.dateField.inputView = date;
    
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
    self.dateField.inputAccessoryView = toorBar;
    
}

- (void)setupUI{
    self.view.backgroundColor = [UIColor whiteColor];
    //创建保存按钮
    self.rightButton = [[UIBarButtonItem alloc] initWithTitle:@"保存" style:UIBarButtonItemStylePlain target:self action:@selector(saveData)];
    self.navigationItem.rightBarButtonItem = self.rightButton;
    //创建标题
    self.titleField = [[UITextField alloc] init];
    self.titleField.placeholder = @"标题";
    //创建正文框
    self.textField = [[UITextView alloc] init];
    //创建时间选择按钮
    self.dateField = [[UITextField alloc] init];
    self.dateField.placeholder = @"选择日期📅";
    
    [self chooseDate];
  
    //创建时间选择器
//    self.datePicker = [[UIDatePicker alloc] init];

    
    [self.view addSubview:self.titleField];
    [self.view addSubview:self.textField];
    [self.view addSubview:self.dateField];
    
    //设置自动布局
    for (UIView *view in self.view.subviews) {
        view.translatesAutoresizingMaskIntoConstraints = NO;
    }

    CGFloat margin = 8;
    [self.view addConstraints:@[
                                [NSLayoutConstraint constraintWithItem:self.titleField
                                                             attribute:NSLayoutAttributeTop
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:self.view
                                                             attribute:NSLayoutAttributeTop
                                                            multiplier:1
                                                              constant:(64 + margin)],
                                
                                [NSLayoutConstraint constraintWithItem:self.titleField
                                                             attribute:NSLayoutAttributeLeft
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:self.view
                                                             attribute:NSLayoutAttributeLeft
                                                            multiplier:1
                                                              constant:margin],
                                
                                [NSLayoutConstraint constraintWithItem:self.titleField
                                                             attribute:NSLayoutAttributeRight
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:self.view
                                                             attribute:NSLayoutAttributeRight
                                                            multiplier:1
                                                              constant:margin],
                                ]];
    
    [self.view addConstraints:@[
                                [NSLayoutConstraint constraintWithItem:self.dateField
                                                             attribute:NSLayoutAttributeTop
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:self.titleField
                                                             attribute:NSLayoutAttributeTop
                                                            multiplier:1
                                                              constant:0],
                                
                                [NSLayoutConstraint constraintWithItem:self.dateField
                                                             attribute:NSLayoutAttributeRight
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:self.view
                                                             attribute:NSLayoutAttributeRight
                                                            multiplier:1
                                                              constant:margin],
                                
                                [NSLayoutConstraint constraintWithItem:self.dateField
                                                             attribute:NSLayoutAttributeWidth
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:nil
                                                             attribute:NSLayoutAttributeNotAnAttribute
                                                            multiplier:1
                                                              constant:80],
                                
                                [NSLayoutConstraint constraintWithItem:self.dateField
                                                             attribute:NSLayoutAttributeBottom
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:self.titleField
                                                             attribute:NSLayoutAttributeBottom
                                                            multiplier:1
                                                              constant:0]
                                ]];
    
    [self.view addConstraints:@[
                                [NSLayoutConstraint constraintWithItem:self.textField
                                                             attribute:NSLayoutAttributeTop
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:self.titleField
                                                             attribute:NSLayoutAttributeBottom
                                                            multiplier:1
                                                              constant:margin],
                                
                                [NSLayoutConstraint constraintWithItem:self.textField
                                                             attribute:NSLayoutAttributeLeft
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:self.titleField
                                                             attribute:NSLayoutAttributeLeft
                                                            multiplier:1
                                                              constant:0],
                                
                                [NSLayoutConstraint constraintWithItem:self.textField
                                                             attribute:NSLayoutAttributeRight
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:self.view
                                                             attribute:NSLayoutAttributeRight
                                                            multiplier:1
                                                              constant:margin],
                                
                                [NSLayoutConstraint constraintWithItem:self.textField
                                                             attribute:NSLayoutAttributeBottom
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:self.view
                                                             attribute:NSLayoutAttributeBottom
                                                            multiplier:1
                                                              constant:margin]
                                ]];


}
@end
