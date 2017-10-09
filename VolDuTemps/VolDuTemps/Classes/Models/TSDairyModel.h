//
//  TSDairyModel.h
//  VolDuTemps
//
//  Created by Zhuangwei PENG on 2017/10/9.
//  Copyright © 2017年 Zhuangwei PENG. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TSDairyModel : NSObject<NSCoding>

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *text;
@property (nonatomic, copy) NSString *time;


+ (instancetype)dairyModelWithDict:(NSDictionary *)dict;
- (instancetype)initWithDict:(NSDictionary *)dict;

+ (instancetype)dairyModelWithTitle: (NSString *)title text:(NSString *)text time:(NSString *)time;
@end
