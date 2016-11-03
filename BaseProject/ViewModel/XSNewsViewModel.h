//
//  XSNewsViewModel.h
//  BaseProject
//
//  Created by AHJD-04 on 16/10/19.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "XSNewsNetManager.h"
#import "XSNewsScrollViewViewModel.h"

@interface XSNewsViewModel : BaseViewModel

@property (nonatomic,strong) XSNewsScrollViewViewModel *scrollVM;

@property (nonatomic,strong) NSURLSessionDataTask *scrollDataTask;

//* 存放头部滚动栏 */
@property (nonatomic,strong) NSArray *indexPicArr;

/** 返回滚动视图中包含的图片数 */
@property(nonatomic)NSInteger pageNumbers;

/** 返回滚动视图中图片对应的文章链接 */
- (NSURL *)articleUrlForPage:(NSInteger)page;
/** 返回滚动视图中图片对应的图片链接 */
- (NSURL *)imageUrlBigForPage:(NSInteger)page;

/** 必须使用此初始化方法 需要一个类型*/
- (instancetype)initWithType:(InfoType)type;
@property(nonatomic) InfoType type;

@property(nonatomic)NSInteger rowNumber;


/** 返回列表中某行数据的图片链接地址 */
- (NSURL *)imageURLForRow:(NSInteger)row;
/** 返回列表中某行数据的标题 */
- (NSString *)titleForRow:(NSInteger)row;
/** 返回列表中某行数据的概要 */
- (NSString *)summaryForRow:(NSInteger)row;
/** 返回列表中某行数据的时间是多少分钟前 */
- (NSString *)dateForRow:(NSInteger)row;
/** 返回列表中某行数据的阅读数 */
- (NSString *)pvForRow:(NSInteger)row;
/** 返回列表中某行数据的资讯类型 */
- (NSString *)newstypeForRow:(NSInteger)row;
/** 返回列表中某行数据的网址链接  article_url */
- (NSString *)articleURLForRow:(NSInteger)row;

/** 当前资讯数据类型是活动 act */
- (BOOL)isActInListForRow:(NSInteger)row;
/** 当前资讯数据类型是否hot Hot */
- (BOOL)isHotInListForRow:(NSInteger)row;
/** 当前资讯数据类型是否new New */
- (BOOL)isNewInListForRow:(NSInteger)row;
/** 当前资讯数据类型是否top TOP */
- (BOOL)isTopInListForRow:(NSInteger)row;
/** 当前资讯数据类型是否是视频 video*/
- (BOOL)isVideoInListForRow:(NSInteger)row;
/** 当前资讯数据类型是否是图片 pic*/
- (BOOL)isPicInListForRow:(NSInteger)row;
/** 当前资讯数据类型是否是俱乐部 club*/
- (BOOL)isClubInListForRow:(NSInteger)row;
/** 当前资讯数据类型是否是专题 Spec*/
- (BOOL)isSpecInListForRow:(NSInteger)row;
/** 当前资讯数据类型是否是Html*/
- (BOOL)isHtmlInListForRow:(NSInteger)row;




@property(nonatomic) NSInteger page;

/** 图集情况下  返回此行对应的大图链接地址 */
- (NSURL *)bigImageURLForRowInList:(NSInteger)row;
/** 图集情况下  返回此行对应的有图片数量图的链接地址 */
- (NSURL *)countImageURLForRowInList:(NSInteger)row;
/** 图集情况下  返回此行对应的另外一张图片的链接地址 */
- (NSURL *)oherImageURLForRowInList:(NSInteger)row;

/** 俱乐部资讯情况下  返回此行对应的俱乐部logo图片的链接地址 */
- (NSURL *)clubLogoImageURLForRowInList:(NSInteger)row;

/** 俱乐部资讯情况下  返回此行对应的俱乐部名称 */
- (NSString *)clubNameForRowInList:(NSInteger)row;

/** 返回某行数据的article_id=ContentId*/
- (NSString *)contentIdInListForRow:(NSInteger)row;











@end

