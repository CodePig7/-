//
//  XSNewsViewController.m
//  BaseProject
//
//  Created by AHJD-04 on 16/9/30.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "XSNewsViewController.h"
#import "XSNewsViewModel.h"
#import "XSNewsListViewController.h"

@interface XSNewsViewController ()


@end

@implementation XSNewsViewController
+ (UINavigationController *)standardXSNewsNavi{
    static UINavigationController *navi = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        XSNewsViewController *vc = [[XSNewsViewController alloc]initWithViewControllerClasses:[self viewControllerClasses] andTheirTitles:[self itemNames]];
//例如设置第一个控制器的某个属性的值 kvc
//vc setValue:[values[0]] forKey:keys[0]
        vc.keys = [self vcKeys];
        vc.values = [self vcValues];
        navi = [[UINavigationController alloc]initWithRootViewController:vc];
    });
    return navi;
}

/** 提供每个vc对应的values值数组 */
+ (NSMutableArray *)vcValues{
    NSMutableArray *arr = [NSMutableArray new];
    for (int i=0; i<[self itemNames].count; i++) {
//数值上 ,vc的infoType的枚举值 恰好和i值相同
      
        [arr addObject:@(i)];
    }
    return arr;
}

/** 提供每个VC对应的key值数组 */
+ (NSMutableArray *)vcKeys{
    NSMutableArray *arr = [NSMutableArray new];
    for (id obj in [self itemNames]) {
        
        [arr addObject:@"infoType"];
    }
    return [arr copy];
}

/** 提供题目数组 */
+ (NSArray *)itemNames{
    return @[@"最新",@"活动",@"娱乐",@"官方",@"攻略",@"收藏"];
}

/** 提供每个题目对应的控制器的类型 题目和类型数量必须一致 */
+ (NSMutableArray *)viewControllerClasses{
    NSMutableArray *arr = [NSMutableArray new];
    for (id obj in [self itemNames]) {
        [arr addObject:[XSNewsListViewController class]];
    }
    return [arr copy];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor greenSeaColor];
    self.title = @"英雄联盟";
    [Factory addMenuItemToVC:self];
}







- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/**
 *  添加点击手势  一个手指双击
 */
-(void)doubleTap:(UITapGestureRecognizer*)gesture{
    [self.mm_drawerController bouncePreviewForDrawerSide:MMDrawerSideLeft completion:nil];
}

/**
 *  添加点击手势  两个个手指双击
 */
-(void)twoFingerDoubleTap:(UITapGestureRecognizer*)gesture{
    [self.mm_drawerController bouncePreviewForDrawerSide:MMDrawerSideRight completion:nil];
}

@end
