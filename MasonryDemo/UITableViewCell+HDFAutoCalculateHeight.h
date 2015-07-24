//
//  UITableView+HDFAutoCalculateHeight.h
//  MasonryDemo
//
//  Created by huangyibiao on 15/7/24.
//  Copyright © 2015年 huangyibiao. All rights reserved.
//

/**
 *  This is a very very helpful category for NSTimer.
 *
 *  @author huangyibiao
 *  @email  huangyibiao520@163.com
 *  @github https://github.com/632840804
 *  @blog   http://blog.csdn.net/woaifen3344
 *
 *  @note Make friends with me.
 *        Facebook: huangyibiao520@163.com (Jacky Huang)
 *        QQ:(632840804)
 *        Weixin:(huangyibiao520)
 *        Please tell me your real name when you send message to me.3Q.
 */


#import <UIKit/UIKit.h>

/**
 * 获取高度前会回调，需要在此BLOCK中配置数据，才能正确地获取高度
 */
typedef void(^HDFCellConfigBlock)(UITableViewCell *cell);

/**
 * @author huangyibiao
 *
 * 此扩展是用于自动计算cell的高度
 */
@interface UITableViewCell (HDFAutoCalculateHeight)

/**
 * @author huangyibiao
 *
 * @note UI布局必须放在UITableViewCell的初始化方法中：
 *
 * - initWithStyle:reuseIdentifier:
 *
 * 才能生效
 */

/**
 * @author huangyibiao
 * 
 * 必须要调用此方法。在布局UI完成后，也就是到最后一个控件布局完成后，调用此API，设置
 * cell的最后一个控件，及该控件距离底部的偏移
 */
- (void)hdf_setCellLastView:(UIView *)lastView bottomOffset:(CGFloat)bottomOffset;
- (void)hdf_setCellLastView:(UIView *)lastView;

/**
 * @author huangyibiao
 *
 * 如果是调用此API获取，需要这样写：
 * - (CGFloat)tableView:(nonnull UITableView *)tableView heightForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
     // 创建一个cell
     HDFTestCell *cell = [[HDFTestCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"sdfsdf"];
     // 先配置数据
     [cell configCell];
     // 再获取高度
     CGFloat height = [cell hdf_heightForIndexPath:indexPath];
     
     return height;
 }
 */
- (CGFloat)hdf_heightForIndexPath:(NSIndexPath *)indexPath;

/**
 * @author huangyibiao
 *
 *   // 调用方式二：
     return [HDFTestCell hdf_heightForIndexPath:indexPath configBlock:^(UITableViewCell *cell) {
     // 转换成对应的类型
     HDFTestCell *textCell = (HDFTestCell *)cell;
     
     // 配置数据，才能更新约束获取高度
     [textCell configCell];
     }];
 *
 */
+ (CGFloat)hdf_heightForIndexPath:(NSIndexPath *)indexPath configBlock:(HDFCellConfigBlock)configBlock;

/**
 * @author huangyibiao
 *
 * 需要在viewWillDisappear中调用，否则进入另一个界面也使用tableview时，可能会出现高度被重用的问题
 */
+ (void)hdf_removeCellResource;

@end
