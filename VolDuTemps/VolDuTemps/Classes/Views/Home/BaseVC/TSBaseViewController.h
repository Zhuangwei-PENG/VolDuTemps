//
//  TSBaseViewController.h
//  VolDuTemps
//
//  Created by Zhuangwei PENG on 2017/10/9.
//  Copyright © 2017年 Zhuangwei PENG. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Addition.h"

@interface TSBaseViewController : UIViewController <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, assign) UITableViewStyle tableViewStyle;
@property (nonatomic, strong) UITableView *myTableView;
- (void)setupUI;
- (void)setupTableView;

@end
