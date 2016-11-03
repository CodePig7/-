//
//  AppDelegate.m
//  BaseProject
//
//  Created by jiyingxin on 15/10/21.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "AppDelegate.h"
#import "AppDelegate+Category.h"
#import "XSNewsViewController.h"
#import "LeftViewController.h"

@interface AppDelegate ()
/** MMDrawerController属性 */
@property(nonatomic,strong) MMDrawerController *drawerController;
@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [self initializeWithApplication:application];
    [self configGlobalUIStyle];
    self.window.rootViewController = self.drawerController;
    
    return YES;
}

/** 配置全局UI的样式 */
- (void)configGlobalUIStyle{
/** 导航栏不透明 */
    [[UINavigationBar appearance] setTranslucent:NO];
/** 设置导航栏背景图 */
    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"nav_bar_bg_for_seven"] forBarMetrics:UIBarMetricsDefault];
/** 配置导航栏题目的样式 RGB 68 64 51*/
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSFontAttributeName:[UIFont flatFontOfSize:kNaviTitleFontSize],NSForegroundColorAttributeName:kNaviTitleColor}];
}

/** 代码重构 */
- (UIWindow *)window{
    if (!_window) {
        _window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
        [_window makeKeyAndVisible];
    }
    return _window;
}

- (MMDrawerController *)drawerController{
    if (!_drawerController) {
        //设置drawController
        UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        _drawerController = [[MMDrawerController alloc]initWithCenterViewController:[XSNewsViewController standardXSNewsNavi] leftDrawerViewController:[mainStoryboard instantiateViewControllerWithIdentifier:@"left"]];
        //设置打开/关闭抽屉的手势
        self.drawerController.openDrawerGestureModeMask = MMOpenDrawerGestureModeAll;
        self.drawerController.closeDrawerGestureModeMask = MMCloseDrawerGestureModeAll;
        //设置左右两边抽屉显示的多少
        self.drawerController.maximumLeftDrawerWidth = 0.8*kWindowW;
    }
    return _drawerController;
}


@end


