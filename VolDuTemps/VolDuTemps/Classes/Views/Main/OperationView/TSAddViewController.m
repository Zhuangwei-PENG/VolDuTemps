//
//  TSAddViewController.m
//  VolDuTemps
//
//  Created by Zhuangwei PENG on 2017/10/9.
//  Copyright © 2017年 Zhuangwei PENG. All rights reserved.
//

#import "TSAddViewController.h"
#import "Addition.h"

@interface TSAddViewController ()

@end

@implementation TSAddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

- (TSDairyModel *)saveData{
    
    if ([self.delegate respondsToSelector:@selector(TSAddViewController:dairy:)]) {
        TSDairyModel *model = [super saveData];
        [self.delegate TSAddViewController:self dairy:model];
    }
    [self popViewController];
    
    return nil;
}

- (void)popBack{
    //如果时新建页面，只要有一个不为空，返回时提示是否保存
    TSDairyModel *model = [super saveData];
    if ([model.title isVoid] && [model.text isVoid] && [model.time isVoid]) {
        [self popViewController];
    }else{
        [super popBack];
    }
}

- (void)popViewController{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
