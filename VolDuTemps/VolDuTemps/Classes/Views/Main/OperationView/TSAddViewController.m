//
//  TSAddViewController.m
//  VolDuTemps
//
//  Created by Zhuangwei PENG on 2017/10/9.
//  Copyright © 2017年 Zhuangwei PENG. All rights reserved.
//

#import "TSAddViewController.h"

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
    
    [self.navigationController popViewControllerAnimated:YES];
    
    return nil;
}

@end
