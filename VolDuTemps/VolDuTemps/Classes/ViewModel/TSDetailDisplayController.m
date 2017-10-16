//
//  TSDetailDisplayController.m
//  VolDuTemps
//
//  Created by Zhuangwei PENG on 2017/10/16.
//  Copyright © 2017年 Zhuangwei PENG. All rights reserved.
//

#import "TSDetailDisplayController.h"
#import "TSDetailViewCell.h"

@interface TSDetailDisplayController ()
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
//    self.tableView registerClass:[TSDetailViewCell class] forCellReuseIdentifier:<#(nonnull NSString *)#>
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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


@end
