//
//  TSSettingItem.m
//  VolDuTemps
//
//  Created by Zhuangwei PENG on 2017/10/10.
//  Copyright © 2017年 Zhuangwei PENG. All rights reserved.
//

#import "TSSettingItem.h"

@implementation TSSettingItem

+ (instancetype)itemWithTitle:(NSString *)title image:(NSString *)image{
    TSSettingItem *item = [[self alloc] initWithTitle:title];
    item.image = image;
    return item;
}

+ (instancetype)itemWithTitle:(NSString *)title{
    return [[self alloc] initWithTitle:title];
}

- (instancetype)initWithTitle:(NSString *)title{
    if (self = [self init]) {
        self.title = title;
    }
    return self;
}
@end
