//
//  XYTabBarController.m
//  XuYuFM
//
//  Created by 许郁 on 2017/5/17.
//  Copyright © 2017年 xxyy. All rights reserved.
//
// 测试111
// hhhhhhh

#import "XYTabBarController.h"
#import "XYNavigationController.h"
#import "UIImage+XMGImage.h"
#import "XYTabBar.h"
#import "XYMiddleView.h"
@interface XYTabBarController ()

@end

@implementation XYTabBarController

+ (instancetype)shareInstance{
    static XYTabBarController *tabBarVC;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        tabBarVC = [[XYTabBarController alloc]init];
    });
    return tabBarVC;
}

+ (instancetype)tabBarControllerWithAddChildVCsBlock:(void (^)(XYTabBarController *))addVCBlock{
    XYTabBarController * tabBarVC = [[XYTabBarController alloc]init];
    if (addVCBlock) {
        addVCBlock(tabBarVC);
    }
    return tabBarVC;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // 设置tabbar
    [self setUpTabbar];
}

- (void)setUpTabbar{
    [self setValue:[[XYTabBar alloc] init] forKey:@"tabBar"];
}

/**
 *  根据参数, 创建并添加对应的子控制器
 *
 *  @param vc                需要添加的控制器(会自动包装导航控制器)
 *  @param isRequired             标题
 *  @param normalImageName   一般图片名称
 *  @param selectedImageName 选中图片名称
 */
-(void)addChildVC:(UIViewController *)vc normalImageName:(NSString *)normalImageName selectedImageName:(NSString *)selectedImageName isRequiredNavController:(BOOL)isRequired{
    if (isRequired) {
        XYNavigationController * navC = [[XYNavigationController alloc]initWithRootViewController:vc];
        navC.tabBarItem = [[UITabBarItem alloc]initWithTitle:nil image:[UIImage originImageWithName:normalImageName] selectedImage:[UIImage originImageWithName:selectedImageName]];
        [self addChildViewController:navC];
    }else{
        [self addChildViewController:vc];
    }
}

- (void)setSelectedIndex:(NSUInteger)selectedIndex
{
    [super setSelectedIndex:selectedIndex];
    
    UIViewController *vc = self.childViewControllers[selectedIndex];
    if (vc.view.tag == 666) {
        vc.view.tag = 888;
        
        XYMiddleView *middleView = [XYMiddleView middleView];
        middleView.middleClickBlock = [XYMiddleView shareInstance].middleClickBlock;
        middleView.isPlaying = [XYMiddleView shareInstance].isPlaying;
        middleView.middleImg = [XYMiddleView shareInstance].middleImg;
        
        CGRect frame = middleView.frame;
        frame.size.width = 65;
        frame.size.height = 65;
        CGSize screenSize = [UIScreen mainScreen].bounds.size;
        frame.origin.x = (screenSize.width - 65) * 0.5;
        frame.origin.y = screenSize.height - 65;
        middleView.frame = frame;
        [vc.view addSubview:middleView];
        
    }
}

@end
