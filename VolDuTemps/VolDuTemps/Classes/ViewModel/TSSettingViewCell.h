//
//  TSSettingViewCell.h
//  VolDuTemps
//
//  Created by Zhuangwei PENG on 2017/10/11.
//  Copyright © 2017年 Zhuangwei PENG. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TSSettingItem.h"
#import "TSSwitchItem.h"

@protocol TSSettingViewCellDelegate<NSObject>

- (void)switchValueChanged:(TSSwitchItem *)item atIndexPath:(NSIndexPath *)indexPath;

@end

@interface TSSettingViewCell : UITableViewCell

@property (nonatomic, strong) TSSettingItem *item;
@property (nonatomic, strong) id<TSSettingViewCellDelegate> delegate;
@property (nonatomic, strong) NSIndexPath *indexPath;

+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end
