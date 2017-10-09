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

@property (nonatomic, copy) NSString *titleDetail;
@property (nonatomic, copy) NSString *textDetail;
@property (nonatomic, copy) NSString *timeDetail;

+ (instancetype)detailView;

+ (instancetype)detailViewWithData:(TSDairyModel *)data successBlock: (void(^)(TSDairyModel *modifiedModel))successBlock;

- (void)saveData;
@end
