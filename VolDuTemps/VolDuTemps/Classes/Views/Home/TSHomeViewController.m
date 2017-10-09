//
//  TSHomeViewController.m
//  VolDuTemps
//
//  Created by Zhuangwei PENG on 2017/10/9.
//  Copyright © 2017年 Zhuangwei PENG. All rights reserved.
//

#import "TSHomeViewController.h"
#import "TSTableViewCell.h"
#import "TSDetailViewController.h"
#import "TSDairyModel.h"

@interface TSHomeViewController ()

@end

@implementation TSHomeViewController

static const NSString *cellID = @"TSTableViewCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)setupUI{
    [super setupUI];
    self.navigationItem.title = @"笔记列表📒";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addNewOne)];
    //注册tableview Cell
    [self.myTableView registerClass:[TSTableViewCell class] forCellReuseIdentifier:@"TSTableViewCell"];
    //设置tableview行高
    self.myTableView.rowHeight = 100;
    
}

- (void)modefyDetailViewWith:(TSDairyModel *)sender{
    NSLog(@"修改日记");
    [self pushDetailView];
}

- (void)addNewOne{
    NSLog(@"添加新日记");
    [self pushDetailView];
}

- (void)pushDetailView{
    [self.navigationController pushViewController:[[TSDetailViewController alloc] init] animated:YES];
}


#pragma mark - DataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TSTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TSTableViewCell" forIndexPath:indexPath];
    NSLog(@"111%s",__func__);
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self modefyDetailViewWith:[TSDairyModel new]];
}

@end
