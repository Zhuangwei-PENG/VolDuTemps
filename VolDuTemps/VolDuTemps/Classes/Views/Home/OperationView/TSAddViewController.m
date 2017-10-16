//
//  TSAddViewController.m
//  VolDuTemps
//
//  Created by Zhuangwei PENG on 2017/10/9.
//  Copyright © 2017年 Zhuangwei PENG. All rights reserved.
//

#import "TSAddViewController.h"
#import "TSDetailDisplayController.h"
#import "Addition.h"

@interface TSAddViewController ()

@end

@implementation TSAddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置日期默认为当前日期
    NSDate *currentDate = [NSDate date];
    //格式化日期
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy-MM-dd";
    //将日期转换成字符串
    self.dateField.text = [formatter stringFromDate:currentDate];
    //添加修改时键盘自动弹出
    [self.titleField becomeFirstResponder];
    
}

- (TSDairyModel *)saveData{
    //从父类方法中获取创建好的模型
    TSDairyModel *model = [super saveData];
    //将模型传递给代理(HomeVC),显示在对应Cell中
    if ([self.delegate respondsToSelector:@selector(TSAddViewController:dairy:)]) {
        [self.delegate TSAddViewController:self dairy:model];
    }
    //将模型传递给显示界面
    TSDetailDisplayController *detailVC = [[TSDetailDisplayController alloc] init];
    detailVC.cells = @[model];
//    detailVC.delegate = self;
    [self.navigationController pushViewController:detailVC animated:NO];
    
    return nil;
}

- (void)popBack{
    //如果时新建页面，只要有一个不为空，返回时提示是否保存
    TSDairyModel *model = [super saveData];
    if ([model.title isVoid] && [model.text isVoid] && [model.time isVoid] && !model.pictures.count) {
        [self popViewController];
    }else{
        [super popBack];
    }
}

- (void)popViewController{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
