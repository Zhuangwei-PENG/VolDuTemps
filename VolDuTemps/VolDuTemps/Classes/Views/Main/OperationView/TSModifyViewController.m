//
//  TSModifyViewController.m
//  VolDuTemps
//
//  Created by Zhuangwei PENG on 2017/10/9.
//  Copyright © 2017年 Zhuangwei PENG. All rights reserved.
//

#import "TSModifyViewController.h"

@interface TSModifyViewController ()

@property (nonatomic, strong) UIBarButtonItem *modifyBtn;

@end

@implementation TSModifyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //显示原本数据
    self.titleField.text = self.dairyModelToModify.title;
    self.textField.text = self.dairyModelToModify.text;
    self.dateField.text = self.dairyModelToModify.time;
    
    self.titleField.userInteractionEnabled = NO;
    self.textField.userInteractionEnabled = NO;
    self.dateField.userInteractionEnabled = NO;
    
    self.rightButton = [[UIBarButtonItem alloc] initWithTitle:@"修改" style:UIBarButtonItemStylePlain target:self action:@selector(modify)];
    self.navigationItem.rightBarButtonItem = self.rightButton;

}
- (void)modify{
    self.titleField.userInteractionEnabled = !self.titleField.userInteractionEnabled;
    self.textField.userInteractionEnabled = !self.textField.userInteractionEnabled;
    self.dateField.userInteractionEnabled = !self.dateField.userInteractionEnabled;
    
    if ([self.rightButton.title isEqualToString:@"保存"]) {
        [self saveData];
    }
    
    self.textField.userInteractionEnabled ? [self.rightButton setTitle:@"保存"] : [self.rightButton setTitle:@"修改"];
}

- (TSDairyModel *)saveData{
    
    if ([self.delegate respondsToSelector:@selector(TSModifyViewController:)]) {
        self.dairyModelToModify = [super saveData];
        [self.delegate TSModifyViewController:self];
    }
    [self.navigationController popViewControllerAnimated:YES];
    
    return nil;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
