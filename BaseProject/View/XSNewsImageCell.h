//
//  XSNewsImageCell.h
//  BaseProject
//
//  Created by AHJD-04 on 16/10/21.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TRImageView.h"

@interface XSNewsImageCell : UITableViewCell
/** cell白色背景图片 */
@property (nonatomic,strong) UIImageView *bgImageView;
/** 题目标签 */
@property (nonatomic,strong) UILabel *titleLb;
/** 简介标签 */
@property (nonatomic,strong) UILabel *summaryLb;
/** 图片1 */
@property (nonatomic,strong) TRImageView *iconIV0;
/** 图片2 */
@property (nonatomic,strong) TRImageView *iconIV1;
/** 图片3 */
@property (nonatomic,strong) TRImageView *iconIV2;
/** 时间标签 */
@property (nonatomic,strong) UILabel *dateLb;
/** 阅读人数标签 */
@property (nonatomic,strong) UILabel *pvLb;
/** 图集资讯类型标签 */
@property (nonatomic,strong) TRImageView *PicNewstype;


@end
