//
//  UIBarButtonItem+Addition.m
//  VolDuTemps
//
//  Created by Zhuangwei PENG on 2017/10/10.
//  Copyright © 2017年 Zhuangwei PENG. All rights reserved.
//

#import "UIBarButtonItem+Addition.h"

@implementation UIBarButtonItem (Addition)

- (instancetype)initWithTitle:(NSString *)title fontSize:(CGFloat)fontSize target:(id)target action:(SEL)action isPopBack:(BOOL)isPopback{
    
    UIButton *btn = [[UIButton alloc] init];
    [btn setTitle:title forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:fontSize];
    [btn setTitleColor:[UIColor darkTextColor] forState:UIControlStateNormal];
    [btn sizeToFit];
    
    if (isPopback) {
        [btn setImage:[UIImage imageNamed:@"navigationbar_back_withtext"] forState:UIControlStateNormal];
    }
    
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return [self initWithCustomView:btn];
}

@end
