//
//  TSTestController.m
//  VolDuTemps
//
//  Created by Zhuangwei PENG on 2017/10/13.
//  Copyright © 2017年 Zhuangwei PENG. All rights reserved.
//

#import "TSTestController.h"
#import "TSPhotoViewerController.h"

@interface TSTestController ()

//@property (nonatomic, weak) TSAddPhoto *photoView;

@end

@implementation TSTestController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeContactAdd];
    button.center = self.view.center;
    [self.view addSubview:button];
    
    [button addTarget:self action:@selector(displayPics) forControlEvents:UIControlEventTouchUpInside];
    
}
- (void)displayPics{
    TSPhotoViewerController *displayVC = [[TSPhotoViewerController alloc] init];
    
    UIImage *image = [UIImage imageNamed:@"Mark_43"];
    
    NSArray *arr = @[image,image,image];
    displayVC.picsToDisplay = arr;
    [self pushViewController:displayVC animated:YES];
    
//    [self.navigationController pushViewController:displayVC animated:YES];
}

@end
