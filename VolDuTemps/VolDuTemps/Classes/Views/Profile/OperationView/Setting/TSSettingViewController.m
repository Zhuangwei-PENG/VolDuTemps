//
//  TSSettingViewController.m
//  VolDuTemps
//
//  Created by Zhuangwei PENG on 2017/10/11.
//  Copyright © 2017年 Zhuangwei PENG. All rights reserved.
//

#import "TSSettingViewController.h"
#import "TSFontController.h"

@interface TSSettingViewController ()

@end

@implementation TSSettingViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    
    self.navigationItem.title = @"设置";
    [self setGroups];

}

- (void)setGroups{
    
    TSSettingItem *font = [TSSettingItem itemWithTitle:@"字体大小"];
//    TSSettingItem *bgImage = [TSSettingItem itemWithTitle:@"背景图片"];
    
    TSSettingGroup *settingGroupOne = [TSSettingGroup groupWithItems:@[font]];
    [self.groups addObject:settingGroupOne];
    
    font.destinationVC = [TSFontController class];
}



@end
