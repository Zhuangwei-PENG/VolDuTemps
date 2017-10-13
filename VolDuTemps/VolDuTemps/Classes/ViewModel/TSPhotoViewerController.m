//
//  TSPhotoViewerController.m
//  VolDuTemps
//
//  Created by Zhuangwei PENG on 2017/10/13.
//  Copyright © 2017年 Zhuangwei PENG. All rights reserved.
//

#import "TSPhotoViewerController.h"
#import "Addition.h"

@interface TSPhotoViewerController ()<UIActionSheetDelegate>
@property (nonatomic, strong) UICollectionViewFlowLayout *flowLayout;
@end

@implementation TSPhotoViewerController

static NSString * const reuseIdentifier = @"Cell";

- (UICollectionViewFlowLayout *)flowLayout{
    if (!_flowLayout) {
        _flowLayout = [[UICollectionViewFlowLayout alloc] init];
    }
    return _flowLayout;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:self.firstViewIndex inSection:0];
    [self.collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];

}
- (instancetype)init{
    self.collectionView = [[UICollectionView alloc] initWithFrame:[UIScreen mainScreen].bounds collectionViewLayout:self.flowLayout];
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    self.collectionView.backgroundColor = [UIColor blackColor];
    [self setCollectionView];
    return self;
}

//- (void)setFirstViewIndex:(NSInteger)firstViewIndex{
//    _firstViewIndex = firstViewIndex;
//}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)setCollectionView{
    self.flowLayout.itemSize = [UIScreen mainScreen].bounds.size;
    self.flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.flowLayout.minimumLineSpacing = 0;
    self.flowLayout.minimumInteritemSpacing = 0;
    
    self.collectionView.pagingEnabled = YES;
    self.collectionView.showsHorizontalScrollIndicator = NO;
    self.collectionView.bounces = NO;
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" fontSize:16 target:self action:@selector(popBack) isPopBack:YES];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"删除" fontSize:16 target:self action:@selector(deletePic) isPopBack:NO];
    self.navigationItem.title = self.titleToDisplay;
}

- (void)popBack{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)deletePic{
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"要删除这张照片吗？" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"删除" otherButtonTitles:nil];
    [actionSheet showInView:self.collectionView];
}

- (void)delete{
    NSLog(@"删除图片");
//    self.picsToDisplay
}

#pragma mark - Actionsheet delegate
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    NSLog(@"%ld",buttonIndex);
    if (buttonIndex == 0) {
        [self delete];
    }else if (buttonIndex == 1) {
    }
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.picsToDisplay.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    UIImage *image = self.picsToDisplay[indexPath.row];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    [cell.contentView addSubview:imageView];
    imageView.frame = CGRectMake(0, 100, self.collectionView.bounds.size.width, image.size.height);
//    NSLog(@"%@",NSStringFromCGRect(imageView.frame));
    return cell;
}

#pragma mark <UICollectionViewDelegate>
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    UIImage *image = self.picsToDisplay[indexPath.row];
    NSLog(@"%@",NSStringFromCGSize(image.size));
}
- (void)collectionView:(UICollectionView *)collectionView didEndDisplayingCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath{
    UIImage *image = self.picsToDisplay[indexPath.row];
    NSLog(@"------%@",NSStringFromCGSize(image.size));
}
/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
