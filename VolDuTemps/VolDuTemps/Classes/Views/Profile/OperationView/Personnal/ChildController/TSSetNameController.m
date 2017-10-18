//
//  TSSetNameController.m
//  VolDuTemps
//
//  Created by Zhuangwei PENG on 2017/10/18.
//  Copyright © 2017年 Zhuangwei PENG. All rights reserved.
//

#import "TSSetNameController.h"
#import "Addition.h"


#define kUserNameKey @"userName"

@interface TSSetNameController ()

@end

@implementation TSSetNameController

#pragma Lazy instantiation
- (NSUserDefaults *)userDefault{
    if (!_userDefault) {
        _userDefault = [NSUserDefaults standardUserDefaults];
    }
    return _userDefault;
}
- (NSString *)saveKey{
    if (!_saveKey) {
        _saveKey = [[NSString alloc] init];
    }
    return _saveKey;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createNameField];
    
    self.navigationItem.title = @"设置名字";
    //获取用户名字
    self.saveKey = @"userName";
    self.inputField.text = [self getUserSetting];
    [self.inputField becomeFirstResponder];
    
    [self setNavigationButtons];

}

- (void)setNavigationButtons{
    self.view.backgroundColor = [UIColor colorWithHex:0xEDEDED];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(cancelNameChange)];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"确定" style:UIBarButtonItemStylePlain target:self action:@selector(confirmNameChange)];
    
    self.navigationController.navigationBar.tintColor = [UIColor darkTextColor];
    self.navigationItem.rightBarButtonItem.enabled = NO;
    
}

- (void)createNameField {
    UITextField *nameField = [[UITextField alloc] init];
    self.inputField = nameField;
    
    nameField.frame = CGRectMake(0, 80, kScreenSize.width, 30);
    nameField.backgroundColor = [UIColor whiteColor];
    
    //设置清除按钮
    nameField.clearButtonMode = UITextFieldViewModeWhileEditing;
    //设置文字水平居中
    nameField.contentVerticalAlignment =  UIControlContentVerticalAlignmentCenter;
    //设置光标位置
    nameField.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 0)];
    nameField.leftViewMode = UITextFieldViewModeAlways;
    //textfield 必须监听EditingChanged
    [nameField addTarget:self action:@selector(valueDidChange) forControlEvents:UIControlEventEditingChanged];

    [self.view addSubview:nameField];
}

- (void)cancelNameChange{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)confirmNameChange{
    if([self.inputField.text length]){
        [self.userDefault setObject:self.inputField.text forKey:self.saveKey];
        [self.userDefault synchronize];
        [self cancelNameChange];
    }else{
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:nil message:@"没有输入内容，请重写填写" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
        [alertView show];
    }
    
}

- (void)valueDidChange{
    NSString *preStr = [self getUserSetting];
    self.navigationItem.rightBarButtonItem.enabled = ![self.inputField.text isEqualToString:preStr];
}

//获取用户之前设置的名字
- (NSString *)getUserSetting{
    NSString *preSetting = [self.userDefault stringForKey:self.saveKey];
    if ([preSetting length]) {
        return preSetting;
    }
    return @"";
}

@end
