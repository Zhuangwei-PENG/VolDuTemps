//
//  TSPersonnalInfoController.m
//  VolDuTemps
//
//  Created by Zhuangwei PENG on 2017/10/12.
//  Copyright © 2017年 Zhuangwei PENG. All rights reserved.
//

#import "TSPersonnalInfoController.h"

@interface TSPersonnalInfoController ()
@property (nonatomic, strong) TSSettingItem *icon;
@property (nonatomic, strong) TSSettingItem *name;
@property (nonatomic, strong) TSSettingItem *birthDay;
@property (nonatomic, strong) TSSettingItem *signature;
@end

@implementation TSPersonnalInfoController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    [self setGroups];
}

- (void)setGroups{
    self.icon = [TSSettingItem itemWithTitle:@"头像"];
    self.name = [TSSettingItem itemWithTitle:@"名字"];
    self.birthDay = [TSSettingItem itemWithTitle:@"生日"];
    
    TSSettingGroup *groupOne = [TSSettingGroup groupWithItems:@[self.icon,self.name,self.birthDay]];
    [self.groups addObject:groupOne];
    
    self.signature = [TSSettingItem itemWithTitle:@"个性签名"];
    TSSettingGroup *groupTwo = [TSSettingGroup groupWithItems:@[self.signature] headerTitle:@"更多" footerTitle:nil];
    [self.groups addObject:groupTwo];
}
@end
