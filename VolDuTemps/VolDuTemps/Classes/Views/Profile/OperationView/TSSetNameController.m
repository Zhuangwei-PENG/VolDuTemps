//
//  TSSetNameController.m
//  VolDuTemps
//
//  Created by Zhuangwei PENG on 2017/10/18.
//  Copyright © 2017年 Zhuangwei PENG. All rights reserved.
//

#import "TSSetNameController.h"
#import "Addition.h"

#define kScreenSize [UIScreen mainScreen].bounds.size
#define kUserNameKey @"userName"

@interface TSSetNameController ()

@property (nonatomic, weak) UITextField *nameField;
@property (nonatomic, strong) NSUserDefaults *userDefault;

@end

@implementation TSSetNameController

#pragma Lazy instantiation
- (NSUserDefaults *)userDefault{
    if (!_userDefault) {
        _userDefault = [NSUserDefaults standardUserDefaults];
    }
    return _userDefault;
}
//- (UITextField *)nameField{
//    if (!_nameField) {
//        _nameField = [[UITextField alloc] init];
//    }
//    return _nameField;
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createNameField];
    
    [self.nameField becomeFirstResponder];
    self.view.backgroundColor = [UIColor colorWithHex:0xEDEDED];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(cancelNameChange)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"确定" style:UIBarButtonItemStylePlain target:self action:@selector(confirmNameChange)];
    self.navigationItem.rightBarButtonItem.enabled = NO;
}

- (void)createNameField {
    UITextField *nameField = [[UITextField alloc] init];
    self.nameField = nameField;
    
    nameField.frame = CGRectMake(0, 80, kScreenSize.width, 30);
    nameField.backgroundColor = [UIColor whiteColor];
    
    //获取用户名字
    nameField.text = [self getUserName];
    //设置清除按钮
    nameField.clearButtonMode = UITextFieldViewModeWhileEditing;
    //设置文字水平居中
    nameField.contentVerticalAlignment =  UIControlContentVerticalAlignmentCenter;
    //设置光标位置
    nameField.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 0)];
    nameField.leftViewMode = UITextFieldViewModeAlways;
    //textfield 必须监听EditingChanged
    [nameField addTarget:self action:@selector(nameDidChange) forControlEvents:UIControlEventEditingChanged];
    
    [self.view addSubview:nameField];
}

- (void)cancelNameChange{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)confirmNameChange{
    if([self.nameField.text length]){
        [self.userDefault setObject:self.nameField.text forKey:kUserNameKey];
    }else{
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:nil message:@"没有输入名字，请重写填写" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
        [alertView show];
    }
    [self cancelNameChange];
}

- (void)nameDidChange{
    NSString *preName = [self getUserName];

    self.navigationItem.rightBarButtonItem.enabled = ![self.nameField.text isEqualToString:preName];

}

//获取用户之前设置的名字
- (NSString *)getUserName{
    NSString *name = [self.userDefault stringForKey:kUserNameKey];
    if ([name length]) {
        return name;
    }
    return @"";
}

@end
