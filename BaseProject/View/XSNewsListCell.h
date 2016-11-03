//
//  XSNewsListCell.h
//  BaseProject
//
//  Created by AHJD-04 on 16/10/21.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TRImageView.h"
@interface XSNewsListCell : UITableViewCell
/** cell白色背景图片 */
@property (nonatomic,strong) UIImageView *bgImageView;
/** 左侧图片 */
@property (nonatomic,strong) TRImageView *iconIV;
/** 题目标签 */
@property (nonatomic,strong) UILabel *titleLb;
/** 简介标签 */
@property (nonatomic,strong) UILabel *summaryLb;
/** 时间标签 */
@property (nonatomic,strong) UILabel *dateLb;
/** 阅读人数标签 */
@property (nonatomic,strong) UILabel *pvLb;
/** 资讯类型标识 */
//@property (nonatomic,strong) TRImageView *newstypeImageView;




@end
