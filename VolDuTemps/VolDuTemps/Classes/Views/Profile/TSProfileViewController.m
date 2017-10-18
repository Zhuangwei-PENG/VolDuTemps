//
//  TSProfileViewController.m
//  VolDuTemps
//
//  Created by Zhuangwei PENG on 2017/10/9.
//  Copyright © 2017年 Zhuangwei PENG. All rights reserved.
//

#import "TSProfileViewController.h"
#import "TSSettingViewController.h"
#import "TSPrivateController.h"
#import "TSAboutUsController.h"
#import "TSPersonnalInfoController.h"

#import "TSSettingGroup.h"
#import "TSSettingItem.h"
#import "TSIconViewCell.h"

@interface TSProfileViewController ()

@property (nonatomic, weak) TSSettingItem *profile;

@end

@implementation TSProfileViewController

static NSString *cellId = @"staticCell";

#pragma mark - SepUp UI
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    self.profile.title = [self getUserName];
    self.profile.image = [self getIconImage];
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"我的设置";
    self.navigationItem.leftBarButtonItem = nil;
    [self setupUI];

}

- (void)setupUI{
    //获取用户设置

    
    //设置第一组
    TSSettingItem *profile = [TSSettingItem itemWithTitle:@"名称" image:nil subTitle:[self getTotalDays]];
    self.profile = profile;
    profile.destinationVC = [TSPersonnalInfoController class];
    
    TSSettingGroup *groupOne = [TSSettingGroup groupWithItems:@[profile]];
    [self.groups addObject:groupOne];

    
    //设置第二组
    TSSettingItem *setting = [TSSettingItem itemWithTitle:@"设置"];
    setting.destinationVC = [TSSettingViewController class];
    
    TSSettingItem *private = [TSSettingItem itemWithTitle:@"隐私"];
    private.destinationVC = [TSPrivateController class];
    
    TSSettingItem *aboutus = [TSSettingItem itemWithTitle:@"关于"];
    aboutus.destinationVC = [TSAboutUsController class];
    
    TSSettingGroup *groupTwo = [TSSettingGroup groupWithItems:@[setting,private,aboutus]];
    [self.groups addObject:groupTwo];


}

- (NSString *)getTotalDays{
    NSString *userBirth = [self.userDefault stringForKey:@"userBirthday"];
    NSString *days =@"";
    if ([userBirth length]) {
        //计算生日到今天的天数转换成字符串
        days = @"这是您的第100001天～";
    }
    return days;
}

#pragma mark - DataSource
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    if (indexPath.section == 0) {
        TSIconViewCell *cell = [TSIconViewCell cellWithTableView:tableView];

        TSSettingGroup *group = self.groups[indexPath.section];
        TSSettingItem *item = group.items[indexPath.row];

        cell.item = item;
        return cell;
        
    }else {
        return [super tableView:tableView cellForRowAtIndexPath:indexPath];
    }

}

#pragma mark - Delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 100;
    }
    return [super tableView:tableView heightForRowAtIndexPath:indexPath];;
}

@end
