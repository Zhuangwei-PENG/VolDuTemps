//
//  TSModifyViewController.m
//  VolDuTemps
//
//  Created by Zhuangwei PENG on 2017/10/9.
//  Copyright © 2017年 Zhuangwei PENG. All rights reserved.
//

#import "TSModifyViewController.h"

@interface TSModifyViewController ()


@end

@implementation TSModifyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //显示原本数据
    self.titleField.text = self.dairyModelToModify.title;
    self.textField.text = self.dairyModelToModify.text;
    self.dateField.text = self.dairyModelToModify.time;
    self.photoView.pics = self.dairyModelToModify.pictures.mutableCopy;
    
    //显示标题
    self.navigationItem.title = @"修改日记";
    //修改时键盘自动弹出
    [self.titleField becomeFirstResponder];
    self.navigationItem.rightBarButtonItem =  [[UIBarButtonItem alloc] initWithTitle:@"完成" fontSize:15 target:self action:@selector(finishedEditing) isPopBack:NO];

}
- (void)finishedEditing{
    self.view.userInteractionEnabled = NO;
    [self saveData];
}

- (TSDairyModel *)saveData{
    
    if ([self.delegate respondsToSelector:@selector(TSModifyViewController:)]) {
        TSDairyModel *model = [super saveData];
        self.dairyModelToModify.title = model.title;
        self.dairyModelToModify.text = model.text;
        self.dairyModelToModify.time = model.time;
        self.dairyModelToModify.pictures = model.pictures;
        
        [self.delegate TSModifyViewController:self];
    }
    [self.navigationController popViewControllerAnimated:NO];
    
    return nil;
}

- (void)popBack{
//如果是修改页面，有一个位置修改了，返回时提示是否保存
    TSDairyModel *model = [super saveData];
    
    if ([model isSameTo:self.dairyModelToModify]) {
        [self.navigationController popViewControllerAnimated:YES];
    }else{
        [super popBack];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    NSLog(@"内存警告");
}


@end
