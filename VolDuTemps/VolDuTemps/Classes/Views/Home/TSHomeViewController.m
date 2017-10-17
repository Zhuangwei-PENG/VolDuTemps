//
//  TSHomeViewController.m
//  VolDuTemps
//
//  Created by Zhuangwei PENG on 2017/10/9.
//  Copyright © 2017年 Zhuangwei PENG. All rights reserved.
//

#import "TSHomeViewController.h"
#import "TSAddViewController.h"
#import "TSModifyViewController.h"
#import "TSDetailDisplayController.h"

#import "TSTableViewCell.h"
#import "TSDairyModel.h"
#import "Addition.h"

#define kPath [@"notes" appendDocumentsPath]
#define kRowHeight 110

@interface TSHomeViewController ()<TSAddViewControllerDelegate, TSDetailDisplayControllerDelegate, UIAlertViewDelegate>

@property (nonatomic, strong) NSMutableArray *notes;

@property (nonatomic, strong) UIView *videView;

@property (nonatomic, assign) CGFloat userFontSize;

@property (nonatomic, strong) NSIndexPath *cellIndexPath;


@end

@implementation TSHomeViewController

static const NSString *cellID = @"TSTableViewCell";
#pragma mark - Lazy instantiation
- (NSMutableArray *)notes {
    if (!_notes){
        _notes = [NSMutableArray arrayWithCapacity:4];
    }
    return _notes;
}
- (UIView *)videView{
    if (!_videView) {
        _videView = [[UIView alloc] init];
    }
    return _videView;
}

- (NSIndexPath *)cellIndexPath{
    if (!_cellIndexPath) {
        _cellIndexPath = [[NSIndexPath alloc] init];
    }
    return _cellIndexPath;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

#pragma mark -SetUp UI
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self getUserSettings];
    [self.myTableView reloadData];
}

- (void)getUserSettings{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    self.userFontSize = [userDefaults floatForKey:@"myFontSize"];
}

- (void)setupUI{
    [super setupUI];
 
    self.notes = [NSKeyedUnarchiver unarchiveObjectWithFile:kPath];
    [self sorting];
    
   //根据notes是否有数据判断是否显示空页面
    if (self.notes.count == 0) {
        [self setupVideView];
    }

    self.navigationItem.title = @"日记列表📒";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addNewOne)];
    

    
    
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
    self.videView.backgroundColor = [UIColor colorWithHex:0xEDEDED];
    
    //设置按钮
    [initialBtn setTitle:@"Le temps passe vite! 开始记录吧..." forState:UIControlStateNormal];
    [initialBtn setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    initialBtn.frame = CGRectMake(0, 200, self.view.bounds.size.width, 30);
    
    //添加按钮监听事件
    [initialBtn addTarget:self action:@selector(addNewOne) forControlEvents:UIControlEventTouchUpInside];
}

//设置tableView视图
- (void)setupTableView{
    [super setupTableView];
    //测试颜色
    self.myTableView.backgroundColor = [UIColor colorWithHex:0xEDEDED];
    
    self.myTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    //注册tableview Cell
    [self.myTableView registerClass:[TSTableViewCell class] forCellReuseIdentifier:@"TSTableViewCell"];
    //设置tableview行高
//    self.myTableView.rowHeight = 100;
}

#pragma mark - Navigation
//修改日记
- (void)editDetailViewWith:(TSDairyModel *)sender{
    TSDetailDisplayController *detailVC = [[TSDetailDisplayController alloc] init];
    detailVC.cells = @[sender];
    detailVC.delegate = self;
    [self pushDetailView:detailVC];
}
//添加新日记
- (void)addNewOne{
    TSAddViewController *addVC = [TSAddViewController detailView];
    addVC.delegate = self;
    
    [self pushDetailView:addVC];
}

- (void)pushDetailView:(UIViewController *)controller{
    [self.navigationController pushViewController:controller animated:YES];
}


#pragma mark - DataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.notes.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    TSTableViewCell *cell = [TSTableViewCell tableViewCellWith:tableView dairyModel:self.notes[indexPath.row]];
    cell.titleFont = self.userFontSize;

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    TSDairyModel *model = self.notes[indexPath.row];
    [self editDetailViewWith:model];
}

#pragma mark - TableView Delegate
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

- (NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath{
    //创建左滑删除按钮
    UITableViewRowAction *deleteAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault title:@"删除" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"删除" message:@"确定要移除这篇日记吗？" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
        [alertView show];
        self.cellIndexPath = indexPath;
    }];
    //创建左滑编辑按钮
    UITableViewRowAction *editAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal title:@"编辑" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        
        [self editDetailViewWith:self.notes[indexPath.row]];
        
    }];
    editAction.backgroundColor = [UIColor colorWithHex:0xE0AD3B];
    return @[deleteAction, editAction];
}

//设置tableview行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return kRowHeight;
}


#pragma mark - TSAddViewController Delegate
- (void)TSAddViewController: (TSAddViewController *)TSAddViewController dairy: (TSDairyModel *)dairyModel{
    
    [self.notes addObject:dairyModel];
    //在这里需要对self.notes按时间排序
    [self sorting];
    [self.myTableView reloadData];
    
    [NSKeyedArchiver archiveRootObject:self.notes toFile:kPath];
    //第一次添加数据时，完成后删除空视图
    if (self.videView) {
        [self.videView removeFromSuperview];
    }
}

#pragma mark - TSDetailDisplayController Delegate
- (void)TSDetailDisplayController:(TSDetailDisplayController *)detailDisplayController{
    //在这里需要对self.notes按时间排序
    [self sorting];
    [self.myTableView reloadData];
    [NSKeyedArchiver archiveRootObject:self.notes toFile:kPath];
}

#pragma mark - AlertView Delegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 1) {
        [self.notes removeObjectAtIndex:self.cellIndexPath.row];
        [self.myTableView deleteRowsAtIndexPaths:@[self.cellIndexPath] withRowAnimation:UITableViewRowAnimationFade];
        [NSKeyedArchiver archiveRootObject:self.notes toFile:kPath];
        
        if (!self.notes.count) {
            [self setupVideView];
        }
    }
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex{
    [self.myTableView setEditing:NO animated:YES];

}

#pragma mark - Sorting self.notes
- (void)sorting{
    //按照日期排序 - 降序
    NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:@"_time" ascending:NO];
    
    NSArray *sortedArr = [self.notes.copy sortedArrayUsingDescriptors:[NSArray arrayWithObject:sort]];
    self.notes = [sortedArr mutableCopy];
    
}

@end
