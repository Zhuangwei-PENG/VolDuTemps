//
//  TSAddViewController.m
//  VolDuTemps
//
//  Created by Zhuangwei PENG on 2017/10/9.
//  Copyright © 2017年 Zhuangwei PENG. All rights reserved.
//

#import "TSAddViewController.h"
#import "TSDairyModel.h"

@interface TSAddViewController ()

@end

@implementation TSAddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

- (void)saveData{
    [super saveData];
    
    if ([self.delegate respondsToSelector:@selector(TSAddViewController:dairy:)]) {
        TSDairyModel *model = [TSDairyModel dairyModelWithTitle:self.titleDetail text:self.textDetail time:self.timeDetail];
        [self.delegate TSAddViewController:self dairy:model];
    }
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

@end
