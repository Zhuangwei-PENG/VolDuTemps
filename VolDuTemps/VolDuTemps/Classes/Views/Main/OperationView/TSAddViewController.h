//
//  TSAddViewController.h
//  VolDuTemps
//
//  Created by Zhuangwei PENG on 2017/10/9.
//  Copyright © 2017年 Zhuangwei PENG. All rights reserved.
//

#import "TSDetailViewController.h"
@class TSAddViewController;
@class TSDairyModel;
@protocol TSAddViewControllerDelegate <NSObject>

@required
- (void)TSAddViewController: (TSAddViewController *)TSAddViewController dairy: (TSDairyModel *)dairyModel;
@end


@interface TSAddViewController : TSDetailViewController

@property (nonatomic, strong) id<TSAddViewControllerDelegate> delegate;

@end
