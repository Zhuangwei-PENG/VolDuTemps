//
//  TSDairyModel.m
//  VolDuTemps
//
//  Created by Zhuangwei PENG on 2017/10/9.
//  Copyright © 2017年 Zhuangwei PENG. All rights reserved.
//

#import "TSDairyModel.h"

@implementation TSDairyModel
- (void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:_title forKey:@"title"];
    [aCoder encodeObject:_text forKey:@"text"];
    [aCoder encodeObject:_time forKey:@"time"];
}

- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super init]) {
        _title = [aDecoder decodeObjectForKey:@"title"];
        _text = [aDecoder decodeObjectForKey:@"text"];
        _time = [aDecoder decodeObjectForKey:@"time"];

    }
    return self;
}

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

- (BOOL)isSameTo:(TSDairyModel*)model{
    
    if ([self.title isEqualToString:model.title]) {
        if ([self.time isEqualToString:model.time]) {
            if ([self.text isEqualToString:model.text]) {
                return YES;
            }
        }
    }
    return NO;
    
}
@end
