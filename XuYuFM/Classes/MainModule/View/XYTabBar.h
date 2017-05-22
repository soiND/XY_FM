//
//  XYTabBar.h
//  XuYuFM
//
//  Created by 许郁 on 2017/5/17.
//  Copyright © 2017年 xxyy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XYTabBar : UITabBar
/**
 点击中间按钮的执行代码块
 */
@property (nonatomic, copy) void(^middleClickBlock)(BOOL isPlaying);
@end
