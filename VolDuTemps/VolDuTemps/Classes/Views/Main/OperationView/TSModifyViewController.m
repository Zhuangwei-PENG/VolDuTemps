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
    // Do any additional setup after loading the view.
    self.titleField.text = self.dairyModelToModify.title;
    self.textField.text = self.dairyModelToModify.text;
}
- (void)saveData{
    [super saveData];
    if ([self.delegate respondsToSelector:@selector(TSModifyViewController:)]) {
        self.dairyModelToModify.title = self.titleDetail;
        self.dairyModelToModify.text = self.textDetail;
        [self.delegate TSModifyViewController:self];
    }
    [self.navigationController popViewControllerAnimated:YES];
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
