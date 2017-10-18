//
//  UIImage+Addition.m
//  VolDuTemps
//
//  Created by Zhuangwei PENG on 2017/10/10.
//  Copyright © 2017年 Zhuangwei PENG. All rights reserved.
//

#import "UIImage+Additions.h"

@implementation UIImage (Additions)

- (UIImage *)tintImageWithColor:(UIColor *)tintColor {
    UIGraphicsBeginImageContextWithOptions(self.size, NO, [[UIScreen mainScreen] scale]);
    CGContextRef context = UIGraphicsGetCurrentContext();

    CGContextTranslateCTM(context, 0, self.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);

    CGRect rect = CGRectMake(0, 0, self.size.width, self.size.height);

    CGContextSetBlendMode(context, kCGBlendModeNormal);
    CGContextDrawImage(context, rect, self.CGImage);

    CGContextSetBlendMode(context, kCGBlendModeSourceIn);
    [tintColor setFill];
    CGContextFillRect(context, rect);

    UIImage *coloredImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return coloredImage;
}

+ (UIImage *)imageWithColor:(UIColor *)color {
    UIImage *img = [UIImage imageWithColor:color size:CGSizeMake(1, 1)];
    return img;
}

- (void)c {
    UIButton *btn;
    [btn setBackgroundImage:[UIImage imageWithColor:[UIColor redColor]] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageWithColor:[UIColor blueColor]] forState:UIControlStateHighlighted];
}

+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size {
    CGRect rect = CGRectMake(0.0f, 0.0f, size.width, size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();

    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);

    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return image;
}

// 获取屏幕截图
+ (UIImage *)getScreenSnap {
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    
    // 打开上下文
    UIGraphicsBeginImageContextWithOptions(window.bounds.size, false, 0);
    
    //将window的内容渲染到上下文中
    [window drawViewHierarchyInRect:window.bounds afterScreenUpdates:false];
    
    //获取上下文种的图片
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    // 关闭上下文
    UIGraphicsEndImageContext();
    
    return image;
}

// 缩放
- (UIImage *)scaleToWidth:(CGFloat)width {
    if (self.size.width <= width) {
        return self;
    }
    
    CGFloat height = self.size.height * (width / self.size.width);
    CGRect rect = CGRectMake(0, 0, width, height);
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, [UIScreen mainScreen].scale);
    [self drawInRect:rect];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

+ (UIImage *)getCompositeImageWith:(NSArray<UIImage *>*)images width:(CGFloat)width margin:(CGFloat)margin{
    CGFloat w = (width - 3 * margin) * 0.5;
    UIView *compositeView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, width, width)];
    compositeView.layer.cornerRadius = margin;
    compositeView.layer.masksToBounds = YES;
    int i = 0;
    if (images.count == 4) {
        for (UIImage *image in images) {
            UIImageView *imageView =[[UIImageView alloc] initWithImage:[image scaleToWidth:w]];
            imageView.frame = CGRectMake(margin + (w + margin) * (i % 2), margin + (w + margin) * (i / 2), w, w);
            
            [compositeView addSubview:imageView];
            i++;
        }
    }else if (images.count == 3) {
        for (UIImage *image in images) {
            UIImageView *imageView =[[UIImageView alloc] initWithImage:[image scaleToWidth:w]];
            if (i == 0) {
                imageView.frame = CGRectMake((width - w) * 0.5, margin + (w + margin) * (i / 2), w, w);
            }else{
                imageView.frame = CGRectMake( margin + (w + margin) * (i - 1), w + 2 * margin, w, w);
            }
            
            [compositeView addSubview:imageView];
            i++;
        }
    }else if (images.count == 2) {
        for (UIImage *image in images) {
            UIImageView *imageView =[[UIImageView alloc] initWithImage:[image scaleToWidth:w]];
            if (i == 0) {
                imageView.frame = CGRectMake(margin, margin, w, w);
            }else{
                imageView.frame = CGRectMake(w + 2 * margin, w + 2 * margin, w, w);
            }
            
            [compositeView addSubview:imageView];
            i++;
        }
    }else if (images.count == 1) {
        for (UIImage *image in images) {
            UIImageView *imageView =[[UIImageView alloc] initWithImage:[image scaleToWidth:width]];
            imageView.frame = CGRectMake(0, 0, width, width);
            
            [compositeView addSubview:imageView];
            i++;
        }
    }
    return [[self alloc] convertViewToImage:compositeView];
}

- (UIImage*)convertViewToImage:(UIView*)view{
    CGSize size = view.bounds.size;
    // 下面方法，第一个参数表示区域大小。第二个参数表示是否是非透明的。如果需要显示半透明效果，需要传NO，否则传YES。第三个参数就是屏幕密度了
    UIGraphicsBeginImageContextWithOptions(size, NO, [UIScreen mainScreen].scale);
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage*image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}
@end
