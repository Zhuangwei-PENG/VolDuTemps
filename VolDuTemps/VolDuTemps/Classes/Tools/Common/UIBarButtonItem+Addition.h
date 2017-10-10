//
//  UIBarButtonItem+Addition.h
//  VolDuTemps
//
//  Created by Zhuangwei PENG on 2017/10/10.
//  Copyright © 2017年 Zhuangwei PENG. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Addition)

- (instancetype)initWithTitle:(NSString *)title fontSize:(CGFloat)fontSize target:(id)target action:(SEL)action isPopBack:(BOOL)isPopback;

@end
