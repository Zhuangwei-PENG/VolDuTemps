//
//  TSSetNameController.h
//  VolDuTemps
//
//  Created by Zhuangwei PENG on 2017/10/18.
//  Copyright © 2017年 Zhuangwei PENG. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kScreenSize [UIScreen mainScreen].bounds.size

@interface TSSetNameController : UIViewController

@property (nonatomic, weak) UITextField *inputField;
@property (nonatomic, strong) NSUserDefaults *userDefault;
@property (nonatomic, strong) NSString *saveKey;

- (NSString *)getUserSetting;
@end
