//
//  TSMainViewController.m
//  VolDuTemps
//
//  Created by Zhuangwei PENG on 2017/10/9.
//  Copyright © 2017年 Zhuangwei PENG. All rights reserved.
//

#import "TSMainViewController.h"
#import "TSNavigationController.h"
#import "TSBaseViewController.h"

@interface TSMainViewController()
    
@property (nonatomic, strong) NSArray *subControllers;

@end


@implementation TSMainViewController
- (NSArray *)subControllers{
    if (!_subControllers) {
        _subControllers = @[@{@"className":@"TSHomeViewController",
                              @"imageName":@"tabbar_home",
                              @"title":@"主页",
                              @"tableViewStyle": @"Plain"},
                            
                            @{@"className":@"TSProfileViewController",
                              @"imageName":@"tabbar_profile",
                              @"title":@"我的",
                              @"tableViewStyle": @"Grouped"}
                            ];
    }
    return _subControllers;
}

- (void)viewDidLoad{
    [super viewDidLoad];
    [self setChildControllers];
}

- (void)setChildControllers{
    NSMutableArray *mArr = [NSMutableArray arrayWithCapacity:3];
    for (NSDictionary *dict in self.subControllers) {
        UIViewController *vc = [self creatController:dict];
        [mArr addObject:vc];
    }
    self.viewControllers = mArr.copy;
}

- (UIViewController *)creatController:(NSDictionary *)dict{
    NSString *clsName = dict[@"className"];
    NSString *imageName = dict[@"imageName"];
    NSString *title = dict[@"title"];
    NSString *style = dict[@"tableViewStyle"];
    
    if (!clsName) {
        return [[UIViewController alloc] init];;
    }

    TSBaseViewController *vc = [[NSClassFromString(clsName) alloc] init];
    vc.title = title;
    vc.tabBarItem.image = [UIImage imageNamed:imageName];
    vc.tabBarItem.selectedImage = [UIImage imageNamed:[NSString stringWithFormat:@"%@_selected",imageName]];
    
    if ([style isEqualToString:@"Plein"]) {
        vc.tableViewStyle = 0;
    }else if ([style isEqualToString:@"Grouped"]){
        vc.tableViewStyle = 1;
    }
    
    TSNavigationController *nav = [[TSNavigationController alloc] initWithRootViewController:vc];
    
    return nav;
}












@end
