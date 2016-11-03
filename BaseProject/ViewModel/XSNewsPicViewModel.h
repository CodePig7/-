//
//  XSNewsPicViewModel.h
//  BaseProject
//
//  Created by AHJD-04 on 16/10/29.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "XSNewsNetManager.h"

@interface XSNewsPicViewModel : BaseViewModel

/** 必须使用下方初始化方法 */
@property (nonatomic,strong) NSString *articleId;

@property(nonatomic) NSInteger rowNumber;
- (NSURL *)picURLForRow:(NSInteger)row;
@property (nonatomic,strong) XSNewsPicModel *picModel;
@end
