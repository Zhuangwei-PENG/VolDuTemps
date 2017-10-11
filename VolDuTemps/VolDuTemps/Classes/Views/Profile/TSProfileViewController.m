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
//@property (nonatomic, strong) NSMutableArray *groups;
@end

@implementation TSProfileViewController

static NSString *cellId = @"staticCell";

//#pragma mark - Lazy instansitaion
//- (NSMutableArray *)groups{
//    if (!_groups) {
//        _groups = [NSMutableArray arrayWithCapacity:4];
//    }
//    return _groups;
//}

#pragma mark - SepUp UI
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
    // Do any additional setup after loading the view.
}

- (void)setupUI{
//    [super setupUI];
//    TSBasicSettingController *basicVC = [[TSBasicSettingController alloc] init];
    
//    [self.myTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellId];
    TSSettingItem *profile = [TSSettingItem itemWithTitle:@"名称" image:@"Mark_43"];
    TSSettingGroup *groupOne = [TSSettingGroup groupWithItems:@[profile]];
    [self.groups addObject:groupOne];

    TSSettingItem *setting = [TSSettingItem itemWithTitle:@"设置"];
    TSSettingItem *private = [TSSettingItem itemWithTitle:@"隐私"];
    TSSettingItem *aboutus = [TSSettingItem itemWithTitle:@"关于"];
    TSSettingGroup *groupTwo = [TSSettingGroup groupWithItems:@[setting,private,aboutus]];
    [self.groups addObject:groupTwo];
//    [self.view addSubview:basicVC];
}
//- (void)setupTableView{
//    [super setupTableView];
//    
//    [self.myTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellId];
//    TSSettingItem *profile = [TSSettingItem itemWithTitle:@"名称" image:@"Mark_43"];
//    TSSettingGroup *groupOne = [TSSettingGroup groupWithItems:@[profile]];
//    [self.groups addObject:groupOne];
//    
//    TSSettingItem *setting = [TSSettingItem itemWithTitle:@"设置"];
//    TSSettingItem *private = [TSSettingItem itemWithTitle:@"隐私"];
//    TSSettingItem *aboutus = [TSSettingItem itemWithTitle:@"关于"];
//    TSSettingGroup *groupTwo = [TSSettingGroup groupWithItems:@[setting,private,aboutus]];
//    [self.groups addObject:groupTwo];
//}
//
//#pragma mark - DataSource
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
//    return [self.groups count];
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
//    NSArray *group = [self.groups[section] items];
//    return [group count];
//}
//
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//    
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
//    TSSettingGroup *group = self.groups[indexPath.section];
//    TSSettingItem *item = group.items[indexPath.row];
//    cell.textLabel.text = [item title];
//    
//    if (indexPath.section == 0) {
//        cell.imageView.image = [UIImage imageNamed:item.image];
//        cell.textLabel.textAlignment = NSTextAlignmentCenter;
//        return cell;
//    }
//   
//    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
//    return cell;
//}
//#pragma mark - Delegate
//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    if (indexPath.section == 0) {
//        return 100;
//    }
//    return 44;
//}
//
//#pragma mark - Navigation



@end
