//
//  TSModifyViewController.h
//  VolDuTemps
//
//  Created by Zhuangwei PENG on 2017/10/9.
//  Copyright © 2017年 Zhuangwei PENG. All rights reserved.
//

#import "TSDetailViewController.h"
@class TSModifyViewController;

@protocol TSModifyViewControllerDelegate<NSObject>

@required
- (void)TSModifyViewController: (TSModifyViewController *)TSModifyViewController;
@end


@interface TSModifyViewController : TSDetailViewController

@property (nonatomic, strong) TSDairyModel *dairyModelToModify;
@property (nonatomic, strong) id<TSModifyViewControllerDelegate> delegate;

@end
