//
//  TSSettingItem.h
//  VolDuTemps
//
//  Created by Zhuangwei PENG on 2017/10/10.
//  Copyright © 2017年 Zhuangwei PENG. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TSSettingItem : NSObject

@property (nonatomic, copy) NSString *title;

+ (instancetype)itemWithTitle:(NSString *)title;
- (instancetype)initWithTitle:(NSString *)title;
@end
