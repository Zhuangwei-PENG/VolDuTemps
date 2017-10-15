//
//  TSAddPhoto.h
//  VolDuTemps
//
//  Created by Zhuangwei PENG on 2017/10/13.
//  Copyright © 2017年 Zhuangwei PENG. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TSAddPhoto;

@protocol TSAddPhotoDelegate <NSObject>

- (void)TSAddPhoto:(TSAddPhoto *)addPhotoView didClickOnPic:(UIImage *)image;
- (void)TSAddPhoto:(TSAddPhoto *)addPhotoView didClickAddPicBtn:(UIButton *)button;

@end

@interface TSAddPhoto : UIView

@property (nonatomic, strong) NSMutableArray *pics;
@property (nonatomic, weak) id<TSAddPhotoDelegate> delegate;
//创建方法
+ (instancetype)addPhotoViewWithFrame:(CGRect)Frame;
//添加一张图片
- (void)addNewPic:(UIImage *)pic;
//移除一张图片
- (void)removePic:(NSUInteger)index;
@end
