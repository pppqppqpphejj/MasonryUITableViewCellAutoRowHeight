//
//  HYBUI.h
//  MasonryDemo
//
//  Created by huangyibiao on 15/6/2.
//  Copyright (c) 2015年 huangyibiao. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^HYBButtonBlock)(UIButton *sender);

@interface HYBUI : NSObject

+ (UIButton *)btnWithTitle:(NSString *)title bgName:(NSString *)bgName block:(HYBButtonBlock)block;

+ (UIButton *)btnWithTitle:(NSString *)title bgName:(NSString *)bgName block:(HYBButtonBlock)block touchDown:(HYBButtonBlock)touchDown;

@end
