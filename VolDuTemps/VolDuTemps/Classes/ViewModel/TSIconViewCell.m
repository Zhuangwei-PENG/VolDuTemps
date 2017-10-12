//
//  TSIconViewCell.m
//  VolDuTemps
//
//  Created by Zhuangwei PENG on 2017/10/12.
//  Copyright © 2017年 Zhuangwei PENG. All rights reserved.
//

#import "TSIconViewCell.h"
#import "TSSwitchItem.h"
@interface TSIconViewCell()

@property (nonatomic, strong) UIImageView *iconView;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *timeLabel;

@end

@implementation TSIconViewCell
#pragma mark - Lazy instantiation
- (UIImageView *)iconView{
    if (!_iconView) {
        _iconView = [[UIImageView alloc] init];
    }
    return _iconView;
}

- (UILabel *)nameLabel{
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] init];
    }
    return _nameLabel;
}

- (UILabel *)timeLabel{
    if (!_timeLabel) {
        _timeLabel = [[UILabel alloc] init];
    }
    return _timeLabel;
}

- (void)setItem:(TSSettingItem *)item{
    _iconView.image = [UIImage imageNamed:item.image];
    _nameLabel.text = item.title;
    _timeLabel.text = @"请设置您的生日";
    if ([item.subTitle length]) {
       _timeLabel.text = item.subTitle;
    }
    
}

#pragma mark - designed initializer
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        [self setupCell];
    }
    return self;
}

+ (instancetype)cellWithTableView:(UITableView *)tableView{
    static NSString *cellID = @"iconViewCell";
    TSIconViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[self alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellID];
    }
    return cell;
}



- (void)setupCell{
    [self.contentView addSubview:self.iconView];
    [self.contentView addSubview:self.nameLabel];
    [self.contentView addSubview:self.timeLabel];
    
//    self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    self.iconView.layer.cornerRadius = 10;
    self.iconView.layer.masksToBounds = YES;
    
    self.nameLabel.numberOfLines = 1;
    self.timeLabel.numberOfLines = 1;
    
    self.nameLabel.textColor = [UIColor darkTextColor];
    self.timeLabel.textColor = [UIColor lightGrayColor];
    
    self.nameLabel.font = [UIFont systemFontOfSize:15];
    self.timeLabel.font = [UIFont systemFontOfSize:14];
    
    
    
    for (UIView *subview in self.contentView.subviews) {
        [subview sizeToFit];
        //取消autoresizing
        subview.translatesAutoresizingMaskIntoConstraints = NO;
    }
    
    //自动布局
    CGFloat margin = 15;
    CGFloat iconH = 70;
    
    //设置titleLbl的自动布局
    [self.contentView addConstraints:@[[NSLayoutConstraint constraintWithItem:self.iconView
                                                                    attribute:NSLayoutAttributeTop
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:self.contentView
                                                                    attribute:NSLayoutAttributeTop
                                                                   multiplier:1
                                                                     constant:margin],
                                       
                                       [NSLayoutConstraint constraintWithItem:self.iconView
                                                                    attribute:NSLayoutAttributeLeft
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:self.contentView
                                                                    attribute:NSLayoutAttributeLeft
                                                                   multiplier:1
                                                                     constant:margin],
                                       
                                       [NSLayoutConstraint constraintWithItem:self.iconView
                                                                    attribute:NSLayoutAttributeWidth
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:nil
                                                                    attribute:NSLayoutAttributeNotAnAttribute
                                                                   multiplier:1
                                                                     constant:iconH],
                                       
                                       [NSLayoutConstraint constraintWithItem:self.iconView
                                                                    attribute:NSLayoutAttributeHeight
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:nil
                                                                    attribute:NSLayoutAttributeNotAnAttribute
                                                                   multiplier:1
                                                                     constant:iconH]
                                       ]];
    
    [self.contentView addConstraints:@[[NSLayoutConstraint constraintWithItem:self.nameLabel
                                                                    attribute:NSLayoutAttributeTop
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:self.iconView
                                                                    attribute:NSLayoutAttributeTop
                                                                   multiplier:1
                                                                     constant:0.5 * margin],
                                       
                                       [NSLayoutConstraint constraintWithItem:self.nameLabel
                                                                    attribute:NSLayoutAttributeLeft
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:self.iconView
                                                                    attribute:NSLayoutAttributeRight
                                                                   multiplier:1
                                                                     constant:margin],
                                       
                                       ]];
    
    [self.contentView addConstraints:@[[NSLayoutConstraint constraintWithItem:self.timeLabel
                                                                    attribute:NSLayoutAttributeBottom
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:self.iconView
                                                                    attribute:NSLayoutAttributeBottom
                                                                   multiplier:1
                                                                     constant:-0.5 *margin],
                                       
                                       [NSLayoutConstraint constraintWithItem:self.timeLabel
                                                                    attribute:NSLayoutAttributeLeft
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:self.nameLabel
                                                                    attribute:NSLayoutAttributeLeft
                                                                   multiplier:1
                                                                     constant:0],

                                       ]];
    
}







- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}


//+ (instancetype)cellWithTableView:(UITableView *)tableView{
//    static NSString *cellID = @"iconCell";
//    TSIconViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
//    if (!cell) {
//        cell = [[self alloc] init];
//    }
//    cell.imageView.layer.cornerRadius = 10;
//    cell.imageView.layer.masksToBounds = YES;
//
//    return cell;
//}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
