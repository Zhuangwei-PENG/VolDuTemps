//
//  TSTableViewCell.m
//  VolDuTemps
//
//  Created by Zhuangwei PENG on 2017/10/9.
//  Copyright © 2017年 Zhuangwei PENG. All rights reserved.
//

#import "TSTableViewCell.h"
#import "Addition.h"

@interface TSTableViewCell()

@property (nonatomic, strong) UILabel *titleLbl;
@property (nonatomic, strong) UILabel *textLbl;
@property (nonatomic, strong) UILabel *timeLbl;
@property (nonatomic, strong) UIView *bottomLine;

@end


@implementation TSTableViewCell
#pragma mark - Lazy instantiation
- (UIView *)bottomLine{
    if (!_bottomLine) {
        _bottomLine = [[UIView alloc] init];
    }
    return _bottomLine;
}

- (UILabel *)titleLbl{
    if (!_titleLbl) {
        _titleLbl = [[UILabel alloc] init];
    }
    return _titleLbl;
}

- (UILabel *)textLbl{
    if (!_textLbl) {
        _textLbl = [[UILabel alloc] init];
    }
    return _textLbl;
}

- (UILabel *)timeLbl{
    if (!_timeLbl) {
        _timeLbl = [[UILabel alloc] init];
    }
    return _timeLbl;
}

- (void)setDairyModel:(TSDairyModel *)dairyModel{
    _dairyModel = dairyModel;
    self.textLbl.text = dairyModel.text;
    self.titleLbl.text = dairyModel.title;
    self.timeLbl.text = dairyModel.time;
    
}

#pragma mark - designed initializer
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        [self setupCell];
    }
    return self;
}

//设置字体大小
- (void)setTitleFont:(CGFloat)titleFont{
    _titleFont = titleFont;
    self.titleLbl.font = [UIFont systemFontOfSize:_titleFont];
    self.textLbl.font = [UIFont systemFontOfSize:_titleFont-2];
    self.timeLbl.font = [UIFont systemFontOfSize:_titleFont-2];
}

- (void)setupCell{
    
    [self.contentView addSubview:self.titleLbl];
    [self.contentView addSubview:self.textLbl];
    [self.contentView addSubview:self.timeLbl];
    [self.contentView addSubview:self.bottomLine];
    
    self.bottomLine.backgroundColor = [UIColor colorWithHex:0xEDEDED];
    self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    self.titleLbl.numberOfLines = 1;
    self.textLbl.numberOfLines = 3;
    self.timeLbl.numberOfLines = 1;
    
    if (self.titleFont == 0) {
        self.titleFont = 15;
    }
    self.titleLbl.font = [UIFont systemFontOfSize:self.titleFont];
    self.textLbl.font = [UIFont systemFontOfSize:self.titleFont-2];
    self.timeLbl.font = [UIFont systemFontOfSize:self.titleFont-2];
    
    for (UIView *subview in self.contentView.subviews) {
        //取消autoresizing
        subview.translatesAutoresizingMaskIntoConstraints = NO;
    }
    
    //设置对齐
    self.timeLbl.textAlignment = NSTextAlignmentRight;

    //自动布局
    CGFloat margin = 8;
    //设置titleLbl的自动布局
    [self.contentView addConstraints:@[[NSLayoutConstraint constraintWithItem:self.titleLbl
                                                                    attribute:NSLayoutAttributeTop
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:self.contentView
                                                                    attribute:NSLayoutAttributeTop
                                                                   multiplier:1
                                                                     constant:margin],
                                       
                                       [NSLayoutConstraint constraintWithItem:self.titleLbl
                                                                    attribute:NSLayoutAttributeLeft
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:self.contentView
                                                                    attribute:NSLayoutAttributeLeft
                                                                   multiplier:1
                                                                     constant:margin],
                                       
                                       [NSLayoutConstraint constraintWithItem:self.titleLbl
                                                                    attribute:NSLayoutAttributeWidth
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:nil
                                                                    attribute:NSLayoutAttributeNotAnAttribute
                                                                   multiplier:1
                                                                     constant:180]
                                       ]];
    
    //设置timeLbl的自动布局
    [self.contentView addConstraints:@[[NSLayoutConstraint constraintWithItem:self.timeLbl
                                                                    attribute:NSLayoutAttributeTop
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:self.titleLbl
                                                                    attribute:NSLayoutAttributeTop
                                                                   multiplier:1
                                                                     constant:0],
                                       
                                       [NSLayoutConstraint constraintWithItem:self.timeLbl
                                                                    attribute:NSLayoutAttributeRight
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:self.contentView
                                                                    attribute:NSLayoutAttributeRight
                                                                   multiplier:1
                                                                     constant: -margin],
                                       
                                       [NSLayoutConstraint constraintWithItem:self.timeLbl
                                                                    attribute:NSLayoutAttributeLeft
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:self.titleLbl
                                                                    attribute:NSLayoutAttributeRight
                                                                   multiplier:1
                                                                     constant:margin]
                                       ]];

    //设置textLbl的自动布局
    [self.contentView addConstraints:@[[NSLayoutConstraint constraintWithItem:self.textLbl
                                                                    attribute:NSLayoutAttributeTop
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:self.titleLbl
                                                                    attribute:NSLayoutAttributeBottom
                                                                   multiplier:1
                                                                     constant:2* margin],
                                       
                                       [NSLayoutConstraint constraintWithItem:self.textLbl
                                                                    attribute:NSLayoutAttributeLeft
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:self.titleLbl
                                                                    attribute:NSLayoutAttributeLeft
                                                                   multiplier:1
                                                                     constant:2 * margin],
                                       
                                       [NSLayoutConstraint constraintWithItem:self.textLbl
                                                                    attribute:NSLayoutAttributeRight
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:self.timeLbl
                                                                    attribute:NSLayoutAttributeRight
                                                                   multiplier:1
                                                                     constant:0]
                                       ]];
    //设置cell底部的分割线
    [self.contentView addConstraints:@[[NSLayoutConstraint constraintWithItem:self.bottomLine
                                                                    attribute:NSLayoutAttributeTop
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:self.contentView
                                                                    attribute:NSLayoutAttributeBottom
                                                                   multiplier:1
                                                                     constant:-1],

                                       [NSLayoutConstraint constraintWithItem:self.bottomLine
                                                                    attribute:NSLayoutAttributeLeft
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:self.titleLbl
                                                                    attribute:NSLayoutAttributeLeft
                                                                   multiplier:1
                                                                     constant:2 * margin],

                                       [NSLayoutConstraint constraintWithItem:self.bottomLine
                                                                    attribute:NSLayoutAttributeRight
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:self.textLbl
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
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
