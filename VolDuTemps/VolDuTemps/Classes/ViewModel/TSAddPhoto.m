//
//  TSAddPhoto.m
//  VolDuTemps
//
//  Created by Zhuangwei PENG on 2017/10/13.
//  Copyright © 2017年 Zhuangwei PENG. All rights reserved.
//

#import "TSAddPhoto.h"

#define kLength 70

@interface TSAddPhoto()

@property (nonatomic, strong) NSMutableArray *picViews;
@property (nonatomic, strong) UIImageView *picView;
@property (nonatomic, strong) UIButton *addPicBtn;

@property (nonatomic, assign) CGFloat margin;

@end


@implementation TSAddPhoto
//小图的大小尺寸

#pragma mark - Lazy instantiation

- (NSMutableArray *)picViews{
    if (!_picViews) {
        _picViews = [NSMutableArray arrayWithCapacity:4];
    }
    return _picViews;
}

@synthesize pics = _pics;

- (NSMutableArray *)pics{
    if (!_pics) {
        _pics = [NSMutableArray arrayWithCapacity:4];
    }
    return _pics;
}
- (void)setPics:(NSMutableArray *)pics{
    _pics = pics;
    [pics enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [self.picViews addObject:[self creatPicViewWithPic:obj]];
    }];
    [self reloadView];
}

- (UIImageView *)picView{
    if (!_picView) {
        _picView = [[UIImageView alloc] init];
    }
    return _picView;
}

- (UIButton *)addPicBtn{
    if (!_addPicBtn) {
        _addPicBtn = [[UIButton alloc] init];
        [_addPicBtn setImage:[UIImage imageNamed:@"compose_pic_add"] forState:UIControlStateNormal];
        [_addPicBtn setImage:[UIImage imageNamed:@"compose_pic_add_highlighted"] forState:UIControlStateHighlighted];
        [_addPicBtn sizeToFit];
    }
    return _addPicBtn;
}

#pragma mark - Class initializer

+ (instancetype)addPhotoViewWithFrame:(CGRect)Frame{
    return [[self alloc] initWithFrame:Frame];
}

#pragma mark - Designed initializer
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setupPhotoView];
    }
    return self;
}

- (void)setupPhotoView{
    //创建添加按钮
    [self addSubview:self.addPicBtn];
    
    //添加监听方法
    [self.addPicBtn addTarget:self action:@selector(clickOnBtn) forControlEvents:UIControlEventTouchUpInside];
    
    //计算初始frame
    [self reloadView];
   

}

- (UIImageView *)creatPicViewWithPic:(UIImage *)pic{
    UIImageView *picView = [[UIImageView alloc] initWithImage:pic];
    //添加手势
    UITapGestureRecognizer *singleTap =[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickOnPic:)];
    picView.userInteractionEnabled=YES;
    [picView addGestureRecognizer:singleTap];
    return picView;
}

- (void)addNewPic:(UIImage *)pic{
    self.picView = [self creatPicViewWithPic:pic];
    
    [self.picViews addObject:self.picView];
    [self.pics addObject:pic];
    [self reloadView];

}

- (void)removePic:(NSUInteger)index{
    UIImageView *deleteView = self.picViews[index];
    [deleteView removeFromSuperview];
    [self.picViews removeObjectAtIndex:index];
    [self.pics removeObjectAtIndex:index];
    [self reloadView];
}

- (void)reloadView{
    
    if (self.picViews.count == 0) {
        if (self.bounds.size.width == 0) {
            self.bounds = [UIScreen mainScreen].bounds;
        }
        
        self.margin = (self.bounds.size.width - 4 * kLength)/5;
        self.addPicBtn.frame = CGRectMake(self.margin, self.margin, kLength, kLength);
        return;
        
    }else if (self.picViews.count > 0) {
        //如果count = 4，删除+按钮
        if (self.picViews.count == 4) {
            [self.addPicBtn removeFromSuperview];
        }else {
            CGFloat x = self.picViews.count * (kLength + self.margin) +self.margin;
            self.addPicBtn.frame = CGRectMake(x, self.margin, kLength, kLength);
            if (![self.subviews containsObject:self.addPicBtn]) {
                [self addSubview:self.addPicBtn];
            }
        }
        
        CGFloat index = 1;
        for (UIImageView *subView in self.picViews) {
            CGFloat x = index * self.margin + (index -1) * kLength;
            subView.frame = CGRectMake(x, self.margin, kLength, kLength);
            [self addSubview:subView];
            index ++;
        }
        
    }
//else{
//        //添加到第四张移除添加按钮
//
//    }
//    //布置图片位置
//
//
//    //添加到视图上
//    [self addSubview:pic];
}

- (void)clickOnBtn{
    if ([self.delegate respondsToSelector:@selector(TSAddPhoto:didClickAddPicBtn:)]) {
        [self.delegate TSAddPhoto:self didClickAddPicBtn:self.addPicBtn];
    }
}

- (void)clickOnPic:(UITapGestureRecognizer *)gesture{
    if ([self.delegate respondsToSelector:@selector(TSAddPhoto:didClickOnPic:)]) {
        UIImageView *imageView = (UIImageView *)gesture.view;
        [self.delegate TSAddPhoto:self didClickOnPic:imageView.image];
    }
//    [[NSNotificationCenter defaultCenter] postNotificationName:@"zoomPic" object:self.picView];
}


@end
