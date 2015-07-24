//
//  HYBSecondDemoController.m
//  MasonryDemo
//
//  Created by huangyibiao on 15/6/2.
//  Copyright (c) 2015年 huangyibiao. All rights reserved.
//

#import "HYBSecondDemoController.h"

@interface HYBSecondDemoController ()

@property (weak, nonatomic) IBOutlet UIButton *constraitButton;
@property (weak, nonatomic) IBOutlet UIButton *noneConstraitButton;
@property (weak, nonatomic) IBOutlet UIButton *avgButton1;
@property (weak, nonatomic) IBOutlet UIButton *avgButton2;

@property (weak, nonatomic) IBOutlet UIButton *avgButton3;

- (IBAction)changeAvg:(id)sender;
@property (nonatomic, assign) BOOL isAnimating;
@property (nonatomic, assign) BOOL isSelected;

@property (weak, nonatomic) IBOutlet UILabel *label1;
@property (weak, nonatomic) IBOutlet UILabel *label2;
@property (weak, nonatomic) IBOutlet UIView *bgView;

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UILabel *scLabel;

@end

@implementation HYBSecondDemoController

- (void)viewDidLoad {
    [super viewDidLoad];

  self.view.backgroundColor = [UIColor whiteColor];
  
  WS(self);
  [self.constraitButton mas_makeConstraints:^(MASConstraintMaker *make) {
    make.left.mas_equalTo(20);
    make.right.mas_equalTo(-20);
    make.top.mas_equalTo(100);
  }];

  
  // 左边对齐，等宽/高，上下相关20px
  [self.noneConstraitButton mas_makeConstraints:^(MASConstraintMaker *make) {
    make.left.right.height.equalTo(self.constraitButton);
        make.top.equalTo(self.constraitButton.mas_bottom).offset(20);
  }];

  
  // 让三个按钮平分
  [self.avgButton1 mas_makeConstraints:^(MASConstraintMaker *make) {
    make.left.mas_equalTo(20);
    make.height.mas_equalTo(30);
    make.top.mas_equalTo(weakObject.noneConstraitButton.mas_bottom).offset(100);
    make.width.mas_equalTo((kScreenWidth - 40 - 40) / 3);
  }];
  
//  [self.avgButton2 mas_makeConstraints:^(MASConstraintMaker *make) {
//    make.width.top.height.mas_equalTo(weakObject.avgButton1);
//    make.left.mas_equalTo(weakObject.avgButton1.mas_right).offset(20);
//  }];
  
  [self.avgButton3 mas_makeConstraints:^(MASConstraintMaker *make) {
    make.width.top.height.mas_equalTo(weakObject.avgButton1);
    make.right.mas_equalTo(weakObject.view).offset(-20);
  }];
  
  [self.avgButton2 mas_makeConstraints:^(MASConstraintMaker *make) {
    make.top.height.mas_equalTo(weakObject.avgButton1);
    make.left.mas_equalTo(weakObject.avgButton1.mas_right).offset(20);
    make.right.mas_equalTo(weakObject.avgButton3.mas_left).offset(-20);
  }];

  self.isSelected = NO;
  
  
// //
  //
//  self.label1.text = @"mas_remakeConstraints is similar to mas_updateConstraints, but instead of updating constant values, it will remove all of its contraints before installing them again. This lets you provide different constraints without having to keep around references to ones which you want to remove.";
//  self.label2.text = @"label2 label2 label2";
//  
//  [self.label1 mas_makeConstraints:^(MASConstraintMaker *make) {
//    make.left.top.mas_equalTo(10);
//    make.right.mas_equalTo(-10);
//  }];
//  [self.label2 mas_makeConstraints:^(MASConstraintMaker *make) {
//    make.left.right.equalTo(weakObject.label1);
//    make.top.equalTo(weakObject.label1.mas_bottom).offset(20);
//    make.bottom.equalTo(weakObject.bgView.mas_bottom).offset(-20);
//  }];
//  self.label2.userInteractionEnabled = YES;
//  UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onTap:)];
//  [self.label2 addGestureRecognizer:tap];
//  
//  [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
//    make.left.mas_equalTo(10);
//    make.right.mas_equalTo(-10);
//    make.top.mas_equalTo(160);
//  }];

  
  // scrollview
  self.scLabel.text = @"mas_remakeConstraints is similar to mas_updateConstraints, but instead of updating constant values, it will remove all of its contraints before installing them again. This lets you provide different constraints without having to keep around references to ones which you want to remove.";
  self.scLabel.numberOfLines = 0;
[self.scLabel mas_makeConstraints:^(MASConstraintMaker *make) {
  make.left.mas_equalTo(10);
  make.width.mas_equalTo(kScreenWidth);
//  make.right.mas_equalTo(-10);
  make.top.mas_equalTo(100);
}];
  self.scLabel.backgroundColor = [UIColor redColor];
  self.scrollView.backgroundColor = [UIColor greenColor];
  [self.view bringSubviewToFront:self.scrollView];
  
  [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
//    make.left.mas_equalTo(10);
//    make.right.mas_equalTo(-10);
//    make.top.mas_equalTo(100);
    make.edges.mas_equalTo(UIEdgeInsetsMake(10, 10, 10, 10));
    make.bottom.equalTo(weakObject.scLabel.mas_bottom).offset(20);
    make.right.equalTo(weakObject.scLabel.mas_right);
  }];
}

- (void)onTap:(UITapGestureRecognizer *)sender {
  self.label2.text = @"mas_remakeConstraints is similar to mas_updateConstraints, but instead of updating constant values, it will remove all of its contraints before installing them again. This lets you provide different constraints without having to keep around references to ones which you want to remove.";
}

- (IBAction)changeAvg:(UIButton *)sender {
  if (self.isAnimating) {
    return;
  }
  
  self.isAnimating = YES;
  WS(self);
  if (!self.isSelected) {
    [UIView animateWithDuration:3.0 animations:^{
      [weakObject.avgButton1 mas_remakeConstraints:^(MASConstraintMaker *make) {
        // 加and其实就是获取约束本身
        make.left.right.and.height.equalTo(weakObject.noneConstraitButton);
        make.top.equalTo(weakObject.noneConstraitButton.mas_bottom).offset(80);
      }];
      
      [weakObject.avgButton2 mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.right.height.equalTo(weakObject.noneConstraitButton);
        make.top.equalTo(weakObject.avgButton1.mas_bottom).offset(30);
      }];
      
      [weakObject.avgButton3 mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.right.height.equalTo(weakObject.noneConstraitButton);
        make.top.equalTo(weakObject.avgButton2.mas_bottom).offset(30);
      }];
    } completion:^(BOOL finished) {
      weakObject.isAnimating = !finished;
      weakObject.isSelected = !weakObject.isSelected;
    }];
  } else {
    [UIView animateWithDuration:3.0 animations:^{
      // 让三个按钮平分
      [weakObject.avgButton1 mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.height.mas_equalTo(30);
        make.top.mas_equalTo(weakObject.noneConstraitButton.mas_bottom).offset(100);
        make.width.mas_equalTo((kScreenWidth - 40 - 40) / 3);
      }];
      
      [self.avgButton2 mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.width.top.height.mas_equalTo(weakObject.avgButton1);
        make.left.mas_equalTo(weakObject.avgButton1.mas_right).offset(20);
      }];
      
      [self.avgButton3 mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.width.top.height.mas_equalTo(weakObject.avgButton1);
        make.left.mas_equalTo(weakObject.avgButton2.mas_right).offset(20);
      }];
    } completion:^(BOOL finished) {
      weakObject.isAnimating = !finished;
      weakObject.isSelected = !weakObject.isSelected;
    }];
  }
  
}
@end
