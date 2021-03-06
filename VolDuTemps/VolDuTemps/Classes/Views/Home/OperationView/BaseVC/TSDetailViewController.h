//
//  TSDetailViewController.h
//  VolDuTemps
//
//  Created by Zhuangwei PENG on 2017/10/9.
//  Copyright © 2017年 Zhuangwei PENG. All rights reserved.
//

#import "TSPhotoViewController.h"
#import "TSDairyModel.h"
#import "TSAddPhoto.h"
#import "Addition.h"


@interface TSDetailViewController : TSPhotoViewController


@property (nonatomic, strong) TSAddPhoto *photoView;
@property (nonatomic, strong) UITextField *titleField;
@property (nonatomic, strong) UITextView *textField;
@property (nonatomic, strong) UITextField *dateField;

@property (nonatomic, strong) UIBarButtonItem *rightButton;
@property (nonatomic, strong) UIBarButtonItem *leftButton;
+ (instancetype)detailView;

//+ (instancetype)detailViewWithData:(TSDairyModel *)data;// successBlock: (void(^)(TSDairyModel *modifiedModel))successBlock;

- (TSDairyModel *)saveData;
- (void)popBack;
@end
