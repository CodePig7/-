//
//  XSNewsClubCell.h
//  BaseProject
//
//  Created by AHJD-04 on 16/10/21.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TRImageView.h"

@interface XSNewsClubCell : UITableViewCell
/** cell白色背景图片 */
@property (nonatomic,strong) UIImageView *bgImageView;
/** 左侧图片 */
@property (nonatomic,strong) TRImageView *iconIV;
/** 俱乐部logo图片 */
@property (nonatomic,strong) TRImageView *clubLogo;
/** 俱乐部名称标签 */
@property (nonatomic,strong) UILabel *clubNameLb;
/** 题目标签 */
@property (nonatomic,strong) UILabel *titleLb;
/** 简介标签 */
@property (nonatomic,strong) UILabel *summaryLb;
/** 时间标签 */
@property (nonatomic,strong) UILabel *dateLb;
/** 阅读人数标签 */
@property (nonatomic,strong) UILabel *pvLb;

@end
