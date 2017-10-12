//
//  TSDetailViewController.m
//  VolDuTemps
//
//  Created by Zhuangwei PENG on 2017/10/9.
//  Copyright © 2017年 Zhuangwei PENG. All rights reserved.
//

#import "TSDetailViewController.h"
#import "Addition.h"

@interface TSDetailViewController ()

@property (nonatomic, strong) UIView *bottomLine;
@property (nonatomic, strong) UIDatePicker *datePicker;

@end

@implementation TSDetailViewController
+ (instancetype)detailView{
    return [[self alloc] init];
}

#pragma mark - Lazy instantiation
//创建保存按钮
- (UIBarButtonItem *)rightButton{
    if (!_rightButton) {
        _rightButton = [[UIBarButtonItem alloc] initWithTitle:@"保存" fontSize:16 target:self action:@selector(saveData) isPopBack:NO];
    }
    return _rightButton;
}
//创建返回按钮
- (UIBarButtonItem *)leftButton{
    if (!_leftButton) {
        _leftButton = [[UIBarButtonItem alloc] initWithTitle:@"返回" fontSize:16 target:self action:@selector(popBack) isPopBack:YES];
    }
    return _leftButton;
}
//创建标题
- (UITextField *)titleField{
    if (!_titleField) {
        _titleField = [[UITextField alloc] init];
    }
    return _titleField;
}
//创建正文框
- (UITextView *)textField{
    if (!_textField) {
        _textField = [[UITextView alloc] init];
    }
    return _textField;
}
//创建标题底部的线
- (UIView *)bottomLine{
    if (!_bottomLine) {
        _bottomLine = [[UIView alloc] init];
    }
    return _bottomLine;
}
//创建时间选择框
- (UITextField *)dateField{
    if (!_dateField) {
        _dateField = [[UITextField alloc] init];
    }
    return _dateField;
}

#pragma mark - UI setUp
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
}

- (void)setupUI{
    self.navigationItem.leftBarButtonItem = self.leftButton;
 
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.titleField];
    [self.view addSubview:self.textField];
    [self.view addSubview:self.dateField];
    [self.view addSubview:self.bottomLine];
    
    self.bottomLine.backgroundColor = [UIColor colorWithHex:0xEDEDED];
    
    self.navigationItem.rightBarButtonItem = self.rightButton;
    self.titleField.placeholder = @"标题";
    self.dateField.placeholder = @"选择日期📅";
    self.dateField.font = [UIFont systemFontOfSize:12];
    //设置时间选择键盘
    [self chooseDate];
    
    //设置自动布局
    for (UIView *view in self.view.subviews) {
        view.translatesAutoresizingMaskIntoConstraints = NO;
        [view sizeToFit];
    }
    
    CGFloat margin = 8;
    CGFloat height = 35;
    CGFloat widthOfDate = 100;
    CGFloat widthOfTitle = self.view.bounds.size.width - widthOfDate - 3 * margin;
    CGFloat widthOfText = self.view.bounds.size.width - 2 * margin;
    [self.view addConstraints:@[
                                [NSLayoutConstraint constraintWithItem:self.dateField
                                                             attribute:NSLayoutAttributeTop
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:self.view
                                                             attribute:NSLayoutAttributeTop
                                                            multiplier:1
                                                              constant:margin + 64],
                                
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
                                                              constant:widthOfDate],
                                
                                [NSLayoutConstraint constraintWithItem:self.dateField
                                                             attribute:NSLayoutAttributeHeight
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:nil
                                                             attribute:NSLayoutAttributeNotAnAttribute
                                                            multiplier:1
                                                              constant:height]
                                ]];
    
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
                                                             attribute:NSLayoutAttributeWidth
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:nil
                                                             attribute:NSLayoutAttributeNotAnAttribute
                                                            multiplier:1
                                                              constant:widthOfTitle],
                                
                                [NSLayoutConstraint constraintWithItem:self.titleField
                                                             attribute:NSLayoutAttributeHeight
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:nil
                                                             attribute:NSLayoutAttributeNotAnAttribute
                                                            multiplier:1
                                                              constant:height]
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
                                                                toItem:self.view
                                                             attribute:NSLayoutAttributeLeft
                                                            multiplier:1
                                                              constant:margin],
                                
                                [NSLayoutConstraint constraintWithItem:self.textField
                                                             attribute:NSLayoutAttributeWidth
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:nil
                                                             attribute:NSLayoutAttributeNotAnAttribute
                                                            multiplier:1
                                                              constant:widthOfText],
                                
                                [NSLayoutConstraint constraintWithItem:self.textField
                                                             attribute:NSLayoutAttributeBottom
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:self.view
                                                             attribute:NSLayoutAttributeBottom
                                                            multiplier:1
                                                              constant:margin]
                                ]];
    //设置title底部的分割线
    [self.view addConstraints:@[[NSLayoutConstraint constraintWithItem:self.bottomLine
                                                                    attribute:NSLayoutAttributeTop
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:self.titleField
                                                                    attribute:NSLayoutAttributeBottom
                                                                   multiplier:1
                                                                     constant:1],
                                       
                                       [NSLayoutConstraint constraintWithItem:self.bottomLine
                                                                    attribute:NSLayoutAttributeLeft
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:self.view
                                                                    attribute:NSLayoutAttributeLeft
                                                                   multiplier:1
                                                                     constant:margin],
                                       
                                       [NSLayoutConstraint constraintWithItem:self.bottomLine
                                                                    attribute:NSLayoutAttributeRight
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:self.view
                                                                    attribute:NSLayoutAttributeRight
                                                                   multiplier:1
                                                                     constant:-margin],
                                       
                                       [NSLayoutConstraint constraintWithItem:self.bottomLine
                                                                    attribute:NSLayoutAttributeHeight
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:nil
                                                                    attribute:NSLayoutAttributeNotAnAttribute
                                                                   multiplier:1
                                                                     constant:1]
                                       ]];
    
    
}
#pragma mark - Navigation
- (TSDairyModel *)saveData{
    NSLog(@"保存数据");
    return [TSDairyModel dairyModelWithTitle:self.titleField.text text:self.textField.text time:self.dateField.text];

}

- (void)popBack{
    //自类重写父类方法
    //如果时新建页面，只要有一个不为空，返回时提示是否保存
    //如果时修改页面，有一个位置修改了，返回时提示是否保存
 
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"是否保存" message:@"确定要返回并保存吗？" preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
    }];
    
    UIAlertAction *save = [UIAlertAction actionWithTitle:@"保存" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self saveData];
    }];
    
    UIAlertAction *notSave = [UIAlertAction actionWithTitle:@"不保存" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self.navigationController popViewControllerAnimated:YES];
    }];
    
    [alertController addAction:cancel];
    [alertController addAction:save];
    [alertController addAction:notSave];
    [self presentViewController:alertController animated:YES completion:^{
        
    }];
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
    self.dateField.text = dateStr;

    [self.dateField resignFirstResponder];
}

- (void)chooseDate{
    UIDatePicker *date = [[UIDatePicker alloc] init];
    self.datePicker = date;
    //国际化
    self.datePicker.locale = [NSLocale localeWithLocaleIdentifier:@"zh"];
    
    //设置DatePicker模式为日期
    self.datePicker.datePickerMode = UIDatePickerModeDate;
    
    //设置键盘为DatePicker
    self.dateField.inputView = self.datePicker;
    
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
@end

