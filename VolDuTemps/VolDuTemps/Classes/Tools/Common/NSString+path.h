//
//  NSString+Addition.m
//  VolDuTemps
//
//  Created by Zhuangwei PENG on 2017/10/10.
//  Copyright © 2017年 Zhuangwei PENG. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (path)

/// 获取Documents目录
- (NSString *)appendDocumentsPath;
/// 获取Cache目录
- (NSString *)appendCachePath;
/// 获取Tmp目录
- (NSString *)appendTmpPath;

@end
