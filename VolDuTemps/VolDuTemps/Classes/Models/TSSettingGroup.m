//
//  TSSettingGroup.m
//  VolDuTemps
//
//  Created by Zhuangwei PENG on 2017/10/10.
//  Copyright © 2017年 Zhuangwei PENG. All rights reserved.
//

#import "TSSettingGroup.h"

@implementation TSSettingGroup
+ (instancetype)groupWithItems:(NSArray<TSSettingItem *> *)items{
    return [[self alloc] initWithItems:items];
}

- (instancetype)initWithItems:(NSArray<TSSettingItem *> *)items{
    return [self initWithItems:items headerTitle:nil footerTitle:nil];
}

+ (instancetype)groupWithItems:(NSArray<TSSettingItem *> *)items headerTitle:(NSString *)headerTitle footerTitle:(NSString *)footerTitle{
    return [[self alloc] initWithItems:items headerTitle:headerTitle footerTitle:footerTitle];
}

- (instancetype)initWithItems:(NSArray<TSSettingItem *> *)items headerTitle:(NSString *)headerTitle footerTitle:(NSString *)footerTitle{
    if (self = [super init]) {
        self.items = items;
        self.headerTitle = headerTitle;
        self.footerTitle = footerTitle;
    }
    return self;
}


@end
