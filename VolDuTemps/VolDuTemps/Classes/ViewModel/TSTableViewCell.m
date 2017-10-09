//
//  TSTableViewCell.m
//  VolDuTemps
//
//  Created by Zhuangwei PENG on 2017/10/9.
//  Copyright © 2017年 Zhuangwei PENG. All rights reserved.
//

#import "TSTableViewCell.h"

@implementation TSTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    [self setupCell];
    
    return self;
}

- (void)setupCell{
    self.contentView.backgroundColor = [UIColor yellowColor];
    
    UILabel *titleLbl = [[UILabel alloc] init];
    UILabel *textLbl = [[UILabel alloc] init];
    UILabel *timeLbl = [[UILabel alloc] init];
    
    [self.contentView addSubview:titleLbl];
    [self.contentView addSubview:textLbl];
    [self.contentView addSubview:timeLbl];
    
    titleLbl.numberOfLines = 1;
    textLbl.numberOfLines = 3;
    timeLbl.numberOfLines = 1;
    
    //设置字体大小

    
    for (UIView *subview in self.contentView.subviews) {
        //取消autoresizing
        subview.translatesAutoresizingMaskIntoConstraints = NO;
        //自动调节大小
        [subview sizeToFit];
    }
    
    //测试内容
    titleLbl.text = @"第一个日记第一个日记第一个日记第一个日记";
    titleLbl.backgroundColor = [UIColor redColor];
    
    textLbl.text = @"2017-10-9xxxxxxxxxxxxxxxxxx2017-10-9xxxxxxxxxxxxxxxxxx2017-10-9xxxxxxxxxxxxxxxxxx2017-10-9xxxxxxxxxxxxxxxxxx2017-10-9xxxxxxxxxxxxxxxxxx2017-10-9xxxxxxxxxxxxxxxxxx";
    textLbl.backgroundColor = [UIColor darkGrayColor];
    
    timeLbl.text = @"2017-10-9";
    timeLbl.backgroundColor = [UIColor greenColor];
    
    
    CGFloat margin = 8;
    //设置timeLbl的自动布局
    [self.contentView addConstraints:@[[NSLayoutConstraint constraintWithItem:timeLbl
                                                                    attribute:NSLayoutAttributeTop
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:self.contentView
                                                                    attribute:NSLayoutAttributeTop
                                                                   multiplier:1
                                                                     constant:margin],
                                       
                                       [NSLayoutConstraint constraintWithItem:timeLbl
                                                                    attribute:NSLayoutAttributeRight
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:self.contentView
                                                                    attribute:NSLayoutAttributeRight
                                                                   multiplier:1
                                                                     constant: -margin]
                                       ]];
    //设置titleLbl的自动布局
    [self.contentView addConstraints:@[[NSLayoutConstraint constraintWithItem:titleLbl
                                                                    attribute:NSLayoutAttributeTop
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:timeLbl
                                                                    attribute:NSLayoutAttributeTop
                                                                   multiplier:1
                                                                     constant:0],

                                       [NSLayoutConstraint constraintWithItem:titleLbl
                                                                    attribute:NSLayoutAttributeLeft
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:self.contentView
                                                                    attribute:NSLayoutAttributeLeft
                                                                   multiplier:1
                                                                     constant:margin],
                                       
                                       [NSLayoutConstraint constraintWithItem:titleLbl
                                                                    attribute:NSLayoutAttributeRight
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:timeLbl
                                                                    attribute:NSLayoutAttributeLeft
                                                                   multiplier:1
                                                                     constant:margin]
                                       ]];

    //设置textLbl的自动布局
    [self.contentView addConstraints:@[[NSLayoutConstraint constraintWithItem:textLbl
                                                                    attribute:NSLayoutAttributeTop
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:titleLbl
                                                                    attribute:NSLayoutAttributeBottom
                                                                   multiplier:1
                                                                     constant:margin],
                                       
                                       [NSLayoutConstraint constraintWithItem:textLbl
                                                                    attribute:NSLayoutAttributeLeft
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:titleLbl
                                                                    attribute:NSLayoutAttributeLeft
                                                                   multiplier:1
                                                                     constant:0],
                                       
                                       [NSLayoutConstraint constraintWithItem:textLbl
                                                                    attribute:NSLayoutAttributeRight
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:timeLbl
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
