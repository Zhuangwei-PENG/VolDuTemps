//
//  TSPersonnalSettingCell.h
//  VolDuTemps
//
//  Created by Zhuangwei PENG on 2017/10/12.
//  Copyright © 2017年 Zhuangwei PENG. All rights reserved.
//

#import "TSSettingViewCell.h"

typedef enum{
    TSPersonnalSettingCellTypeRightImage,
    TSPersonnalSettingCellTypeRIghtText
} TSPersonnalSettingCellType;

@interface TSPersonnalSettingCell : TSSettingViewCell
+ (instancetype)cellWithTableView:(UITableView *)tableView type:(TSPersonnalSettingCellType)type;
@end
