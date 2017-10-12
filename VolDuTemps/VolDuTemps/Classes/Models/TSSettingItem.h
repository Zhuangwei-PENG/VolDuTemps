//
//  TSSettingItem.h
//  VolDuTemps
//
//  Created by Zhuangwei PENG on 2017/10/10.
//  Copyright © 2017年 Zhuangwei PENG. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^settingOption) (void);

@interface TSSettingItem : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, strong) UIImage *image;
@property (nonatomic, copy) NSString *subTitle;

@property (nonatomic, assign) Class destinationVC;
@property (nonatomic, copy) settingOption option;

+ (instancetype)itemWithTitle:(NSString *)title image:(UIImage *)image subTitle:(NSString *)subTitle;
+ (instancetype)itemWithTitle:(NSString *)title image:(UIImage *)image;
+ (instancetype)itemWithTitle:(NSString *)title;

@end
