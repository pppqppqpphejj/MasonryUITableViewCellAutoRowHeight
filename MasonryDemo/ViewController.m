//
//  ViewController.m
//  MasonryDemo
//
//  Created by huangyibiao on 15/6/2.
//  Copyright (c) 2015年 huangyibiao. All rights reserved.
//

#import "ViewController.h"
#import "HYBFirstDemoController.h"
#import "HYBSecondDemoController.h"
#import "HDFScrollViewController.h"
#import "HDFTableViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
//  
//  UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
//  [button setTitle:@"点我" forState:UIControlStateNormal];
//  [self.view addSubview:button];
//  [button mas_makeConstraints:^(MASConstraintMaker *make) {
//    make.left.mas_equalTo(15);
//    make.width.mas_equalTo(kScreenWidth - 30);
//    make.top.mas_equalTo(100);
//    make.height.mas_equalTo(45);
//  }];
//  button.backgroundColor = [UIColor greenColor];
//  [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
//  
//  [button addTarget:self action:@selector(moveMe:) forControlEvents:UIControlEventTouchUpInside];
  
  // 按钮1
  // 注意：每个控件必须先加入到一个父视图中，才能添加约束，否则会crash
  UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
  [self.view addSubview:btn1];
  [btn1 setBackgroundColor:[UIColor redColor]];
  [btn1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
  [btn1 setTitle:@"demo1" forState:UIControlStateNormal];
  [btn1 mas_makeConstraints:^(MASConstraintMaker *make) {
    make.left.mas_equalTo(20);
    make.top.mas_equalTo(100);
    make.width.mas_equalTo(kScreenWidth - 40);
    make.height.mas_equalTo(35);
  }];
  [btn1 addTarget:self action:@selector(onBtn1Clicked:) forControlEvents:UIControlEventTouchUpInside];
  
  UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
  [self.view addSubview:btn2];
  [btn2 setBackgroundColor:[UIColor redColor]];
  [btn2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
  [btn2 setTitle:@"xib demo2" forState:UIControlStateNormal];
  [btn2 mas_makeConstraints:^(MASConstraintMaker *make) {
    make.left.mas_equalTo(20);
    make.top.equalTo(btn1.mas_bottom).offset(40);
    make.width.equalTo(btn1);
    make.height.mas_equalTo(btn1.mas_height);
  }];
  [btn2 addTarget:self action:@selector(onBtn2Clicked:) forControlEvents:UIControlEventTouchUpInside];

  // 使用leading,trailing
  UIButton *btn3 = [UIButton buttonWithType:UIButtonTypeCustom];
  [self.view addSubview:btn3];
  [btn3 setBackgroundColor:[UIColor redColor]];
  [btn3 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
  [btn3 setTitle:@"leading and trailing" forState:UIControlStateNormal];
  [btn3 mas_makeConstraints:^(MASConstraintMaker *make) {
    make.leading.trailing.height.equalTo(btn2);
    make.top.equalTo(btn2.mas_bottom).offset(40);
  }];
  [btn3 addTarget:self action:@selector(onBtn3Clicked:) forControlEvents:UIControlEventTouchUpInside];
  

}

- (void)moveMe:(UIButton *)sender {
  [sender mas_updateConstraints:^(MASConstraintMaker *make) {
    make.left.mas_equalTo(sender.frame.origin.x + 2);
    make.height.mas_equalTo(45);
    make.top.mas_equalTo(sender.frame.origin.y + 2);
  }];
}

- (void)onBtn1Clicked:(UIButton *)sender {
  HDFTableViewController *vc = [[HDFTableViewController alloc] init];
  vc.hidesBottomBarWhenPushed = YES;
  [self.navigationController pushViewController:vc animated:YES];
  //
  return;
  HYBFirstDemoController *first = [[HYBFirstDemoController alloc] init];
  first.hidesBottomBarWhenPushed = YES;
  [self.navigationController pushViewController:first animated:YES];
}

- (void)onBtn2Clicked:(UIButton *)sender {
  HYBSecondDemoController *second = [[HYBSecondDemoController alloc] init];
  second.hidesBottomBarWhenPushed = YES;
  [self.navigationController pushViewController:second animated:YES];
}

- (void)onBtn3Clicked:(UIButton *)sender {
  HDFScrollViewController *second = [[HDFScrollViewController alloc] init];
  second.hidesBottomBarWhenPushed = YES;
  [self.navigationController pushViewController:second animated:YES];
}

@end
