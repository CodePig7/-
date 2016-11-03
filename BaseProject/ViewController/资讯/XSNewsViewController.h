//
//  XSNewsViewController.h
//  BaseProject
//
//  Created by AHJD-04 on 16/9/30.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WMPageController/WMPageController.h>

@interface XSNewsViewController : WMPageController

//内容页的首页应该是单例的,每次进程都只初始化了一次
+ (UINavigationController *)standardXSNewsNavi;
/**
 *  添加点击手势  一个手指双击
 */
-(void)doubleTap:(UITapGestureRecognizer*)gesture;

/**
 *  添加点击手势  两个个手指双击
 */
-(void)twoFingerDoubleTap:(UITapGestureRecognizer*)gesture;

@end
