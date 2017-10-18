//
//  TSPhotoViewerController.m
//  VolDuTemps
//
//  Created by Zhuangwei PENG on 2017/10/13.
//  Copyright © 2017年 Zhuangwei PENG. All rights reserved.
//

#import "TSPhotoViewerController.h"
#import "Addition.h"

#define kScreenSize [UIScreen mainScreen].bounds.size

@interface TSPhotoViewerController ()<UIActionSheetDelegate>
@property (nonatomic, strong) UICollectionViewFlowLayout *flowLayout;
@property (nonatomic, assign) NSUInteger currentIndex;
@property (nonatomic, strong) NSMutableArray *currentPics;

@end

@implementation TSPhotoViewerController

static NSString * const reuseIdentifier = @"Cell";

- (UICollectionViewFlowLayout *)flowLayout{
    if (!_flowLayout) {
        _flowLayout = [[UICollectionViewFlowLayout alloc] init];
    }
    return _flowLayout;
}
- (void)viewDidLayoutSubviews{
    //在 UICollectionView 显示它的subview 之前调用不起作用，所以要在子view layout后调用
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:self.firstViewIndex inSection:0];
    [self.collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:NO];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.currentIndex = self.firstViewIndex;
    self.currentPics = [self.picsToDisplay mutableCopy];
}

- (instancetype)init{
    self.collectionView = [[UICollectionView alloc] initWithFrame:[UIScreen mainScreen].bounds collectionViewLayout:self.flowLayout];
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    self.collectionView.backgroundColor = [UIColor blackColor];
    [self setCollectionView];
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
   
}

- (void)setCollectionView{
    self.flowLayout.itemSize = CGSizeMake(320, 504);
    self.flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.flowLayout.minimumLineSpacing = 0;
    self.flowLayout.minimumInteritemSpacing = 0;
    
    self.collectionView.pagingEnabled = YES;
    self.collectionView.showsHorizontalScrollIndicator = NO;
    self.collectionView.bounces = NO;
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" fontSize:16 target:self action:@selector(popBack) isPopBack:YES];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"删除" fontSize:16 target:self action:@selector(deletePic) isPopBack:NO];

}

- (void)popBack{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)deletePic{
    //删除图片时，提示用户，监控用户选择
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"要删除这张照片吗？" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"删除" otherButtonTitles:nil];
    [actionSheet showInView:self.collectionView];
}

- (void)delete{
    //将图片从图片浏览器中移除
    [self.currentPics removeObjectAtIndex:self.currentIndex];
    
    //执行代理方法，将删除的图片下标回传给控制器
    if ([self.delegate respondsToSelector:@selector(TSPhotoViewerController:didDeletedPicAtIndex:)]) {
        [self.delegate TSPhotoViewerController:self didDeletedPicAtIndex:self.currentIndex];
    }
    
    if (self.currentPics.count) {
        //如果还有要显示的图片，更新图片浏览器
        [self.collectionView reloadData];
    }else{
        //如果图片全部删除了，直接跳回上级界面
        [self.navigationController popViewControllerAnimated:YES];
    }
    
}

#pragma mark - Actionsheet delegate
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 0) {
        //如果选择了删除，删除图片
        [self delete];
    }else if (buttonIndex == 1) {
    }
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.currentPics.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    UIImage *image = self.currentPics[indexPath.row];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    [cell.contentView addSubview:imageView];
    imageView.frame = CGRectMake(0, (kScreenSize.height - image.size.height) * 0.5, image.size.width, image.size.height);

    return cell;
}

#pragma mark <UICollectionViewDelegate>

- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath{
    self.currentIndex = indexPath.row;
//        self.navigationItem.title = [NSString stringWithFormat:@"%ld/%ld", self.currentIndex, self.currentPics.count];
    self.navigationItem.title = [NSString stringWithFormat:@"%u/%u",self.currentIndex + 1, self.currentPics.count];
//    self.navigationController.navigationBar.titleTextAttributes =

}



@end
