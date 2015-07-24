//
//  HYBFirstDemoController.m
//  MasonryDemo
//
//  Created by huangyibiao on 15/6/2.
//  Copyright (c) 2015年 huangyibiao. All rights reserved.
//

#import "HYBFirstDemoController.h"
#import "HDFScrollViewController.h"

@implementation HYBFirstDemoController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  [self centerSupperView];
  self.view.backgroundColor = [UIColor whiteColor];
}

- (void)centerSupperView {
  /**
    使用XIB或者Storyboard时，如果要使用Masonry来完成自动布局，那么必须去掉
    XIB或者storyboard中的autolayout和sizeclass，否则两者会冲突。
    虽然两者都使用，有时候也一样达到相同的效果，但是会提示冲突Log，所以不建议两者
    混合使用
   */
  WS(self);
  
  // 从此以后基本可以抛弃CGRectMake了
  UIView *sv = [UIView new];
  sv.backgroundColor = [UIColor redColor];
  // 在做autoLayout之前 一定要先将view添加到superview上 否则会报错
  [self.view addSubview:sv];
  sv.tag = 100;
  // mas_makeConstraints就是Masonry的autolayout添加函数 将所需的约束添加到block中行了
  [sv mas_makeConstraints:^(MASConstraintMaker *make) {
    //将sv居中(很容易理解吧?)
    make.center.equalTo(weakObject.view);
    
    //将size设置成(300,300)
    make.size.mas_equalTo(CGSizeMake(300, 300));
  }];
  
  // 添加一个距离边缘10的视图
  UIView *ev = [[UIView alloc] init];
  [self.view addSubview:ev];
  ev.backgroundColor = [UIColor greenColor];
  [ev mas_makeConstraints:^(MASConstraintMaker *make) {
    make.edges.equalTo(sv).insets(UIEdgeInsetsMake(10, 10, 10, 10));
  }];
  
  UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
  [self.view addSubview:btn1];
  [btn1 setBackgroundColor:[UIColor redColor]];
  [btn1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
  [btn1 setTitle:@"centerY上移10PX" forState:UIControlStateNormal];
  [btn1 mas_makeConstraints:^(MASConstraintMaker *make) {
    make.left.equalTo(sv);
    make.top.equalTo(sv.mas_bottom).offset(80);
    make.width.mas_equalTo(kScreenWidth - 40);
    make.height.mas_equalTo(35);
  }];
  [btn1 addTarget:self action:@selector(onBtn1Clicked:) forControlEvents:UIControlEventTouchUpInside];
  btn1.selected = NO;
  
}

- (void)onBtn1Clicked:(UIButton *)sender {
  WS(self);
  
  UIView *sv = [self.view viewWithTag:100];
  
  /* 说明：
  - (NSArray *)mas_makeConstraints:(void(^)(MASConstraintMaker *make))block;
  - (NSArray *)mas_updateConstraints:(void(^)(MASConstraintMaker *make))block;
  - (NSArray *)mas_remakeConstraints:(void(^)(MASConstraintMaker *make))block;
  
   mas_makeConstraints 只负责新增约束 Autolayout不能同时存在两条针对于同一对象的约束 否则会报错
   mas_updateConstraints 针对上面的情况 会更新在block中出现的约束 不会导致出现两个相同约束的情况
   mas_remakeConstraints 则会清除之前的所有约束 仅保留最新的约束
   三种函数善加利用 就可以应对各种情况了
   
  */

  if (sender.isSelected) {
    // 会先remove之前的这条约束，然后使用此处修改的约束
    [sv mas_remakeConstraints:^(MASConstraintMaker *make) {
      make.centerY.equalTo(weakObject.view);
    }];
  } else {
    // 动态更新sv这个视图的约束
    [sv mas_updateConstraints:^(MASConstraintMaker *make) {
      make.centerY.equalTo(weakObject.view).offset(-10);
    }];
  }
  
  // 查询最近的公共视图
 UIView *commonSupperView = [sv mas_closestCommonSuperview:sender];
  if (commonSupperView == self.view) {
    NSLog(@"found common supper view");
  }
}

@end
