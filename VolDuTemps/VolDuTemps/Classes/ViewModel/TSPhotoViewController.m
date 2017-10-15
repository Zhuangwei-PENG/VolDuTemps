//
//  TSPhotoViewController.m
//  VolDuTemps
//
//  Created by Zhuangwei PENG on 2017/10/13.
//  Copyright © 2017年 Zhuangwei PENG. All rights reserved.
//

#import "TSPhotoViewController.h"

@interface TSPhotoViewController ()

@end

@implementation TSPhotoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)choosePics:(UIActionSheet *)actionSheet{
    //从用户获取弹出选项
    //如果用户没有设置，提供默认的设置
    if(!actionSheet){
        actionSheet = [[UIActionSheet alloc] initWithTitle:@"请选择一张图片" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"拍照",@"从手机相册选择",@"保存图片",nil];
    }
    actionSheet.tintColor = [UIColor darkTextColor];
    actionSheet.actionSheetStyle = UIActionSheetStyleDefault;
    
    //显示actionSheet
    [actionSheet showInView:self.view];
}

- (void)presentWithType:(UIImagePickerControllerSourceType)type{
    if (![UIImagePickerController isSourceTypeAvailable:type]) {
        //不支持时UIAlertView提示用户
        [[[UIAlertView alloc] initWithTitle:@"提示"message:@"不支持该设备" delegate:self cancelButtonTitle:nil otherButtonTitles:@"确定", nil] show];
        return;
    }
    
    //实例化 UIImagePickerController
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.sourceType = type;
    
    //设置代理和属性
    picker.delegate = self;
    picker.allowsEditing = YES;
    
    //跳转至相册或照相机
    [self presentViewController:picker animated:YES completion:^{
        
    }];
}

#pragma mark - Actionsheet delegate
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    NSLog(@"%ld",buttonIndex);
    if (buttonIndex == 0) {
        [self presentWithType:UIImagePickerControllerSourceTypeCamera];
    }else if (buttonIndex == 1) {
        [self presentWithType:UIImagePickerControllerSourceTypePhotoLibrary];
    }else if (buttonIndex == 2){
        [self saveImageToPhotoLibrary];
    }
}


#pragma mark - ImagePicker delegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    //获取文件类型
    NSString *fileType = [info objectForKey:UIImagePickerControllerMediaType];
    //判断是否为图片
    if ([fileType isEqualToString:@"public.image"]) {
        
        self.imageToSave = info[UIImagePickerControllerEditedImage];
//        if (self.imageOperationBlock) {
//            self.imageOperationBlock();
//        }
        
        [picker dismissViewControllerAnimated:YES completion:^{
           
        }];
    }
}

#pragma mark - Save Image To PhotoLibrary
- (void)saveImageToPhotoLibrary{
    //保存图片至相册
    UIImageWriteToSavedPhotosAlbum(self.imageToSave, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
}

- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo{
    //保存结果显示
    if(!error) {
        [[[UIAlertView alloc] initWithTitle:@"提示"message:@"已存入手机相册"delegate:self cancelButtonTitle:nil otherButtonTitles:@"确定", nil] show];
    }else{
        [[[UIAlertView alloc] initWithTitle:@"提示"message:@"保存失败"delegate:self cancelButtonTitle:nil otherButtonTitles:@"确定", nil] show];
    }
}

@end
