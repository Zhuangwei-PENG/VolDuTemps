//
//  TSDetailViewController.h
//  VolDuTemps
//
//  Created by Zhuangwei PENG on 2017/10/9.
//  Copyright © 2017年 Zhuangwei PENG. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TSDairyModel.h"

@interface TSDetailViewController : UIViewController

+ (instancetype)detailView;

+ (instancetype)detailViewWithData:(TSDairyModel *)data successBlock: (void(^)(TSDairyModel *modifiedModel))successBlock;

@end
