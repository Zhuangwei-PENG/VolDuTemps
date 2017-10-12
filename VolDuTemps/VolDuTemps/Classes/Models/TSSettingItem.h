//
//  TSSettingItem.h
//  VolDuTemps
//
//  Created by Zhuangwei PENG on 2017/10/10.
//  Copyright © 2017年 Zhuangwei PENG. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^settingOption) (void);

@interface TSSettingItem : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *image;
@property (nonatomic, copy) NSString *subTitle;

@property (nonatomic, assign) Class destinationVC;
@property (nonatomic, copy) settingOption option;

+ (instancetype)itemWithTitle:(NSString *)title image:(NSString *)image subTitle:(NSString *)subTitle;
+ (instancetype)itemWithTitle:(NSString *)title image:(NSString *)image;
+ (instancetype)itemWithTitle:(NSString *)title;

@end
