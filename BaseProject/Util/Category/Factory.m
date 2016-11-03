//
//  Factory.m
//  BaseProject
//
//  Created by AHJD-04 on 16/9/30.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "Factory.h"


@implementation Factory

/** 向某个控制器上添加菜单按钮 */
+ (void)addMenuItemToVC:(UIViewController *)vc{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setBackgroundImage:[UIImage imageNamed:@"touxiang"] forState:UIControlStateNormal];//注意:此处头像需要要网络上获取
    btn.layer.cornerRadius = 15;
    btn.layer.masksToBounds = YES;//将头像图片设置成圆形
    btn.layer.borderWidth = 2;//头像图片按钮边框宽度
    //创建色彩空间对象
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    btn.layer.borderColor = CGColorCreate(colorSpace,(CGFloat[]){173.4 ,163.2 ,130 , 1});
    btn.frame = CGRectMake(45, 45, 30, 30);
    [btn bk_addEventHandler:^(id sender) {
        [vc.mm_drawerController toggleDrawerSide:MMDrawerSideLeft animated:YES completion:nil];
    } forControlEvents:UIControlEventTouchUpInside];
    //2、添加双击手势
    UITapGestureRecognizer * doubleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doubleTap:)];
    //2.1、双击
    [doubleTap setNumberOfTapsRequired:2];
    [vc.view addGestureRecognizer:doubleTap];
    
    //3、添加两个手指双击手势
    UITapGestureRecognizer * twoFingerDoubleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(twoFingerDoubleTap:)];
    //3.1、双击
    [twoFingerDoubleTap setNumberOfTapsRequired:2];
    //3.2、两个手指  默认为一个
    [twoFingerDoubleTap setNumberOfTouchesRequired:2];
    [vc.view addGestureRecognizer:twoFingerDoubleTap];
    UIBarButtonItem *menuItem = [[UIBarButtonItem alloc]initWithCustomView:btn];
    //使用弹簧空间缩小菜单按钮和边缘距离
    UIBarButtonItem *spaceItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    spaceItem.width = -10;
    vc.navigationItem.leftBarButtonItems = @[spaceItem,menuItem];
}

/** 向某个控制器上添加返回按钮 */
+ (void)addBackItemToVC:(UIViewController *)vc{
    
}





@end
