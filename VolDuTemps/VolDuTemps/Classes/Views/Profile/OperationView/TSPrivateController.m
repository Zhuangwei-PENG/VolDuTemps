//
//  TSPrivateController.m
//  VolDuTemps
//
//  Created by Zhuangwei PENG on 2017/10/11.
//  Copyright © 2017年 Zhuangwei PENG. All rights reserved.
//

#import "TSPrivateController.h"
#import "TSSwitchItem.h"

@interface TSPrivateController ()

@end

@implementation TSPrivateController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"隐私";
    [self setGroup];
    
}

- (void)setGroup{
    
    TSSwitchItem *passWord = [TSSwitchItem itemWithTitle:@"设置密码"];
    
    
    TSSettingGroup *groupOne = [TSSettingGroup groupWithItems:@[passWord]];
    [self.groups addObject:groupOne];
    
    TSSwitchItem *touchID = [TSSwitchItem itemWithTitle:@"指纹解锁"];
    TSSwitchItem *graphID = [TSSwitchItem itemWithTitle:@"图形解锁"];
    
    TSSettingGroup *groupTwo = [TSSettingGroup groupWithItems:@[touchID, graphID]];
    [self.groups addObject:groupTwo];
    
}



@end
