//
//  TSSettingItem.m
//  VolDuTemps
//
//  Created by Zhuangwei PENG on 2017/10/10.
//  Copyright © 2017年 Zhuangwei PENG. All rights reserved.
//

#import "TSSettingItem.h"

@implementation TSSettingItem

+ (instancetype)itemWithTitle:(NSString *)title image:(NSString *)image subTitle:(NSString *)subTitle{
    return [[self alloc] initWithTitle:title image:image subTitle:subTitle];
}

+ (instancetype)itemWithTitle:(NSString *)title image:(NSString *)image{
    return [[self alloc] initWithTitle:title image:image subTitle:nil];
}

+ (instancetype)itemWithTitle:(NSString *)title{
    return [[self alloc] initWithTitle:title image:nil subTitle:nil];
}

- (instancetype)initWithTitle:(NSString *)title image:(NSString *)image subTitle:(NSString *)subTitle{
    if (self = [self init]) {
        self.title = title;
        self.image = image;
        self.subTitle = subTitle;
    }
    return self;
}

@end
