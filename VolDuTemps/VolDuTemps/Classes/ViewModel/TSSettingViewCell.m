//
//  TSSettingViewCell.m
//  VolDuTemps
//
//  Created by Zhuangwei PENG on 2017/10/11.
//  Copyright © 2017年 Zhuangwei PENG. All rights reserved.
//

#import "TSSettingViewCell.h"
#import "TSSettingItem.h"
#import "TSSwitchItem.h"

@interface TSSettingViewCell ()
@property (nonatomic, strong) UISwitch *switchView;
@end


@implementation TSSettingViewCell

#pragma mark - Lazy instantiation
- (UISwitch *)switchView{
    if (!_switchView) {
        _switchView = [[UISwitch alloc] init];
        [_switchView addTarget:self action:@selector(switchValueChanged) forControlEvents:UIControlEventValueChanged];
    }
    return _switchView;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.textLabel.font = [UIFont systemFontOfSize:14];
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    return self;
}

+ (instancetype)cellWithTableView:(UITableView *)tableView{
    static NSString *cellID = @"SettingCell";
    TSSettingViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[self alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellID];
    }
    return cell;
}

- (void)setItem:(TSSettingItem *)item{
    _item = item;
    [self setupData];
    [self setupAccessoryView];
}

- (void)setupData{
    self.textLabel.text = _item.title;
    self.detailTextLabel.text = _item.subTitle;
    self.imageView.image = [UIImage imageNamed:_item.image];
}

- (void)setupAccessoryView{
    if ([_item isKindOfClass:[TSSwitchItem class]]) {
        self.accessoryView = self.switchView;
    }
}
- (void)switchValueChanged{
    NSLog(@"Switch改变");
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
