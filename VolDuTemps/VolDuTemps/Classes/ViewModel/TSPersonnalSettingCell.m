//
//  TSPersonnalSettingCell.m
//  VolDuTemps
//
//  Created by Zhuangwei PENG on 2017/10/12.
//  Copyright © 2017年 Zhuangwei PENG. All rights reserved.
//

#import "TSPersonnalSettingCell.h"


@interface TSPersonnalSettingCell()

@property (nonatomic, strong) UIImageView *iconView;
@property (nonatomic, strong) UILabel *detailLabel;
@property (nonatomic, strong) UILabel *txtLabel;

@property (nonatomic, assign) TSPersonnalSettingCellType type;

@end

@implementation TSPersonnalSettingCell
#pragma mark - Lazy instantiation
- (UIImageView *)iconView{
    if (!_iconView) {
        _iconView = [[UIImageView alloc] init];
    }
    return _iconView;
}

- (UILabel *)txtLabel{
    if (!_txtLabel) {
        _txtLabel = [[UILabel alloc] init];
    }
    return _txtLabel;
}
- (UILabel *)detailLabel{
    if (!_detailLabel) {
        _detailLabel = [[UILabel alloc] init];
    }
    return _detailLabel;
}

- (void)setItem:(TSSettingItem *)item{
    _txtLabel.text = item.title;
    if (item.image) {
        _iconView.image= item.image;
    }
    if ([item.subTitle length]) {
        _detailLabel.text = item.subTitle;
    }
}

#pragma mark - designed initializer
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        [self setupCellWithType:reuseIdentifier];
    }
    return self;
}

+ (instancetype)cellWithTableView:(UITableView *)tableView type:(TSPersonnalSettingCellType)type{
    NSString *cellID = @"TSPersonnalSettingCellTypeRightImage";
    if (type == TSPersonnalSettingCellTypeRIghtText) {
        cellID = @"TSPersonnalSettingCellTypeRIghtText";
    }
    TSPersonnalSettingCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[self alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellID];
    }
    return cell;
}

- (void)setupCellWithType:(NSString *)type{
    [self.contentView addSubview:self.txtLabel];

    self.txtLabel.numberOfLines = 1;
    self.txtLabel.textColor = [UIColor darkTextColor];
    self.txtLabel.font = [UIFont systemFontOfSize:15];
    
    if ([type hasSuffix:@"Text"]) {
        [self.contentView addSubview:self.detailLabel];
        self.detailLabel.numberOfLines = 1;
        self.detailLabel.textColor = [UIColor lightGrayColor];
        self.detailLabel.font = [UIFont systemFontOfSize:14];
    }else{
        [self.contentView addSubview:self.iconView];
        self.iconView.layer.cornerRadius = 10;
        self.iconView.layer.masksToBounds = YES;
    }
    
    for (UIView *subview in self.contentView.subviews) {
        [subview sizeToFit];
        //取消autoresizing
        subview.translatesAutoresizingMaskIntoConstraints = NO;
    }
    
    UIView *rightView = self.contentView.subviews.lastObject;
    //自动布局
    CGFloat margin = 8;
    
    //设置titleLbl的自动布局
    [self.contentView addConstraints:@[[NSLayoutConstraint constraintWithItem:self.txtLabel
                                                                    attribute:NSLayoutAttributeTop
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:self.contentView
                                                                    attribute:NSLayoutAttributeTop
                                                                   multiplier:1
                                                                     constant:margin],
                                       
                                       [NSLayoutConstraint constraintWithItem:self.txtLabel
                                                                    attribute:NSLayoutAttributeLeft
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:self.contentView
                                                                    attribute:NSLayoutAttributeLeft
                                                                   multiplier:1
                                                                     constant:margin],
                                       
                                       [NSLayoutConstraint constraintWithItem:self.txtLabel
                                                                    attribute:NSLayoutAttributeBottom
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:self.contentView
                                                                    attribute:NSLayoutAttributeBottom
                                                                   multiplier:1
                                                                     constant:-margin],
                                       ]];
    
    [self.contentView addConstraints:@[[NSLayoutConstraint constraintWithItem:rightView
                                                                    attribute:NSLayoutAttributeTop
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:self.txtLabel
                                                                    attribute:NSLayoutAttributeTop
                                                                   multiplier:1
                                                                     constant:0],
                                       
                                       [NSLayoutConstraint constraintWithItem:rightView
                                                                    attribute:NSLayoutAttributeRight
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:self.contentView
                                                                    attribute:NSLayoutAttributeRight
                                                                   multiplier:1
                                                                     constant:margin],
                                       
                                       [NSLayoutConstraint constraintWithItem:rightView
                                                                    attribute:NSLayoutAttributeBottom
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:self.contentView
                                                                    attribute:NSLayoutAttributeBottom
                                                                   multiplier:1
                                                                     constant:-margin],
                                       
                                       ]];
    
    if ([rightView isKindOfClass:[UIImageView class]]) {
    
        [self.contentView addConstraints:@[[NSLayoutConstraint constraintWithItem:rightView
                                                                        attribute:NSLayoutAttributeWidth
                                                                        relatedBy:NSLayoutRelationEqual
                                                                           toItem:rightView
                                                                        attribute:NSLayoutAttributeHeight
                                                                       multiplier:1
                                                                         constant:0]
                                           
                                           ]];
    }
    
}

@end
