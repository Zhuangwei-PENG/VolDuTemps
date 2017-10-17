//
//  TSDetailDisplayController.h
//  VolDuTemps
//
//  Created by Zhuangwei PENG on 2017/10/16.
//  Copyright © 2017年 Zhuangwei PENG. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TSDetailDisplayController;
@class TSDetailViewCell;

@protocol TSDetailDisplayControllerDelegate<NSObject>

- (void)TSDetailDisplayController:(TSDetailDisplayController *)detailDisplayController;

@end

@interface TSDetailDisplayController : UITableViewController

@property (nonatomic, weak) id<TSDetailDisplayControllerDelegate> delegate;
@property (nonatomic, strong) NSArray<TSDetailViewCell*> *cells;

@end
