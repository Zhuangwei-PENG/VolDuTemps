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
//@property (nonatomic, strong) NSMutableArray *groups;
@end

@implementation TSProfileViewController

static NSString *cellId = @"staticCell";

#pragma mark - SepUp UI
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"我的设置🔧";
    self.navigationItem.leftBarButtonItem = nil;
    [self setupUI];

}

- (void)setupUI{
    //获取用户设置
    NSString *userBirth = [self.userDefault stringForKey:@"userBirthday"];
    NSString *days =@"";
    if ([userBirth length]) {
        //计算生日到今天的天数转换成字符串
        days = @"这是您的第100001天～";
    }
    
    
    TSSettingItem *profile = [TSSettingItem itemWithTitle:@"名称" image:nil subTitle:days];
    profile.destinationVC = [TSPersonnalInfoController class];
    
    TSSettingGroup *groupOne = [TSSettingGroup groupWithItems:@[profile]];
    [self.groups addObject:groupOne];

    TSSettingItem *setting = [TSSettingItem itemWithTitle:@"设置"];
    setting.destinationVC = [TSSettingViewController class];
    
    TSSettingItem *private = [TSSettingItem itemWithTitle:@"隐私"];
    private.destinationVC = [TSPrivateController class];
    
    TSSettingItem *aboutus = [TSSettingItem itemWithTitle:@"关于"];
    aboutus.destinationVC = [TSAboutUsController class];
    
    TSSettingGroup *groupTwo = [TSSettingGroup groupWithItems:@[setting,private,aboutus]];
    [self.groups addObject:groupTwo];


}

#pragma mark - DataSource
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    if (indexPath.section == 0) {
        TSIconViewCell *cell = [TSIconViewCell cellWithTableView:tableView];
        
        TSSettingGroup *group = self.groups[indexPath.section];
        TSSettingItem *item = group.items[indexPath.row];
        //在这里设置图片，reloadCell的时候才会更新
        UIImage *userImage = [self getIconImage];
        item.image = userImage;
        
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
