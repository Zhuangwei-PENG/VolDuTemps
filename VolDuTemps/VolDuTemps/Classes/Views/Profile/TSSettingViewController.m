//
//  TSSettingViewController.m
//  VolDuTemps
//
//  Created by Zhuangwei PENG on 2017/10/11.
//  Copyright © 2017年 Zhuangwei PENG. All rights reserved.
//

#import "TSSettingViewController.h"
#import "TSFontController.h"
#import "TSTableViewCell.h"
#import "Addition.h"

#define kHeightOfCell 60

@interface TSSettingViewController ()
@property (nonatomic, strong) UIView *fontView;
@property (nonatomic, strong) UISlider *slider;
@property (nonatomic, strong) UIButton *confirmBtn;
@property (nonatomic, strong) UIButton *cancelBtn;
@property (nonatomic, strong) TSTableViewCell *modelCell;
@end

@implementation TSSettingViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    
    self.navigationItem.title = @"设置";
    [self setGroup];

}

- (void)setGroup{self.navigationItem.title = @"设置";
    
    TSSettingItem *font = [TSSettingItem itemWithTitle:@"字体大小"];
    TSSettingItem *bgImage = [TSSettingItem itemWithTitle:@"背景图片"];
    
    TSSettingGroup *settingGroupOne = [TSSettingGroup groupWithItems:@[font, bgImage]];
    [self.groups addObject:settingGroupOne];
    
    font.destinationVC = [TSFontController class];
}



@end
