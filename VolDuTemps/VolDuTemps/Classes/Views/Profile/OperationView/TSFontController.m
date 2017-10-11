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

@end

@implementation TSFontController

static const CGFloat margin = 8;
static NSString *kFont = @"myFontSize";

#pragma mark - Lazy instantiation
- (UIButton *)defaultBtn{
    if (!_defaultBtn) {
        _defaultBtn = [[UIButton alloc] init];
        [_defaultBtn setTitle:@"默认大小" forState:UIControlStateNormal];
        [_defaultBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _defaultBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    }
    return _defaultBtn;
}

- (TSTableViewCell *)modelCell{
    if (!_modelCell) {
        _modelCell = [[TSTableViewCell alloc] init];
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
    [self setupBarButton];
    [self addModelCell];
    [self addSlider];
    [self addDefaultBtn];

}
- (void)setupBarButton{
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"取消" fontSize:16 target:self action:@selector(popBack) isPopBack:YES];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"完成" fontSize:16 target:self action:@selector(confirm) isPopBack:NO];
}

- (void)addModelCell{
    [self.view addSubview:self.modelCell];
    self.modelCell.frame = CGRectMake(0, 64,  self.view.bounds.size.width, 100);

}

- (void)addSlider{
    [self.view addSubview:self.slider];
    
    CGFloat Y = self.modelCell.frame.origin.y + self.modelCell.frame.size.height + margin;
    CGFloat W = self.view.bounds.size.width - 2 * margin;
    self.slider.frame = CGRectMake(margin, Y, W, 20);
    
    self.slider.value = [[NSUserDefaults standardUserDefaults] floatForKey:kFont];
    [self.slider addTarget:self action:@selector(sliderChanged) forControlEvents:UIControlEventValueChanged];
}

- (void)addDefaultBtn{
    [self.view addSubview:self.defaultBtn];
    CGFloat Y = self.slider.frame.origin.y + self.slider.frame.size.height + margin;
    CGFloat W = self.view.bounds.size.width;
    self.defaultBtn.frame = CGRectMake(0, Y, W, 44);
    
    [self.defaultBtn addTarget:self action:@selector(setToDefaultValue) forControlEvents:UIControlEventTouchUpInside];
}

- (void)sliderChanged{
    self.modelCell.titleFont = self.slider.value;
}

- (void)setToDefaultValue{
    self.slider.value = 15;
    [self sliderChanged];
}

#pragma mark - Navigation
- (void)popBack{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)confirm{
    //保存数据
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setFloat:self.slider.value forKey:kFont];
    [userDefaults synchronize];
    [self popBack];
}


@end
