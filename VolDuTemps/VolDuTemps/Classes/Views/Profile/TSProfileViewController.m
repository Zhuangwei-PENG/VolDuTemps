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
    self.navigationItem.title = @"我的设置🔧";
    [self setupUI];
    // Do any additional setup after loading the view.
}

- (void)setupUI{

    TSSettingItem *profile = [TSSettingItem itemWithTitle:@"名称" image:@"Mark_43"];
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
    
    TSSettingViewCell *cell = [TSSettingViewCell cellWithTableView:tableView];
    TSSettingGroup *group = self.groups[indexPath.section];
    TSSettingItem *item = group.items[indexPath.row];
    cell.item = item;
    
    if (indexPath.section == 0) {
        cell.imageView.image = [UIImage imageNamed:item.image];
        cell.textLabel.textAlignment = NSTextAlignmentCenter;
        return cell;
    }
   
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

#pragma mark - Delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 100;
    }
    return 44;
}




@end
