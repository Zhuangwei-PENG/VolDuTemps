//
//  TSDetailViewCell.m
//  VolDuTemps
//
//  Created by Zhuangwei PENG on 2017/10/16.
//  Copyright © 2017年 Zhuangwei PENG. All rights reserved.
//

#import "TSDetailViewCell.h"
#import "TSDairyModel.h"
#import "Addition.h"

#define kScreenSize [UIScreen mainScreen].bounds.size
@interface TSDetailViewCell()

@property (nonatomic, strong) UIImageView *iconView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *timeLabel;
@property (nonatomic, strong) UILabel *txtLabel;
@property (nonatomic, strong) NSMutableArray *pictures;
@property (nonatomic, strong) NSMutableArray *picViews;

@property (nonatomic, assign, readwrite) CGFloat heightOfCell;

@end

@implementation TSDetailViewCell

static const CGFloat margin = 10;
static const CGFloat length = 70;
static const CGFloat titleFont = 16;
static const CGFloat textFont = 14;

@synthesize pictures = _pictures;

#pragma mark - Lazy instantiation
- (UIImageView *)iconView{
    if (!_iconView) {
        _iconView = [[UIImageView alloc] init];
    }
    return _iconView;
}

- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
    }
    return _titleLabel;
}

- (UILabel *)timeLabel{
    if (!_timeLabel) {
        _timeLabel = [[UILabel alloc] init];
    }
    return _timeLabel;
}

- (UILabel *)txtLabel{
    if (!_txtLabel) {
        _txtLabel = [[UILabel alloc] init];
    }
    return _txtLabel;
}

- (NSArray *)pictures{
    if (!_pictures) {
        _pictures = [NSMutableArray arrayWithCapacity:4];
    }
    return _pictures;
}

- (NSMutableArray *)picViews{
    if (!_picViews) {
        _picViews = [NSMutableArray arrayWithCapacity:4];
    }
    return _picViews;
}

#pragma mark - Override setter method
- (void)setPictures:(NSMutableArray *)pictures{
    _pictures = pictures;
    [self creatPictureViews];
}

- (void)setDairyModel:(TSDairyModel *)dairyModel{
    _dairyModel = dairyModel;
    self.txtLabel.text = dairyModel.text;
    [self setTxtLabelFrame];
    self.titleLabel.text = dairyModel.title;
    self.timeLabel.text = dairyModel.time;
    self.pictures = dairyModel.pictures.mutableCopy;
}

#pragma mark - designed initializer
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        [self setupCell];
    }
    return self;
}

+ (instancetype)cellWithTableView:(UITableView *)tableView dairyModel:(TSDairyModel *)dairyModel{
    static NSString *cellID = @"detailViewCell";
    TSDetailViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[self alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellID];
    }
    cell.dairyModel = dairyModel;
    return cell;
}

- (void)setTxtLabelFrame{
    //设置正文Frame，按内容显示
    CGFloat textHeight = [self.txtLabel.text sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]}].height;
    self.txtLabel.frame = CGRectMake(margin, 2*margin + length, kScreenSize.width - 2*margin, textHeight);
    [self.txtLabel sizeToFit];
    
    //获取cell的高度
    self.heightOfCell = CGRectGetMaxY(self.txtLabel.frame) + margin;
}

- (void)creatPictureViews{
    if (self.picViews.count) {
        for (UIImageView *imageView in self.picViews) {
            [imageView removeFromSuperview];
        }
    }
    
    for (UIImage *image in self.pictures) {
        //根据图片比例计算高度
        CGFloat imageW = kScreenSize.width - 2*margin;
        UIImage *newImage = [image scaleToWidth:imageW];
        //创建方法可以抽取
        UIImageView *imageView = [[UIImageView alloc] initWithImage:newImage];
        //给ImageView 添加监听事件
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapOnImage)];
        imageView.userInteractionEnabled = YES;
        [imageView addGestureRecognizer:tap];
        
        imageView.frame = CGRectMake(margin, self.heightOfCell, newImage.size.width, newImage.size.height);
        self.heightOfCell += newImage.size.height +margin;
        NSLog(@"--%f",self.heightOfCell);
        
        [self.contentView addSubview:imageView];
        [self.picViews addObject:imageView];
    }
}

- (void)tapOnImage{
    NSLog(@"点击了图片");
}

- (void)setupCell {
    [self.contentView addSubview:self.iconView];
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.timeLabel];
    [self.contentView addSubview:self.txtLabel];
    
    self.iconView.image = [self getIconImage];

    self.iconView.layer.cornerRadius = 10;
    self.iconView.layer.masksToBounds = YES;
    
    self.titleLabel.numberOfLines = 1;
    self.timeLabel.numberOfLines = 1;
    self.txtLabel.numberOfLines = 0;
    
    self.titleLabel.textColor = [UIColor darkTextColor];
    self.timeLabel.textColor = [UIColor darkTextColor];
    self.txtLabel.textColor = [UIColor darkTextColor];
    
    self.titleLabel.font = [UIFont systemFontOfSize:titleFont];
    self.timeLabel.font = [UIFont systemFontOfSize:textFont];
    self.txtLabel.font = [UIFont systemFontOfSize:textFont];
    
    //设置头像Frame
    self.iconView.frame = CGRectMake(margin, margin, length, length);
    //设置标题Frame
    CGFloat titleH = 40;
    self.titleLabel.frame = CGRectMake(2*margin + length, margin, kScreenSize.width - (3*margin + length), titleH);
    //设置日期Frame
    self.timeLabel.frame = CGRectMake(2*margin + length, CGRectGetMaxY(self.titleLabel.frame), kScreenSize.width - (3*margin + length), length - titleH);
    self.timeLabel.textAlignment = NSTextAlignmentRight;

    
}

#pragma mark - Get user Icon
- (UIImage *)getIconImage{
    NSData *data = [[NSUserDefaults standardUserDefaults] dataForKey:@"userIcon"];
    if (!data) {
        return [UIImage imageNamed:@"Mark_43"];
    }
    return [UIImage imageWithData:data];
}
@end
