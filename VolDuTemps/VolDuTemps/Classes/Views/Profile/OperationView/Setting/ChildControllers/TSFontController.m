//
//  TSFontController.m
//  VolDuTemps
//
//  Created by Zhuangwei PENG on 2017/10/11.
//  Copyright © 2017年 Zhuangwei PENG. All rights reserved.
//

#import "TSFontController.h"
#import "TSTableViewCell.h"
#import "Addition.h"
//#import <QuartzCore/QuartzCore.h>

@interface TSFontController ()

@property (nonatomic, strong) TSTableViewCell *modelCell;
@property (nonatomic, strong) UISlider *slider;
@property (nonatomic, strong) UIButton *defaultBtn;

@property (nonatomic, strong) NSUserDefaults *userDefault;

@end

@implementation TSFontController

#pragma mark - Lazy instantiation
- (NSUserDefaults *)userDefault{
    if (!_userDefault) {
        _userDefault =[NSUserDefaults standardUserDefaults];
    }
    return _userDefault;
}

- (UIButton *)defaultBtn{
    if (!_defaultBtn) {
        _defaultBtn = [[UIButton alloc] init];
        [_defaultBtn setTitle:@"默认大小" forState:UIControlStateNormal];
        [_defaultBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _defaultBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    }
    return _defaultBtn;
}

- (TSTableViewCell *)modelCell{
    if (!_modelCell) {
        _modelCell = [[TSTableViewCell alloc] init];
        _modelCell.accessoryType = UITableViewCellAccessoryNone;
        _modelCell.dairyModel = [TSDairyModel dairyModelWithTitle:@"预览字体大小" text:@"拖动下面的滑块，可设置字体的大小" time:@"2017-1-1"];
    }
    return _modelCell;
}

- (UISlider *)slider{
    if (!_slider) {
        _slider = [[UISlider alloc] init];
        _slider.maximumValue = 18.0;
        _slider.minimumValue = 12.0;
        _slider.continuous = NO;
    }
    return _slider;
}

#pragma mark - SetUp UI
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithHex:0xEDEDED];
    [self setupBarButton];
    [self addModelCell];
    [self addSlider];
    [self addDefaultBtn];

}
- (void)setupBarButton{
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"取消" fontSize:16 target:self action:@selector(popBack) isPopBack:NO];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"完成" fontSize:16 target:self action:@selector(confirm) isPopBack:NO];
}

- (void)addModelCell{
    [self.view addSubview:self.modelCell];
    self.modelCell.frame = CGRectMake(0, kTopInset, kScreenW, kRowHeight);
    self.modelCell.userFont = [self.userDefault floatForKey:kUserFontKey];
}

- (void)addSlider{
    [self.view addSubview:self.slider];
    
    CGFloat Y = CGRectGetMaxY(self.modelCell.frame) + 5 * kMargin;
    CGFloat W = kScreenW - 2 * kMargin;
    self.slider.frame = CGRectMake(kMargin, Y, W, 2 *kMargin);
    
    self.slider.value = [[NSUserDefaults standardUserDefaults] floatForKey:kUserFontKey];
    [self.slider addTarget:self action:@selector(sliderChanged) forControlEvents:UIControlEventValueChanged];
}

- (void)addDefaultBtn{
    [self.view addSubview:self.defaultBtn];
    CGFloat Y = CGRectGetMaxY(self.slider.frame) + kMargin;
    self.defaultBtn.frame = CGRectMake(0, Y, kScreenW, 44);
    
    [self.defaultBtn addTarget:self action:@selector(setToDefaultValue) forControlEvents:UIControlEventTouchUpInside];
}

- (void)sliderChanged{
    self.modelCell.userFont = self.slider.value;
}

- (void)setToDefaultValue{
    self.slider.value = 14;
    [self sliderChanged];
}

#pragma mark - Navigation
- (void)popBack{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)confirm{
    //保存数据
    [self.userDefault setFloat:self.slider.value forKey:kUserFontKey];
    [self.userDefault synchronize];
    [self popBack];
}


@end
