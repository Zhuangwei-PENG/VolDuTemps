//
//  TSHomeViewController.m
//  VolDuTemps
//
//  Created by Zhuangwei PENG on 2017/10/9.
//  Copyright © 2017年 Zhuangwei PENG. All rights reserved.
//

#import "TSHomeViewController.h"
#import "TSAddViewController.h"

#import "TSTableViewCell.h"
#import "TSDairyModel.h"
#import "Addition.h"

@interface TSHomeViewController ()<TSAddViewControllerDelegate>

@property (nonatomic, strong) NSMutableArray *notes;

@property (nonatomic, strong) UIView *videView;

@end

@implementation TSHomeViewController

static const NSString *cellID = @"TSTableViewCell";
//
- (NSMutableArray *)notes {
    if (!_notes){
//        NSString *path = [@"notes" appendDocumentsPath];
//        [NSMutableArray arrayWithContentsOfFile:path];
        _notes = [NSMutableArray arrayWithCapacity:4];
        
    }
    return _notes;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)setupUI{
    [super setupUI];
    self.navigationItem.title = @"笔记列表📒";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addNewOne)];
    
    [self setupTableView];
//    self.notes != nil ? [self setupTableView] : [self setupVideView];
    
}

//设置空视图
- (void)setupVideView{
    //创建空视图
    self.videView = [[UIView alloc] initWithFrame:self.view.bounds];
    [self.view insertSubview:self.videView belowSubview:self.navigationController.navigationBar];
    
    //创建按钮
    UIButton *initialBtn = [[UIButton alloc] init];
    [self.videView addSubview:initialBtn];
    
    //测试颜色
//    vide.backgroundColor = [UIColor yellowColor];
//    initialBtn.backgroundColor = [UIColor redColor];
    
    //设置按钮
    [initialBtn setTitle:@"开始" forState:UIControlStateNormal];
    [initialBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    initialBtn.frame = CGRectMake(0, 200, self.view.bounds.size.width, 30);
    
    //添加按钮监听事件
    [initialBtn addTarget:self action:@selector(addNewOne) forControlEvents:UIControlEventTouchUpInside];
}

//设置tableView视图
- (void)setupTableView{
    [super setupTableView];
    //注册tableview Cell
    [self.myTableView registerClass:[TSTableViewCell class] forCellReuseIdentifier:@"TSTableViewCell"];
    //设置tableview行高
    self.myTableView.rowHeight = 100;
}

#pragma mark - Navigation
- (void)modefyDetailViewWith:(TSDairyModel *)sender{
    NSLog(@"修改日记");
    
    TSAddViewController *detailView = [TSAddViewController detailViewWithData:sender successBlock:^(TSDairyModel *modifiedModel) {
        [self.myTableView reloadRowsAtIndexPaths:@[modifiedModel.index] withRowAnimation:UITableViewRowAnimationNone];
    }];

    [self pushDetailView:detailView];
}

- (void)addNewOne{
    NSLog(@"添加新日记");
    TSAddViewController *addVC = [TSAddViewController detailView];
    addVC.delegate = self;
    [self pushDetailView:addVC];
}

- (void)pushDetailView:(TSDetailViewController *)controller{
    [self.navigationController pushViewController:controller animated:YES];
}


#pragma mark - DataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.notes.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TSTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TSTableViewCell" forIndexPath:indexPath];
    TSDairyModel *model = self.notes[indexPath.row];
    cell.dairyModel = model;
//    cell.backgroundColor = [UIColor redColor];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    TSDairyModel *model = self.notes[indexPath.row];
    model.index = indexPath;
    [self modefyDetailViewWith:model];
}

#pragma mark - Delegate
- (void)TSAddViewController: (TSAddViewController *)TSAddViewController dairy: (TSDairyModel *)dairyModel{
    
    [self.notes addObject:dairyModel];
    [self.myTableView reloadData];
    if (self.videView) {
        [self.videView removeFromSuperview];
    }
}

@end
