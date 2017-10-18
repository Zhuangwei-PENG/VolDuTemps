//
//  TSPhotoViewerController.h
//  VolDuTemps
//
//  Created by Zhuangwei PENG on 2017/10/13.
//  Copyright © 2017年 Zhuangwei PENG. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TSPhotoViewerController;

@protocol TSPhotoViewerControllerDelegate <NSObject>

- (void)TSPhotoViewerController:(TSPhotoViewerController *)ViewController didDeletedPicAtIndex:(NSUInteger)index;

@end

@interface TSPhotoViewerController : UICollectionViewController

@property (nonatomic, weak) id<TSPhotoViewerControllerDelegate> delegate;

@property (nonatomic, strong) NSArray *picsToDisplay;

@property (nonatomic, assign) NSUInteger firstViewIndex;

@end
