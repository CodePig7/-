//
//  Factory.h
//  BaseProject
//
//  Created by AHJD-04 on 16/9/30.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LeftViewController.h"
#import "XSNewsViewController.h"

@interface Factory : NSObject
/** 向某个控制器上添加菜单按钮 */
+ (void)addMenuItemToVC:(UIViewController *)vc;

/** 向某个控制器上添加返回按钮 */
+ (void)addBackItemToVC:(UIViewController *)vc;
@end
