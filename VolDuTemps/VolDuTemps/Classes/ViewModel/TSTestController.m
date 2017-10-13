//
//  TSTestController.m
//  VolDuTemps
//
//  Created by Zhuangwei PENG on 2017/10/13.
//  Copyright © 2017年 Zhuangwei PENG. All rights reserved.
//

#import "TSTestController.h"
#import "TSAddPhoto.h"

@interface TSTestController ()<UINavigationControllerDelegate,UIImagePickerControllerDelegate,UIActionSheetDelegate,TSAddPhotoDelegate>

@property (nonatomic, weak) UIButton *addBtn;
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
    
//    [self.addBtn addTarget:self action:@selector(addMorePics) forControlEvents:UIControlEventTouchUpInside];
    
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(pushToZoomPic) name:@"zoomPic" object:nil];
}

- (void)addMorePics{
    //弹出选项
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"添加一张照片" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"拍照",@"从手机相册选择",nil];
    
    actionSheet.tintColor = [UIColor darkTextColor];
    actionSheet.actionSheetStyle = UIActionSheetStyleDefault;
    //显示actionSheet
    [actionSheet showInView:self.view];
}

- (void)presentWithType:(UIImagePickerControllerSourceType)type{
    if (![UIImagePickerController isSourceTypeAvailable:type]) {
        NSLog(@"不支持");
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
    }
}


#pragma mark - ImagePicker delegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    //获取文件类型
    NSString *fileType = [info objectForKey:UIImagePickerControllerMediaType];
    //判断是否为图片
    if ([fileType isEqualToString:@"public.image"]) {

        UIImage *image = info[UIImagePickerControllerEditedImage];
        [self.photoView addNewPic:image];
        
        [picker dismissViewControllerAnimated:YES completion:^{
            
        }];
    }
}

#pragma mark - AddPhotoView delegate
- (void)TSAddPhoto:(TSAddPhoto *)addPhotoView didClickOnPic:(UIImage *)image{
    [self presentViewController:[UINavigationController new] animated:YES completion:^{
        NSLog(@"跳转完成");
    }];
}

- (void)TSAddPhoto:(TSAddPhoto *)addPhotoView didClickAddPicBtn:(UIButton *)button{
    [self addMorePics];
}


@end
