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
#import "Addition.h"

@interface TSHomeViewController ()

@property (nonatomic, strong) NSMutableArray *notes;

@end

@implementation TSHomeViewController

static const NSString *cellID = @"TSTableViewCell";
//
- (NSMutableArray *)notes {
    if (!_notes){
        NSString *path = [@"notes" appendDocumentsPath];
        _notes = [NSMutableArray arrayWithContentsOfFile:path];
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
    
    self.notes != nil ? [self setupTableView] : [self setupVideView];
    
}

//设置空视图
- (void)setupVideView{
    //创建空视图
    UIView *vide = [[UIView alloc] initWithFrame:self.view.bounds];
    [self.view insertSubview:vide belowSubview:self.navigationController.navigationBar];
    
    //创建按钮
    UIButton *initialBtn = [[UIButton alloc] init];
    [vide addSubview:initialBtn];
    
    //测试颜色
//    vide.backgroundColor = [UIColor yellowColor];
//    initialBtn.backgroundColor = [UIColor redColor];
    
    //设置按钮
    [initialBtn setTitle:@"开始" forState:UIControlStateNormal];
    initialBtn.frame = CGRectMake(0, 200, self.view.bounds.size.width, 30);
    
    //添加按钮监听事件
    [initialBtn addTarget:self action:@selector(addNewOne) forControlEvents:UIControlEventTouchUpInside];
}

//设置tableView视图
- (void)setupTableView{
    //注册tableview Cell
    [self.myTableView registerClass:[TSTableViewCell class] forCellReuseIdentifier:@"TSTableViewCell"];
    //设置tableview行高
    self.myTableView.rowHeight = 100;
}

- (void)modefyDetailViewWith:(TSDairyModel *)sender{
    NSLog(@"修改日记");
    [self pushDetailView: [TSDetailViewController detailViewWithData:[TSDairyModel new] successBlock:^(TSDairyModel *modifiedModel) {
        
        [self.myTableView reloadRowsAtIndexPaths:@[modifiedModel.index] withRowAnimation:UITableViewRowAnimationNone];
    }]];
}

- (void)addNewOne{
    NSLog(@"添加新日记");
    [self pushDetailView:[TSDetailViewController detailView]];
}

- (void)pushDetailView:(TSDetailViewController *)controller{
    [self.navigationController pushViewController:controller animated:YES];
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
