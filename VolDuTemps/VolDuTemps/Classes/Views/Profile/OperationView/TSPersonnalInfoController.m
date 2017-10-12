//
//  TSPersonnalInfoController.m
//  VolDuTemps
//
//  Created by Zhuangwei PENG on 2017/10/12.
//  Copyright © 2017年 Zhuangwei PENG. All rights reserved.
//

#import "TSPersonnalInfoController.h"
#import "TSPersonnalSettingCell.h"

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
    self.icon = [TSSettingItem itemWithTitle:@"头像" image:@"Mark_43"];
    self.name = [TSSettingItem itemWithTitle:@"名字" image:nil subTitle:@"NAME"];
    self.birthDay = [TSSettingItem itemWithTitle:@"生日" image:nil subTitle:@"1991-2-4"];
    
    TSSettingGroup *groupOne = [TSSettingGroup groupWithItems:@[self.icon,self.name,self.birthDay]];
    [self.groups addObject:groupOne];
    
    self.signature = [TSSettingItem itemWithTitle:@"个性签名"];
    TSSettingGroup *groupTwo = [TSSettingGroup groupWithItems:@[self.signature] headerTitle:@"更多" footerTitle:nil];
    [self.groups addObject:groupTwo];
}

#pragma mark - DataSource
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TSPersonnalSettingCellType cellType = TSPersonnalSettingCellTypeRIghtText;
    
    TSSettingGroup *group = self.groups[indexPath.section];
    TSSettingItem *item = group.items[indexPath.row];
    
    if ([item.image length]) {
        cellType = TSPersonnalSettingCellTypeRightImage;
    }
    TSPersonnalSettingCell *cell = [TSPersonnalSettingCell cellWithTableView:tableView type:cellType];

    cell.item = item;
    return cell;

}

#pragma mark - Delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0 && indexPath.row == 0) {
        return 60;
    }
    return [super tableView:tableView heightForRowAtIndexPath:indexPath];;
}
@end
