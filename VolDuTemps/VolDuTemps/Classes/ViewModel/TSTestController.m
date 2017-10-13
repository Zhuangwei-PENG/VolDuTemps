//
//  TSTestController.m
//  VolDuTemps
//
//  Created by Zhuangwei PENG on 2017/10/13.
//  Copyright © 2017年 Zhuangwei PENG. All rights reserved.
//

#import "TSTestController.h"

#import "TSAddPhoto.h"

@interface TSTestController ()<TSAddPhotoDelegate>

@property (nonatomic, weak) TSAddPhoto *photoView;

@end

@implementation TSTestController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    TSAddPhoto *photoView = [TSAddPhoto addPhotoViewWithFrame:CGRectMake(0, 64, 320, 200)];
    [self.view addSubview:photoView];
    
    self.photoView = photoView;
    self.photoView.delegate = self;
    
}

#pragma mark - Actionsheet delegate
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    NSLog(@"%ld",buttonIndex);
    if (buttonIndex == 0) {
        [self presentWithType:UIImagePickerControllerSourceTypeCamera];
    }else if (buttonIndex == 1) {
        [self presentWithType:UIImagePickerControllerSourceTypePhotoLibrary];
    }
}

#pragma mark - ImagePicker delegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    [super imagePickerController:picker didFinishPickingMediaWithInfo:info];
     [self.photoView addNewPic:self.imageToSave];
}

#pragma mark - AddPhotoView delegate
- (void)TSAddPhoto:(TSAddPhoto *)addPhotoView didClickOnPic:(UIImage *)image{
    [self presentViewController:[UINavigationController new] animated:YES completion:^{
        NSLog(@"跳转完成");
    }];
}

- (void)TSAddPhoto:(TSAddPhoto *)addPhotoView didClickAddPicBtn:(UIButton *)button{
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"添加一张照片" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"拍照",@"从手机相册选择",nil];
    [self choosePics:actionSheet];

}


@end
