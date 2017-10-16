//
//  TSDetailViewCell.h
//  VolDuTemps
//
//  Created by Zhuangwei PENG on 2017/10/16.
//  Copyright © 2017年 Zhuangwei PENG. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TSDairyModel;

@interface TSDetailViewCell : UITableViewCell

@property (nonatomic, strong) TSDairyModel *dairyModel;
@property (nonatomic, assign, readonly) CGFloat heightOfCell;

+ (instancetype)cellWithTableView:(UITableView *)tableView dairyModel:(TSDairyModel *)dairyModel;

@end
