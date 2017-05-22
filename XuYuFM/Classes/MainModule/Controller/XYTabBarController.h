//
//  XYTabBarController.h
//  XuYuFM
//
//  Created by 许郁 on 2017/5/17.
//  Copyright © 2017年 xxyy. All rights reserved.
//

#import <UIKit/UIKit.h>
@class XYTabBarController;
@interface XYTabBarController : UITabBarController
/**
 获取单例对象
 
 @return TabBarController
 */
+ (instancetype)shareInstance;

/**
 添加子控制器的block
 
 @param addVCBlock 添加代码块
 
 @return TabBarController
 */
+ (instancetype)tabBarControllerWithAddChildVCsBlock: (void(^)(XYTabBarController *tabBarVC))addVCBlock;

/**
 添加子控制器
 
 @param vc                子控制器
 @param normalImageName   普通状态下图片
 @param selectedImageName 选中图片
 @param isRequired        是否需要包装导航控制器
 */
- (void)addChildVC: (UIViewController *)vc normalImageName: (NSString *)normalImageName selectedImageName: (NSString *)selectedImageName isRequiredNavController: (BOOL)isRequired;
@end
