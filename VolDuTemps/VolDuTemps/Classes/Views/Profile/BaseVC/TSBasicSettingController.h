//
//  TSBasicSettingController.h
//  VolDuTemps
//
//  Created by Zhuangwei PENG on 2017/10/11.
//  Copyright © 2017年 Zhuangwei PENG. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TSSettingGroup.h"
#import "TSSettingItem.h"
#import "TSSettingViewCell.h"
#import "Addition.h"

@interface TSBasicSettingController : UITableViewController
//从外界获取数据
@property (nonatomic, strong) NSMutableArray *groups;
@property (nonatomic, strong) NSUserDefaults *userDefault;

//获取用户头像
- (UIImage *)getIconImage;
//获取用户名字
- (NSString *)getUserName;
//获取用户生日
- (NSString *)getUserBirth;
@end
