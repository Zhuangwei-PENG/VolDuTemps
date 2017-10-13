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


@property (nonatomic, weak) id<TSAddPhotoDelegate> delegate;


+ (instancetype)addPhotoViewWithFrame:(CGRect)Frame;
- (void)addNewPic:(UIImage *)pic;
- (void)remorePic:(UIImage *)pic;
@end
