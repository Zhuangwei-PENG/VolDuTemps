//
//  TSBaseViewController.m
//  VolDuTemps
//
//  Created by Zhuangwei PENG on 2017/10/9.
//  Copyright © 2017年 Zhuangwei PENG. All rights reserved.
//

#import "TSBaseViewController.h"

@interface TSBaseViewController ()

@end

@implementation TSBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupUI];
}

- (void)setupUI{
    self.view.backgroundColor = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = NO;

    [self setupTableView];
    
}
- (void)setupTableView{
    if (!self.tableViewStyle) {
        self.tableViewStyle = UITableViewStylePlain;
    }
    
    self.myTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:_tableViewStyle];
    [self.view addSubview:self.myTableView];
    self.myTableView.delegate = self;
    self.myTableView.dataSource = self;
    
    //设置缩进
//    CGFloat topInset = self.navigationController.navigationBar.bounds.size.height;
    CGFloat bottomInset = self.tabBarController.tabBar.bounds.size.height ? self.tabBarController.tabBar.bounds.size.height:49;
    self.myTableView.contentInset = UIEdgeInsetsMake(0, 0, bottomInset, 0);
}

#pragma mark - Delegate & DataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 0;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%s",__func__);
    return [[UITableViewCell alloc] init];
}

@end
