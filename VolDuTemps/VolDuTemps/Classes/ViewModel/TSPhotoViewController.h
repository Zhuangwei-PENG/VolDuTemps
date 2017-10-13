//
//  TSPhotoViewController.h
//  VolDuTemps
//
//  Created by Zhuangwei PENG on 2017/10/13.
//  Copyright © 2017年 Zhuangwei PENG. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface TSPhotoViewController : UIViewController <UINavigationControllerDelegate,UIImagePickerControllerDelegate,UIActionSheetDelegate>

@property (nonatomic, strong) UIImage *imageToSave;
@property (nonatomic, copy) void(^imageOperationBlock)(void);

/**
 子类如果提供了actionSheet，需要重写代理方法
 - (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex;
 */
- (void)choosePics:(UIActionSheet *)actionSheet;
- (void)presentWithType:(UIImagePickerControllerSourceType)type;
@end
