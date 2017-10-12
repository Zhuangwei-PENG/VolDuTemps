//
//  TSChangeIconController.m
//  VolDuTemps
//
//  Created by Zhuangwei PENG on 2017/10/12.
//  Copyright © 2017年 Zhuangwei PENG. All rights reserved.
//

#import "TSChangeIconController.h"
#import "Addition.h"

@interface TSChangeIconController ()<UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIActionSheetDelegate>

@property (nonatomic, strong) UIImageView *photoView;
@property (nonatomic, strong) UIImage *image;
@property (nonatomic, strong) NSUserDefaults *userDefault;

@end

@implementation TSChangeIconController
#pragma mark - Lazy instantiation
- (UIImageView *)photoView{
    if (!_photoView) {
        _photoView = [[UIImageView alloc] init];
    }
    return _photoView;
}
- (UIImage *)image{
    if (!_image) {
        _image = [[UIImage alloc] init];
    }
    return _image;
}
- (NSUserDefaults *)userDefault{
    if (!_userDefault) {
        _userDefault = [NSUserDefaults standardUserDefaults];
    }
    return _userDefault;
}

#pragma mark - SetUp UI
- (void)viewDidLoad {
    [super viewDidLoad];
    [self showIcon];
    [self setupUI];
}

- (void)showIcon{
    //设置默认头像
    UIImage *image = [UIImage imageNamed:@"Mark_43"];
    //获取用户数据
    NSData *iconData = [self.userDefault dataForKey:@"userIcon"];
    if (iconData) {
        image = [UIImage imageWithData:iconData];
    }
    self.photoView.image = image;
}

- (void)setupUI{
    //设置背景为黑色
    self.view.backgroundColor = [UIColor blackColor];
    
    //设置photoView的Frame
    CGFloat w = self.view.bounds.size.width;
    self.photoView.frame = CGRectMake(0, 100, w, w);
    
    [self.view addSubview:self.photoView];
    
    //创建左右两个按钮
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" fontSize:16 target:self action:@selector(cancel) isPopBack:YES];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCamera target:self action:@selector(changeIcon)];
    self.navigationController.navigationBar.tintColor = [UIColor darkGrayColor];
}

//返回上级
- (void)cancel {
    [self.navigationController popViewControllerAnimated:YES];
}
//点击右侧按钮更换头像
- (void)changeIcon{
    //弹出选项
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"更换头像" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"拍照",@"从手机相册选择",@"保存图片",nil];
    
    actionSheet.tintColor = [UIColor darkTextColor];
    actionSheet.actionSheetStyle = UIActionSheetStyleDefault;
    //显示actionSheet
    [actionSheet showInView:self.view];
}


#pragma mark - Choose photo or Take photo
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

#pragma mark - Save Image To PhotoLibrary
- (void)saveImageToPhotoLibrary{
    //保存图片至相册
    UIImageWriteToSavedPhotosAlbum(self.photoView.image, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
}

- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo{
    //保存结果显示
    if(!error) {
        [[[UIAlertView alloc] initWithTitle:@"提示"message:@"已存入手机相册"delegate:self cancelButtonTitle:nil otherButtonTitles:@"确定", nil] show];
    }else{
        [[[UIAlertView alloc] initWithTitle:@"提示"message:@"保存失败"delegate:self cancelButtonTitle:nil otherButtonTitles:@"确定", nil] show];
    }
}

#pragma mark - ActionSheet delegate
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
        //显示新头像
        self.image = info[UIImagePickerControllerEditedImage];
        self.photoView.image = nil;
        self.photoView.image = self.image;
        
        //获取新头像，保存至用户设置
        NSData *data = UIImageJPEGRepresentation(self.image, 0.5);
        [self.userDefault setObject:data forKey:@"userIcon"];
        
        [picker dismissViewControllerAnimated:YES completion:^{
            
        }];
        
    }
}


@end
