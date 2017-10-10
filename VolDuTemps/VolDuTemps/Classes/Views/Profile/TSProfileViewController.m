//
//  TSProfileViewController.m
//  VolDuTemps
//
//  Created by Zhuangwei PENG on 2017/10/9.
//  Copyright © 2017年 Zhuangwei PENG. All rights reserved.
//

#import "TSProfileViewController.h"
#import "TSSettingGroup.h"
#import "TSSettingItem.h"

@interface TSProfileViewController ()
@property (nonatomic, strong) NSMutableArray *groups;
@end

@implementation TSProfileViewController

static const NSString *cellId = @"staticCell";

#pragma mark - Lazy instansitaion
- (NSMutableArray *)groups{
    if (!_groups) {
        _groups = [NSMutableArray arrayWithCapacity:4];
    }
    return _groups;
}

#pragma mark - SepUp UI
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)setupUI{
    [super setupUI];
}
- (void)setupTableView{
    [super setupTableView];
    
    [self.myTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellId];
    TSSettingItem *setting = [TSSettingItem itemWithTitle:@"设置"];
    TSSettingGroup *groupOne = [TSSettingGroup groupWithItems:@[setting]];
    [self.groups addObject:groupOne];
    
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
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
    
    TSSettingGroup *group = self.groups[indexPath.section];
    TSSettingItem *item = group.items[indexPath.row];
    cell.textLabel.text = [item title];
    return cell;
}
#pragma mark - Delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 100;
    }
    return 44;
}

#pragma mark - Navigation



@end
