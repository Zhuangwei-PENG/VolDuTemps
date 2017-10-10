//
//  TSSettingGroup.h
//  VolDuTemps
//
//  Created by Zhuangwei PENG on 2017/10/10.
//  Copyright © 2017年 Zhuangwei PENG. All rights reserved.
//

#import <Foundation/Foundation.h>
@class TSSettingItem;

@interface TSSettingGroup : NSObject

@property (nonatomic, copy) NSString *headerTitle;
@property (nonatomic, copy) NSString *footerTitle;

@property (nonatomic, strong) NSArray<TSSettingItem *> *items;

+ (instancetype)groupWithItems:(NSArray<TSSettingItem *> *)items headerTitle:(NSString *)headerTitle footerTitle:(NSString *)footerTitle;

+ (instancetype)groupWithItems:(NSArray<TSSettingItem *> *)items;

- (instancetype)initWithItems:(NSArray<TSSettingItem *> *)items headerTitle:(NSString *)headerTitle footerTitle:(NSString *)footerTitle;

- (instancetype)initWithItems:(NSArray<TSSettingItem *> *)items;
@end
