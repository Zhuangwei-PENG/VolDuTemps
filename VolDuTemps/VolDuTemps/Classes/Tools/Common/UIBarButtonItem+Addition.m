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
    [btn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
    [btn sizeToFit];
    
    if (isPopback) {
        UIImage *image = [UIImage imageNamed:@"navigationbar_back_withtext"];
        [btn setImage:image forState:UIControlStateNormal];
        //设置按钮的宽度等于文字加上图片宽度 (ios 8 不显示)
        CGSize textSize = [title sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:fontSize]}];
        CGSize imageSize = image.size;
        btn.frame = CGRectMake(0, 0, textSize.width + imageSize.width, imageSize.height);
    }
    
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return [self initWithCustomView:btn];
}

@end
