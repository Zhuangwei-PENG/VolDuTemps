//
//  TSTableViewCell.h
//  VolDuTemps
//
//  Created by Zhuangwei PENG on 2017/10/9.
//  Copyright © 2017年 Zhuangwei PENG. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TSDairyModel;

@interface TSTableViewCell : UITableViewCell

@property (nonatomic, strong) TSDairyModel *dairyModel;

@end
