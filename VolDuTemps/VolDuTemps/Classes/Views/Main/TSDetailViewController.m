//
//  TSDetailViewController.m
//  VolDuTemps
//
//  Created by Zhuangwei PENG on 2017/10/9.
//  Copyright © 2017年 Zhuangwei PENG. All rights reserved.
//

#import "TSDetailViewController.h"

@interface TSDetailViewController ()

@property (nonatomic, copy) NSString *titleDetail;
@property (nonatomic, copy) NSString *textDetail;
@property (nonatomic, copy) NSString *timeDetail;

@end

@implementation TSDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
}

+ (instancetype)detailView{
    
    TSDetailViewController *detailView = [[self alloc] init];
    
    detailView.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"保存" style:UIBarButtonItemStylePlain target:self action:@selector(saveData)];
    
    UITextField *titleField = [[UITextField alloc] initWithFrame:CGRectMake(0, 70, [UIScreen mainScreen].bounds.size.width, 30)];
    titleField.placeholder = @"标题";
    
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(0, 110, [UIScreen mainScreen].bounds.size.width, 200)];
    titleField.placeholder = @"内容";
    
    [detailView.view addSubview:titleField];
    [detailView.view addSubview:textField];
    
    return detailView;
}

+ (instancetype)detailViewWithData:(TSDairyModel *)data successBlock: (void(^)(TSDairyModel *modifiedModel))successBlock{
    TSDetailViewController *detailView = [self detailView];
    
    detailView.titleDetail = data.title;
    detailView.textDetail = data.text;
    detailView.timeDetail = data.time;
    
    
    
    return detailView;
}

- (void)saveData{
    NSLog(@"保存数据");
    [self.navigationController popViewControllerAnimated:YES];
    
}
@end
