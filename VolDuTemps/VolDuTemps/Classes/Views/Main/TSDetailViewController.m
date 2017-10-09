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
//
//+ (instancetype)detailViewWithData:(TSDairyModel *)data {
//    
//    TSDetailViewController *detailView = [self detailView];
//    
//    //获取传过来的数据，填写到控件中
//    detailView.titleDetail = data.title;
//    detailView.textDetail = data.text;
//    detailView.timeDetail = data.time;
//    
//
//    return detailView;
//}

- (void)saveData{
    NSLog(@"保存数据");
    self.titleDetail = self.titleField.text;
    self.textDetail = self.textField.text;

}

- (void)setupUI{
    self.view.backgroundColor = [UIColor whiteColor];
    //创建保存按钮
    self.rightButton = [[UIBarButtonItem alloc] initWithTitle:@"保存" style:UIBarButtonItemStylePlain target:self action:@selector(saveData)];
    self.navigationItem.rightBarButtonItem = self.rightButton;
    
    UITextField *titleField = [[UITextField alloc] init];
    titleField.placeholder = @"标题";
    
    UITextView *textField = [[UITextView alloc] init];
    
    self.titleField = titleField;
    self.textField = textField;
    
    [self.view addSubview:titleField];
    [self.view addSubview:textField];
    
    //设置自动布局
    for (UIView *view in self.view.subviews) {
        view.translatesAutoresizingMaskIntoConstraints = NO;
    }

    CGFloat margin = 8;
    [self.view addConstraints:@[
                                [NSLayoutConstraint constraintWithItem:titleField
                                                             attribute:NSLayoutAttributeTop
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:self.view
                                                             attribute:NSLayoutAttributeTop
                                                            multiplier:1
                                                              constant:(64 + margin)],
                                
                                [NSLayoutConstraint constraintWithItem:titleField
                                                             attribute:NSLayoutAttributeLeft
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:self.view
                                                             attribute:NSLayoutAttributeLeft
                                                            multiplier:1
                                                              constant:margin],
                                
                                [NSLayoutConstraint constraintWithItem:titleField
                                                             attribute:NSLayoutAttributeRight
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:self.view
                                                             attribute:NSLayoutAttributeRight
                                                            multiplier:1
                                                              constant:margin],
                                ]];
    
    [self.view addConstraints:@[
                                [NSLayoutConstraint constraintWithItem:textField
                                                             attribute:NSLayoutAttributeTop
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:titleField
                                                             attribute:NSLayoutAttributeBottom
                                                            multiplier:1
                                                              constant:margin],
                                
                                [NSLayoutConstraint constraintWithItem:textField
                                                             attribute:NSLayoutAttributeLeft
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:titleField
                                                             attribute:NSLayoutAttributeLeft
                                                            multiplier:1
                                                              constant:0],
                                
                                [NSLayoutConstraint constraintWithItem:textField
                                                             attribute:NSLayoutAttributeRight
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:self.view
                                                             attribute:NSLayoutAttributeRight
                                                            multiplier:1
                                                              constant:margin],
                                
                                [NSLayoutConstraint constraintWithItem:textField
                                                             attribute:NSLayoutAttributeBottom
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:self.view
                                                             attribute:NSLayoutAttributeBottom
                                                            multiplier:1
                                                              constant:margin]
                                ]];


}
@end
