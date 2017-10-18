//
//  TSAboutUsController.m
//  VolDuTemps
//
//  Created by Zhuangwei PENG on 2017/10/12.
//  Copyright © 2017年 Zhuangwei PENG. All rights reserved.
//

#import "TSAboutUsController.h"

@interface TSAboutUsController ()
@property (nonatomic, strong) TSSettingItem *comment;
@property (nonatomic, strong) TSSettingItem *functions;
@end

@implementation TSAboutUsController
#pragma mark - Setup UI
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"关于我们";
    self.tableView.backgroundColor = [UIColor colorWithHex:0xEDEDED];

    [self setGroups];
}

- (void)setGroups{
    self.comment = [TSSettingItem itemWithTitle:@"去评分"];
    self.functions = [TSSettingItem itemWithTitle:@"功能介绍"];
    TSSettingGroup *groupOne = [TSSettingGroup groupWithItems:@[self.comment,self.functions]];
    [self.groups addObject:groupOne];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view Delegate

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return [self setHeaderView];
    }
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return kHeaderH;
    }
    return 0;
}

#pragma mark - Private method
- (UIView *)setHeaderView{
    //创建headerView
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, kHeaderH)];
    //创建app图标
    UIImageView *appIconView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kHeaderH * 0.4, kHeaderH * 0.4)];
    //创建版本信息 Label
    UILabel *version = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, kScreenW, kHeaderH * 0.2)];
    
    [headerView addSubview:appIconView];
    [headerView addSubview:version];
    
    //设置图标
    appIconView.center = headerView.center;
    appIconView.image = [UIImage imageNamed:@"Mark_43"];
    appIconView.layer.cornerRadius = 5;
    appIconView.layer.masksToBounds = YES;
    
    //设置label
    version.center = CGPointMake(appIconView.center.x, CGRectGetMaxY(headerView.bounds) - 2 * kMargin);
    
    //获取app名称,app版本
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    
    NSString *app_Name = [infoDictionary objectForKey:@"CFBundleName"];
    NSString *app_Version = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
    
    version.text = [NSString stringWithFormat:@"%@ %@", app_Name, app_Version];
    version.textColor = [UIColor darkTextColor];
    version.textAlignment = NSTextAlignmentCenter;
    version.font = [UIFont systemFontOfSize:14];
    
    return headerView;
}
@end
