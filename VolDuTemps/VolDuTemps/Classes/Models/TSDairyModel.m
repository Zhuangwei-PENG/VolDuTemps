//
//  TSDairyModel.m
//  VolDuTemps
//
//  Created by Zhuangwei PENG on 2017/10/9.
//  Copyright © 2017年 Zhuangwei PENG. All rights reserved.
//

#import "TSDairyModel.h"

@implementation TSDairyModel


- (instancetype)initWithDict:(NSDictionary *)dict{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)dairyModelWithDict:(NSDictionary *)dict{
    return [[self alloc] initWithDict:dict];
}

+ (instancetype)dairyModelWithTitle: (NSString *)title text:(NSString *)text time:(NSString *)time{
    TSDairyModel *model = [[self alloc] init];
    model.title = title;
    model.text = text;
    model.time = time;
    
    return model;
}
@end
