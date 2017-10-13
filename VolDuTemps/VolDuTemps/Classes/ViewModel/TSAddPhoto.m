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

@property (nonatomic, strong) NSMutableArray *pics;
@property (nonatomic, weak) UIImageView *picView;
@property (nonatomic, weak) UIButton *addPicBtn;

@property (nonatomic, assign) CGFloat margin;

@end


@implementation TSAddPhoto
//小图的大小尺寸

#pragma mark - Lazy instantiation
- (NSMutableArray *)pics{
    if (!_pics) {
        _pics = [NSMutableArray arrayWithCapacity:4];
    }
    return _pics;
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
    UIButton *addBtn = [[UIButton alloc] init];
    [addBtn setImage:[UIImage imageNamed:@"compose_pic_add"] forState:UIControlStateNormal];
    [addBtn setImage:[UIImage imageNamed:@"compose_pic_add_highlighted"] forState:UIControlStateHighlighted];
    [addBtn sizeToFit];
    
    //添加监听方法
    [addBtn addTarget:self action:@selector(clickOnBtn) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:addBtn];
    self.addPicBtn = addBtn;
    
    //计算初始frame
    
    if (self.bounds.size.width == 0) {
        self.bounds = [UIScreen mainScreen].bounds;
    }
    self.margin = (self.bounds.size.width - 4 * kLength)/5;
    addBtn.frame = CGRectMake(self.margin, self.margin, kLength, kLength);
    NSLog(@"%@",NSStringFromCGRect(addBtn.frame));
}

- (void)addNewPic:(UIImage *)pic{
   
    UIImageView *picView= [[UIImageView alloc] initWithImage:pic];
    self.picView = picView;
    
    //添加手势
    UITapGestureRecognizer *singleTap =[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickOnPic:)];
    self.picView.userInteractionEnabled=YES;
    [self.picView addGestureRecognizer:singleTap];
    
    [self.pics addObject:picView];
    [self reloadView];

}

- (void)reloadView{
    CGFloat dx = kLength + self.margin;
    //每添加一张图片向后移动dx距离
    if (self.pics.count < 4) {
        self.addPicBtn.transform = CGAffineTransformTranslate(self.addPicBtn.transform, dx, 0);
    }else{
        //添加到第四张移除添加按钮
        [self.addPicBtn removeFromSuperview];
    }
    //布置图片位置
    CGFloat index = self.pics.count;
    CGFloat x = index * self.margin + (index -1) * kLength;
    
    UIImageView *pic = self.pics.lastObject;
    pic.frame = CGRectMake(x, self.margin, kLength, kLength);
    
    //添加到视图上
    [self addSubview:pic];
    
    NSLog(@"%@",NSStringFromCGRect(pic.frame));
}

- (void)clickOnBtn{
    if ([self.delegate respondsToSelector:@selector(TSAddPhoto:didClickAddPicBtn:)]) {
        [self.delegate TSAddPhoto:self didClickAddPicBtn:self.addPicBtn];
    }
}

- (void)clickOnPic:(UITapGestureRecognizer *)gesture{
    NSLog(@"点击了图片");
    if ([self.delegate respondsToSelector:@selector(TSAddPhoto:didClickOnPic:)]) {
        UIImageView *imageView = (UIImageView *)gesture.view;
        [self.delegate TSAddPhoto:self didClickOnPic:imageView.image];
        NSLog(@"%@",imageView);
    }
//    [[NSNotificationCenter defaultCenter] postNotificationName:@"zoomPic" object:self.picView];
}


@end
