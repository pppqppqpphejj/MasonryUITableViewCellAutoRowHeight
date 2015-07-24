//
//  HDFTestCell.m
//  MasonryDemo
//
//  Created by huangyibiao on 15/7/24.
//  Copyright © 2015年 huangyibiao. All rights reserved.
//

#import "HDFTestCell.h"
#import "UITableViewCell+HDFAutoCalculateHeight.h"

@interface HDFTestCell ()

@property (nonatomic, strong) UILabel *mainLabel;
@property (nonatomic, strong) UILabel *descLabel;
@property (nonatomic, strong) UIButton *button;

@end

@implementation HDFTestCell

- (nonnull instancetype)initWithStyle:(UITableViewCellStyle)style
                      reuseIdentifier:(nullable NSString *)reuseIdentifier {
  if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
    self.mainLabel = [[UILabel alloc] init];
    [self.contentView addSubview:self.mainLabel];
    self.mainLabel.numberOfLines = 0;
    [self.mainLabel sizeToFit];
    [self.mainLabel mas_makeConstraints:^(MASConstraintMaker *make) {
      make.left.mas_equalTo(15);
      make.top.mas_equalTo(20);
      make.right.mas_equalTo(-15);
      make.height.mas_lessThanOrEqualTo(80);
    }];
    
    self.descLabel = [[UILabel alloc] init];
    [self.contentView addSubview:self.descLabel];
    self.descLabel.numberOfLines = 0;
    [self.descLabel sizeToFit];
    [self.descLabel mas_makeConstraints:^(MASConstraintMaker *make) {
      make.left.mas_equalTo(15);
      make.right.mas_equalTo(-15);
      make.top.mas_equalTo(self.mainLabel.mas_bottom).offset(15);
    }];
    
    self.button = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.contentView addSubview:self.button];
    [self.button sizeToFit];
    [self.button setTitle:@"我是cell的最后一个" forState:UIControlStateNormal];
    [self.button setBackgroundColor:[UIColor greenColor]];
    [self.button mas_makeConstraints:^(MASConstraintMaker *make) {
      make.left.mas_equalTo(15);
      make.right.mas_equalTo(-15);
      make.height.mas_equalTo(45);
      make.top.mas_equalTo(self.descLabel.mas_bottom).offset(40);
    }];
    
    // 必须加上这句
    [self hdf_setCellLastView:self.button bottomOffset:20];
  }
  
  return self;
}

- (void)configCell {
  self.mainLabel.text = @"测试标题可能很长很长很长测试标题可能很长很长很长测试标题可能很长很长很长测试标题可能很长很长很长";

  self.descLabel.text = @"描述内容可能更长更长描述内容可能更长更长描述内容可能更长更长描述内容可能更长更长描述内容可能更长更长描述内容可能更长更长描述内容可能更长更长描述内容内容可能更长更长描述内容可能更长更长描述内容可能更长更长描述内容可能更长更长描述内容可能更长更长描述内容可能更长更长描述内容可能更长更长描述内容可能更长更长描述内容可能更长更长描述内容可能更长更长";
}

@end
