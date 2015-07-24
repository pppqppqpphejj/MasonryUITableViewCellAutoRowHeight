//
//  HDFTableViewController.m
//  MasonryDemo
//
//  Created by huangyibiao on 15/7/24.
//  Copyright © 2015年 huangyibiao. All rights reserved.
//

#import "HDFTableViewController.h"
#import "HDFTestCell.h"
#import "UITableViewCell+HDFAutoCalculateHeight.h"

@interface HDFTableViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation HDFTableViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  self.tableView = [[UITableView alloc] init];
  [self.view addSubview:self.tableView];
  
  [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
    make.edges.mas_equalTo(self.view);
  }];
  
  self.tableView.backgroundColor = [UIColor whiteColor];
  self.tableView.delegate = self;
  self.tableView.dataSource = self;
}

- (void)viewWillDisappear:(BOOL)animated {
  [super viewWillDisappear:animated];
  
  [UITableViewCell hdf_removeCellResource];
}

- (NSInteger)numberOfSectionsInTableView:(nonnull UITableView *)tableView {
  return 4;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return random() % 20 + 3;
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView
                 cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
  static NSString *cellIdentifier = @"CellIdentifier";
  HDFTestCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
  
  if (!cell) {
    cell = [[HDFTestCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
  }

  [cell configCell];
  
  return cell;
}

- (CGFloat)tableView:(nonnull UITableView *)tableView heightForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
  // 调用方式一：
//  HDFTestCell *cell = [[HDFTestCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"sdfsdf"];
//  [cell configCell];
//  CGFloat height = [cell hdf_heightForIndexPath:indexPath];
//  
//  return height;
  
  // 调用方式二：
  return [HDFTestCell hdf_heightForIndexPath:indexPath configBlock:^(UITableViewCell *cell) {
    HDFTestCell *textCell = (HDFTestCell *)cell;
    
    // 配置数据
    [textCell configCell];
  }];
}

@end
