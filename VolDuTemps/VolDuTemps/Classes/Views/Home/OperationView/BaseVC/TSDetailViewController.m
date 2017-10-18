//
//  TSDetailViewController.m
//  VolDuTemps
//
//  Created by Zhuangwei PENG on 2017/10/9.
//  Copyright © 2017年 Zhuangwei PENG. All rights reserved.
//

#import "TSDetailViewController.h"
#import "TSPhotoViewerController.h"


@interface TSDetailViewController ()<TSAddPhotoDelegate, TSPhotoViewerControllerDelegate>

@property (nonatomic, strong) UIView *bottomLine;
@property (nonatomic, strong) UIDatePicker *datePicker;
//@property (nonatomic, strong) NSMutableArray *picsToDisplay;

@end

@implementation TSDetailViewController
+ (instancetype)detailView{
    return [[self alloc] init];
}

#pragma mark - Lazy instantiation
//创建保存按钮
- (UIBarButtonItem *)rightButton{
    if (!_rightButton) {
        _rightButton = [[UIBarButtonItem alloc] initWithTitle:@"保存" fontSize:16 target:self action:@selector(saveData) isPopBack:NO];
    }
    return _rightButton;
}
//创建返回按钮
- (UIBarButtonItem *)leftButton{
    if (!_leftButton) {
        _leftButton = [[UIBarButtonItem alloc] initWithTitle:@"返回" fontSize:16 target:self action:@selector(popBack) isPopBack:YES];
    }
    return _leftButton;
}
//创建标题
- (UITextField *)titleField{
    if (!_titleField) {
        _titleField = [[UITextField alloc] init];
    }
    return _titleField;
}
//创建正文框
- (UITextView *)textField{
    if (!_textField) {
        _textField = [[UITextView alloc] init];
    }
    return _textField;
}
//创建标题底部的线
- (UIView *)bottomLine{
    if (!_bottomLine) {
        _bottomLine = [[UIView alloc] init];
    }
    return _bottomLine;
}
//创建时间选择框
- (UITextField *)dateField{
    if (!_dateField) {
        _dateField = [[UITextField alloc] init];
    }
    return _dateField;
}
//创建图片添加视图
- (TSAddPhoto *)photoView{
    if (!_photoView) {
        _photoView = [[TSAddPhoto alloc] init];
    }
    return _photoView;
}
////创建数组收集加载的数据
//- (NSMutableArray *)picsToDisplay{
//    if (!_picsToDisplay) {
//        _picsToDisplay = [NSMutableArray arrayWithCapacity:4];
//    }
//    return _picsToDisplay;
//}

#pragma mark - UI setUp
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
}

- (void)setupUI{
    self.navigationItem.rightBarButtonItem = self.rightButton;
    self.navigationItem.leftBarButtonItem = self.leftButton;

    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.titleField];
    [self.view addSubview:self.textField];
    [self.view addSubview:self.dateField];
    [self.view addSubview:self.bottomLine];
    [self.view addSubview:self.photoView];
    
    self.bottomLine.backgroundColor = [UIColor colorWithHex:0xEDEDED];
    self.photoView.delegate = self;
    
    self.titleField.placeholder = @"标题";
    
    
    self.dateField.placeholder = @"选择日期📅";
    self.dateField.font = [UIFont systemFontOfSize:12];
    //设置时间选择键盘
    [self chooseDate];
    [self layoutSubviews];
    
}
- (void)layoutSubviews{
    //设置自动布局
    for (UIView *view in self.view.subviews) {
        view.translatesAutoresizingMaskIntoConstraints = NO;
        [view sizeToFit];
    }
    
    CGFloat margin = 20;
    CGFloat height = 35;
    CGFloat widthOfDate = 100;
    CGFloat widthOfTitle = self.view.bounds.size.width - widthOfDate - 3 * margin;
    //    CGFloat widthOfText = self.view.bounds.size.width - 2 * margin;
    [self.view addConstraints:@[
                                [NSLayoutConstraint constraintWithItem:self.dateField
                                                             attribute:NSLayoutAttributeTop
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:self.view
                                                             attribute:NSLayoutAttributeTop
                                                            multiplier:1
                                                              constant:margin + 64],
                                
                                [NSLayoutConstraint constraintWithItem:self.dateField
                                                             attribute:NSLayoutAttributeRight
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:self.view
                                                             attribute:NSLayoutAttributeRight
                                                            multiplier:1
                                                              constant:margin],
                                
                                [NSLayoutConstraint constraintWithItem:self.dateField
                                                             attribute:NSLayoutAttributeWidth
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:nil
                                                             attribute:NSLayoutAttributeNotAnAttribute
                                                            multiplier:1
                                                              constant:widthOfDate],
                                
                                [NSLayoutConstraint constraintWithItem:self.dateField
                                                             attribute:NSLayoutAttributeHeight
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:nil
                                                             attribute:NSLayoutAttributeNotAnAttribute
                                                            multiplier:1
                                                              constant:height]
                                ]];
    
    [self.view addConstraints:@[
                                [NSLayoutConstraint constraintWithItem:self.titleField
                                                             attribute:NSLayoutAttributeTop
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:self.view
                                                             attribute:NSLayoutAttributeTop
                                                            multiplier:1
                                                              constant:(64 + margin)],
                                
                                [NSLayoutConstraint constraintWithItem:self.titleField
                                                             attribute:NSLayoutAttributeLeft
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:self.view
                                                             attribute:NSLayoutAttributeLeft
                                                            multiplier:1
                                                              constant:margin],
                                
                                [NSLayoutConstraint constraintWithItem:self.titleField
                                                             attribute:NSLayoutAttributeWidth
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:nil
                                                             attribute:NSLayoutAttributeNotAnAttribute
                                                            multiplier:1
                                                              constant:widthOfTitle],
                                
                                [NSLayoutConstraint constraintWithItem:self.titleField
                                                             attribute:NSLayoutAttributeHeight
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:nil
                                                             attribute:NSLayoutAttributeNotAnAttribute
                                                            multiplier:1
                                                              constant:height]
                                ]];
    
    
    [self.view addConstraints:@[
                                [NSLayoutConstraint constraintWithItem:self.textField
                                                             attribute:NSLayoutAttributeTop
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:self.titleField
                                                             attribute:NSLayoutAttributeBottom
                                                            multiplier:1
                                                              constant:margin],
                                
                                [NSLayoutConstraint constraintWithItem:self.textField
                                                             attribute:NSLayoutAttributeLeft
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:self.view
                                                             attribute:NSLayoutAttributeLeft
                                                            multiplier:1
                                                              constant:margin],
                                
                                [NSLayoutConstraint constraintWithItem:self.textField
                                                             attribute:NSLayoutAttributeRight
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:self.view
                                                             attribute:NSLayoutAttributeRight
                                                            multiplier:1
                                                              constant:-margin],
                                
                                [NSLayoutConstraint constraintWithItem:self.textField
                                                             attribute:NSLayoutAttributeHeight
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:nil
                                                             attribute:NSLayoutAttributeNotAnAttribute
                                                            multiplier:1
                                                              constant:height * 2]
                                ]];
    //设置title底部的分割线
    [self.view addConstraints:@[
                                [NSLayoutConstraint constraintWithItem:self.bottomLine
                                                             attribute:NSLayoutAttributeTop
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:self.titleField
                                                             attribute:NSLayoutAttributeBottom
                                                            multiplier:1
                                                              constant:1],
                                
                                [NSLayoutConstraint constraintWithItem:self.bottomLine
                                                             attribute:NSLayoutAttributeLeft
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:self.view
                                                             attribute:NSLayoutAttributeLeft
                                                            multiplier:1
                                                              constant:margin],
                                
                                [NSLayoutConstraint constraintWithItem:self.bottomLine
                                                             attribute:NSLayoutAttributeRight
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:self.view
                                                             attribute:NSLayoutAttributeRight
                                                            multiplier:1
                                                              constant:0],
                                
                                [NSLayoutConstraint constraintWithItem:self.bottomLine
                                                             attribute:NSLayoutAttributeHeight
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:nil
                                                             attribute:NSLayoutAttributeNotAnAttribute
                                                            multiplier:1
                                                              constant:1]
                                ]];
    
    //设置photoView
    [self.view addConstraints:@[[NSLayoutConstraint constraintWithItem:self.photoView
                                                             attribute:NSLayoutAttributeTop
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:self.textField
                                                             attribute:NSLayoutAttributeBottom
                                                            multiplier:1
                                                              constant:margin * 0.5],
                                
                                [NSLayoutConstraint constraintWithItem:self.photoView
                                                             attribute:NSLayoutAttributeLeft
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:self.view
                                                             attribute:NSLayoutAttributeLeft
                                                            multiplier:1
                                                              constant:0],
                                
                                [NSLayoutConstraint constraintWithItem:self.photoView
                                                             attribute:NSLayoutAttributeRight
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:self.view
                                                             attribute:NSLayoutAttributeRight
                                                            multiplier:1
                                                              constant:0],
                                
                                [NSLayoutConstraint constraintWithItem:self.photoView
                                                             attribute:NSLayoutAttributeHeight
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:nil
                                                             attribute:NSLayoutAttributeNotAnAttribute
                                                            multiplier:1
                                                              constant:2 * height + margin]
                                ]];
    
    
}

#pragma mark - Navigation
- (TSDairyModel *)saveData{
    //根据输入内容，创建模型来保存数据
    TSDairyModel *model = [TSDairyModel dairyModelWithTitle:self.titleField.text text:self.textField.text time:self.dateField.text];
    model.pictures = self.photoView.pics.copy;
    
    return model;
}

- (void)popBack{
    //子类重写父类方法
    //如果时新建页面，只要有一个不为空，返回时提示是否保存
    //如果时修改页面，有一个位置修改了，返回时提示是否保存
 
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"是否保存" message:@"确定要返回并保存吗？" preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
    }];
    
    UIAlertAction *save = [UIAlertAction actionWithTitle:@"保存" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self saveData];
        [self.navigationController popToRootViewControllerAnimated:YES];
    }];
    
    UIAlertAction *notSave = [UIAlertAction actionWithTitle:@"不保存" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self.navigationController popViewControllerAnimated:YES];
    }];
    
    [alertController addAction:cancel];
    [alertController addAction:save];
    [alertController addAction:notSave];
    [self presentViewController:alertController animated:YES completion:^{
        
    }];
}

#pragma mark - datePicker keyboard
- (void)finishedSelection{
    //获取时间
    NSDate *date = self.datePicker.date;
    //格式化日期
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy-MM-dd";
    //将日期转换成字符串
    NSString *dateStr = [formatter stringFromDate:date];
    self.dateField.text = dateStr;

    [self.dateField resignFirstResponder];
}

- (void)chooseDate{
    UIDatePicker *date = [[UIDatePicker alloc] init];
    self.datePicker = date;
    //国际化
    self.datePicker.locale = [NSLocale localeWithLocaleIdentifier:@"zh"];
    
    //设置DatePicker模式为日期
    self.datePicker.datePickerMode = UIDatePickerModeDate;
    
    //设置最大日期为当前日期
    self.datePicker.maximumDate = [NSDate date];
    
    //设置键盘为DatePicker
    self.dateField.inputView = self.datePicker;
    
    //创建键盘辅助条
    UIToolbar *toorBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 44)];
    toorBar.backgroundColor = [UIColor lightGrayColor];
    
    //创建完成按钮
    UIBarButtonItem *finishBtn = [[UIBarButtonItem alloc] initWithTitle:@"完成" style:UIBarButtonItemStylePlain target:self action:@selector(finishedSelection)];
    //创建弹簧按钮
    UIBarButtonItem *spaceBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    //将两个按钮添加到toolbar上
    toorBar.items = @[spaceBtn, finishBtn];
    //将toolBar添加到键盘上面
    self.dateField.inputAccessoryView = toorBar;
    
}

#pragma mark - Actionsheet delegate
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 0) {
        //打开相机
        [self presentWithType:UIImagePickerControllerSourceTypeCamera];
    }else if (buttonIndex == 1) {
        //打开相册
        [self presentWithType:UIImagePickerControllerSourceTypePhotoLibrary];
    }
}

#pragma mark - ImagePicker delegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    //获取用户选择的图片，保存到self.imageToSave中
    [super imagePickerController:picker didFinishPickingMediaWithInfo:info];
    //添加图片到photoView视图上
    [self.photoView addNewPic:self.imageToSave];
    //添加图片到图片浏览器的数组上
//    [self.picsToDisplay addObject:self.imageToSave];
}

#pragma mark - AddPhotoView delegate
- (void)TSAddPhoto:(TSAddPhoto *)addPhotoView didClickOnPic:(UIImage *)image{
    
    //创建图片浏览器
    TSPhotoViewerController *displayVC = [[TSPhotoViewerController alloc] init];
    displayVC.delegate = self;
    //将要显示的数据传给图片浏览器
    displayVC.picsToDisplay = self.photoView.pics.copy;
    //将用户点击的图片下标传递给图片浏览器，先显示用户点击的图片
    NSUInteger index = [self.photoView.pics indexOfObject:image];
    displayVC.firstViewIndex = index;
    //跳转至图片浏览
    [self.navigationController pushViewController:displayVC animated:YES];
    
}

- (void)TSAddPhoto:(TSAddPhoto *)addPhotoView didClickAddPicBtn:(UIButton *)button{
    //退回键盘
    [self.view endEditing:YES];
    //修改actionSheet提示
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"添加一张照片" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"拍照",@"从手机相册选择",nil];
    [self choosePics:actionSheet];
    
}

#pragma mark - Photoviewer delete photo delegate

- (void)TSPhotoViewerController:(TSPhotoViewerController *)ViewController didDeletedPicAtIndex:(NSUInteger)index{
    //将图片从photoView视图中移除
    [self.photoView removePic:index];
    //将图片从图片浏览器中移除
//    [self.picsToDisplay removeObjectAtIndex:index];
    NSLog(@"%lu",index);
}

@end

