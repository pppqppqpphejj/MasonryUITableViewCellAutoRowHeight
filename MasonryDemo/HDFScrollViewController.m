//
//  HDFScrollViewController.m
//  MasonryDemo
//
//  Created by huangyibiao on 15/6/2.
//  Copyright (c) 2015年 huangyibiao. All rights reserved.
//

#import "HDFScrollViewController.h"

@interface HDFScrollViewController ()

@property (nonatomic, strong) UIScrollView *scrollView;

@end

@implementation HDFScrollViewController

- (void)viewDidLoad {
    [super viewDidLoad];

  WS(self);
  
  self.scrollView = [[UIScrollView alloc] init];
  self.scrollView.backgroundColor = [UIColor lightGrayColor];
  [self.view addSubview:self.scrollView];
  
  UIView *itemView = [[UIView alloc] init];
  itemView.backgroundColor= [UIColor greenColor];
  [self.scrollView addSubview:itemView];
  [itemView mas_makeConstraints:^(MASConstraintMaker *make) {
    make.left.mas_equalTo(0);
    make.top.mas_equalTo(0);
    make.width.mas_equalTo(kScreenWidth);
    make.height.mas_equalTo(1200);
  }];
  
  [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
    make.edges.mas_equalTo(self.view);
  }];
  
  [self.scrollView mas_updateConstraints:^(MASConstraintMaker *make) {
    make.bottom.mas_equalTo(itemView.mas_bottom).offset(100);
  }];

//  UILabel *preLabel = nil;
//  
//  for (int i = 0; i < 10; i++) {
//    UILabel *label = [[UILabel alloc] init];
//    label.numberOfLines = 0;
//    label.backgroundColor = [UIColor greenColor];
//    label.text =  @"mas_remakeConstraints is similar to mas_updateConstraints, but instead of updating constant values, it will remove all of its contraints before installing them again. This lets you provide different constraints without having to keep around references to ones which you want to remove.";
//    [self.scrollView addSubview:label];
//    
//    if (preLabel == nil) {
//      [label mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.mas_equalTo(20);
//        make.width.mas_equalTo(kScreenWidth * 2);
////        make.right.equalTo(weakObject.view).offset(20);
//        make.top.mas_equalTo(10);
//      }];
//      preLabel = label;
//    } else {
//      [label mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.mas_equalTo(20);
//        make.width.mas_equalTo(kScreenWidth * 2);
//        //make.right.equalTo(weakObject.view).offset(200);
//        make.top.mas_equalTo(preLabel.mas_bottom).offset(20);
//      }];
//      preLabel = label;
//    }
//    
//    [label sizeToFit];
//  }
//  
//  [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
//    make.edges.equalTo(weakObject.view);
//    //make.bottom.equalTo(preLabel.mas_bottom).offset(20);
////    make.right.equalTo(preLabel.mas_right);
//  }];
//  self.scrollView.contentSize = CGSizeMake(kScreenWidth * 2, 1000);
}


@end
