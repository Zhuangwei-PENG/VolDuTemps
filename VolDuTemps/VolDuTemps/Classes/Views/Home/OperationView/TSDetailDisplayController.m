//
//  TSDetailDisplayController.m
//  VolDuTemps
//
//  Created by Zhuangwei PENG on 2017/10/16.
//  Copyright © 2017年 Zhuangwei PENG. All rights reserved.
//

#import "TSDetailDisplayController.h"
#import "TSModifyViewController.h"
#import "TSDetailViewCell.h"
#import "Addition.h"

@interface TSDetailDisplayController ()<TSModifyViewControllerDelegate>
@property (nonatomic, assign) CGFloat heightOfCell;
@end

@implementation TSDetailDisplayController
- (NSArray *)cells{
    if (!_cells) {
        _cells = [NSArray array];
    }
    return _cells;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"修改" fontSize:15 target:self action:@selector(editDairy) isPopBack:NO];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" fontSize:16 target:self action:@selector(popBack) isPopBack:YES];
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

- (void)popBack{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)editDairy {
    TSModifyViewController *modifyVC = [TSModifyViewController detailView];
    modifyVC.delegate = self;
    
    //将展示的模型，传递给修改页面
    modifyVC.dairyModelToModify = self.cells[0];
    NSLog(@"%@",self.cells[0]);
    [self.navigationController pushViewController:modifyVC animated:NO];
    
}
#pragma mark - Delegate
- (void)TSModifyViewController: (TSModifyViewController *)TSModifyViewController{
    [self.tableView reloadData];
    if ([self.delegate respondsToSelector:@selector(TSDetailDisplayController:)]) {
        [self.delegate TSDetailDisplayController:self];
    }
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.cells.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TSDetailViewCell *cell = [TSDetailViewCell cellWithTableView:tableView dairyModel:self.cells[indexPath.row]];

    self.heightOfCell = cell.heightOfCell;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return self.heightOfCell;
}

#pragma mark - Table view Delegate
- (BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath{
    return NO;
}

@end
