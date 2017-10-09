//
//  TSTableViewCell.m
//  VolDuTemps
//
//  Created by Zhuangwei PENG on 2017/10/9.
//  Copyright © 2017年 Zhuangwei PENG. All rights reserved.
//

#import "TSTableViewCell.h"
#import "TSDairyModel.h"

@interface TSTableViewCell()

@property (nonatomic, strong) UILabel *titleLbl;
@property (nonatomic, strong) UILabel *textLbl;
@property (nonatomic, strong) UILabel *timeLbl;

@end


@implementation TSTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    [self setupCell];
    
    return self;
}

- (void)setDairyModel:(TSDairyModel *)dairyModel{
    _dairyModel = dairyModel;
    self.textLbl.text = dairyModel.text;
    self.titleLbl.text = dairyModel.title;
//    self.timeLbl.text = dairyModel.time;
    
}

- (void)setupCell{
    self.contentView.backgroundColor = [UIColor yellowColor];
    self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    UILabel *titleLbl = [[UILabel alloc] init];
    UILabel *textLbl = [[UILabel alloc] init];
    UILabel *timeLbl = [[UILabel alloc] init];
    
    self.titleLbl = titleLbl;
    self.textLbl = textLbl;
    self.timeLbl = timeLbl;
    
    [self.contentView addSubview:self.titleLbl];
    [self.contentView addSubview:self.textLbl];
    [self.contentView addSubview:self.timeLbl];
    
    self.titleLbl.numberOfLines = 1;
    self.textLbl.numberOfLines = 3;
    self.timeLbl.numberOfLines = 1;
    
    //设置字体大小

    
    for (UIView *subview in self.contentView.subviews) {
        //取消autoresizing
        subview.translatesAutoresizingMaskIntoConstraints = NO;
        //自动调节大小
//        [subview sizeToFit];
    }
    
    //测试内容

    self.titleLbl.backgroundColor = [UIColor redColor];
    self.textLbl.backgroundColor = [UIColor darkGrayColor];
    self.timeLbl.text = @"2017-10-9";
    self.timeLbl.textAlignment = NSTextAlignmentRight;

    
    
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
                                                                     constant:200]
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
                                                                    attribute:NSLayoutAttributeRight
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:self.titleLbl
                                                                    attribute:NSLayoutAttributeRight
                                                                   multiplier:1
                                                                     constant:96]
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
                                                                     constant:0],
                                       
                                       [NSLayoutConstraint constraintWithItem:self.textLbl
                                                                    attribute:NSLayoutAttributeRight
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:self.timeLbl
                                                                    attribute:NSLayoutAttributeRight
                                                                   multiplier:1
                                                                     constant:0]
                                       ]];
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
