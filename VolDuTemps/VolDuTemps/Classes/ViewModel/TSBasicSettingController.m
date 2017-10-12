//
//  TSBasicSettingController.m
//  VolDuTemps
//
//  Created by Zhuangwei PENG on 2017/10/11.
//  Copyright © 2017年 Zhuangwei PENG. All rights reserved.
//

#import "TSBasicSettingController.h"

@interface TSBasicSettingController ()

@end

@implementation TSBasicSettingController

#pragma mark - Lazy instansitaion
- (NSUserDefaults *)userDefault{
    if (!_userDefault) {
        _userDefault = [NSUserDefaults standardUserDefaults];
    }
    return _userDefault;
}
- (NSMutableArray *)groups{
    if (!_groups) {
        _groups = [NSMutableArray arrayWithCapacity:4];
    }
    return _groups;
}

- (instancetype)init{
    return [self initWithStyle:UITableViewStyleGrouped];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" fontSize:16 target:self action:@selector(popBack) isPopBack:YES];
    
    [self setupTableView];

}

- (void)popBack{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)setupTableView{
    //self.tableView.backgroundColor = [UIColor whiteColor];
    self.tableView.backgroundColor = [UIColor colorWithHex:0xEDEDED];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.scrollEnabled = NO;
}

#pragma mark - DataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return [self.groups count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSArray *group = [self.groups[section] items];
    return [group count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    TSSettingViewCell *cell = [TSSettingViewCell cellWithTableView:tableView];
    TSSettingGroup *group = self.groups[indexPath.section];
    TSSettingItem *item = group.items[indexPath.row];
    cell.item = item;
    
    cell.indexPath = indexPath;
    
    return cell;
}

#pragma mark - Delegate
//返回脚部标题
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    TSSettingGroup *group = self.groups[section];
    return group.footerTitle;
}
//返回头部标题
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    TSSettingGroup *group = self.groups[section];
    return group.headerTitle;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}

//当cell选中的时候执行该方法
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    TSSettingGroup *group = self.groups[indexPath.section];
    TSSettingItem *item = group.items[indexPath.row];
    if (item.destinationVC) {//如果有跳转就执行跳转
        UIViewController *destinationVC = [[item.destinationVC alloc] init];
        NSLog(@"%@",item.destinationVC);
        [self.navigationController pushViewController:destinationVC animated:YES];
    }
    if (item.option) {//哪个cell有事情就做事情(自己的事情自己干)
        item.option();
    }
}

@end
