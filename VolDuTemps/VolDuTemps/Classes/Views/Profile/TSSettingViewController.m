//
//  TSSettingViewController.m
//  VolDuTemps
//
//  Created by Zhuangwei PENG on 2017/10/11.
//  Copyright © 2017年 Zhuangwei PENG. All rights reserved.
//

#import "TSSettingViewController.h"
#import "TSTableViewCell.h"
#import "Addition.h"

#define kHeightOfCell 60

@interface TSSettingViewController ()
@property (nonatomic, strong) UIView *fontView;
@property (nonatomic, strong) UISlider *slider;
@property (nonatomic, strong) UIButton *confirmBtn;
@property (nonatomic, strong) UIButton *cancelBtn;
@property (nonatomic, strong) TSTableViewCell *modelCell;
@end

@implementation TSSettingViewController
- (TSTableViewCell *)modelCell{
    if (!_modelCell) {
        _modelCell = [[TSTableViewCell alloc] init];
        _modelCell.dairyModel = [TSDairyModel dairyModelWithTitle:@"日记" text:@"这是一个日记范例" time:@"2017-10-10"];
    }
    return _modelCell;
}

- (UIButton *)confirmBtn{
    if (!_confirmBtn) {
        _confirmBtn = [[UIButton alloc] init];
        
        [_confirmBtn setTitle:@"确定" forState:UIControlStateNormal];
        [_confirmBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _confirmBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [_confirmBtn sizeToFit];
    }
    return _confirmBtn;
}

- (UIButton *)cancelBtn{
    if (!_cancelBtn) {
        _cancelBtn = [[UIButton alloc] init];
        [_cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
        [_cancelBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _cancelBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [_cancelBtn sizeToFit];
    }
    return _cancelBtn;
}

- (UISlider *)slider{
    if (!_slider) {
        _slider = [[UISlider alloc] init];
        _slider.maximumValue = 18.0;
        _slider.minimumValue = 12.0;
        _slider.value = 15.0;
        _slider.continuous = NO;
    }
    return _slider;
}

- (UIView *)fontView{
    if (!_fontView) {
        _fontView = [[UIView alloc] init];
        _fontView.backgroundColor = [UIColor colorWithHex:0xEDEDED];
    }
    return _fontView;
}

- (void)viewDidLoad {

    [super viewDidLoad];
    

    
    self.navigationItem.title = @"设置";
    TSSettingItem *font = [TSSettingItem itemWithTitle:@"字体大小"];
    TSSettingItem *bgImage = [TSSettingItem itemWithTitle:@"背景图片"];
    TSSettingGroup *settingGroupOne = [TSSettingGroup groupWithItems:@[font, bgImage]];
    [self.groups addObject:settingGroupOne];
    
    font.option = ^{
        [self.view addSubview:self.fontView];
    };
    
    [self.fontView addSubview:self.modelCell];
    [self.fontView addSubview:self.confirmBtn];
    [self.fontView addSubview:self.cancelBtn];
    [self.fontView addSubview:self.slider];
    
    CGFloat kScreenW = [UIScreen mainScreen].bounds.size.width;
    CGFloat kScreenH = [UIScreen mainScreen].bounds.size.height;
    CGFloat H = kScreenH * 0.5;
    CGFloat Y = kScreenH - H;
    
    self.fontView.frame = CGRectMake(0, Y, kScreenW, H);
    self.slider.frame = CGRectMake(kScreenW * 0.1, H * 0.4, kScreenW * 0.8, 20);
    self.modelCell.frame = CGRectMake(0, 0, kScreenW, kHeightOfCell);
    
    self.confirmBtn.frame = CGRectMake(self.slider.frame.origin.x + self.slider.frame.size.width - 40, self.slider.frame.origin.y +self.slider.frame.size.height,60, 40);
    
    self.cancelBtn.frame = CGRectMake(self.slider.frame.origin.x, self.confirmBtn.frame.origin.y, 60, 40);
    
    [self.confirmBtn addTarget:self action:@selector(confirm) forControlEvents:UIControlEventTouchUpInside];
    [self.cancelBtn addTarget:self action:@selector(cancel) forControlEvents:UIControlEventTouchUpInside];
    [self.slider addTarget:self action:@selector(sliderChanged) forControlEvents:UIControlEventValueChanged];
}
- (void)sliderChanged{
    self.modelCell.titleFont = self.slider.value;
}

- (void)confirm{
    self.fontSize = self.slider.value;
    [self.fontView removeFromSuperview];
}

- (void)cancel{
    [self.fontView removeFromSuperview];
}


- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    [self.fontView removeFromSuperview];
    NSLog(@"%@",self.fontView);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
//
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Incomplete implementation, return the number of sections
//    return 0;
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete implementation, return the number of rows
//    return 0;
//}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
