//
//  UIImage+Addition.m
//  VolDuTemps
//
//  Created by Zhuangwei PENG on 2017/10/10.
//  Copyright © 2017年 Zhuangwei PENG. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Additions)

- (UIImage *)tintImageWithColor:(UIColor *)tintColor;
+ (UIImage *)imageWithColor:(UIColor *)color;
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;

+ (UIImage *)getScreenSnap;
- (UIImage *)scaleToWidth:(CGFloat)width;
+ (UIImage *)getCompositeImageWith:(NSArray<UIImage *>*)images width:(CGFloat)width margin:(CGFloat)margin;
- (UIImage*)convertViewToImage:(UIView*)view;
@end
