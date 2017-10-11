//
//  TSTableViewCell.h
//  VolDuTemps
//
//  Created by Zhuangwei PENG on 2017/10/9.
//  Copyright © 2017年 Zhuangwei PENG. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TSDairyModel.h"

@interface TSTableViewCell : UITableViewCell

@property (nonatomic, strong) TSDairyModel *dairyModel;
@property (nonatomic, assign) CGFloat titleFont;

@end
