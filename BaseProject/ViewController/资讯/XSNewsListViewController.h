//
//  XSNewsListViewController.h
//  BaseProject
//
//  Created by AHJD-04 on 16/10/19.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XSNewsScrollViewViewModel.h"

@interface XSNewsListViewController : UITableViewController
/** 接收外部传参 决定当前控制器显示哪种类型的信息 */
@property (nonatomic,strong) NSNumber *infoType;

@end
