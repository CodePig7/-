//
//  XSNewsViewModel.m
//  BaseProject
//
//  Created by AHJD-04 on 16/10/19.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "XSNewsViewModel.h"

@implementation XSNewsViewModel

- (instancetype)initWithType:(InfoType)type{
    if (self= [super init]) {
        _type = type;
    }
    return self;
}

//预防性编程 防止没有使用initWithType初始化
- (id)init{
    if (self = [super init]) {
        //如果使用此方法初始化 那么崩溃提示
        NSAssert1(NO, @"%s 必须使用initWithType初始化", __FUNCTION__);
    }
    return self;
}


- (void)getDataFromNetCompleteHandle:(CompletionHandle)completeHandle{
    self.dataTask = [XSNewsNetManager getNewsInfoWithType:_type Page:_page completionHandle:^(XSNewsModel *model, NSError *error) {
        if (_page == 0) {
            [self.dataArr removeAllObjects];
        }
        [self.dataArr addObjectsFromArray:model.list];
        completeHandle(error);
    }];
}
//上拉刷新
- (void)refreshDataCompletionHandle:(CompletionHandle)completeHandle{
    _page = 0;
    self.scrollDataTask = [XSNewsNetManager getScrollViewImageCompletionHandle:^(XSNewsScrollViewModel *scroModel, NSError *error) {
        self.indexPicArr = nil;
        self.indexPicArr = scroModel.list;
        completeHandle(error);
    }];
    [self getDataFromNetCompleteHandle:completeHandle];
}

//下拉刷新
- (void)getMoreDataCompletionHandle:(CompletionHandle)completeHandle{
    _page += 1;
    [self getDataFromNetCompleteHandle:completeHandle];
}

- (NSInteger)rowNumber{
    return self.dataArr.count;
}

- (NewsListModel *)modelForArr:(NSArray *)arr row:(NSInteger)row{
    return arr[row];
}

- (XSNewsScrollViewListModel *)modelForArr:(NSArray *)arr page:(NSInteger)page{
    return arr[page];
}

/** 返回滚动视图中图片对应的文章链接 */
- (NSURL *)articleUrlForPage:(NSInteger)page{
    return [NSURL URLWithString:[self modelForArr:self.indexPicArr page:page].article_url];
}
/** 返回滚动视图中图片对应的图片链接 */
- (NSURL *)imageUrlBigForPage:(NSInteger)page{
    return [NSURL URLWithString:[self modelForArr:self.indexPicArr page:page].image_url_big];
}

- (NSInteger)pageNumbers{
    return self.indexPicArr.count;
}


/** 返回列表中某行数据的图片链接地址 */
- (NSURL *)imageURLForRow:(NSInteger)row{
    return [NSURL URLWithString:[self modelForArr:self.dataArr row:row].image_url_small];
}
/** 返回列表中某行数据的标题 */
- (NSString *)titleForRow:(NSInteger)row{
    return [self modelForArr:self.dataArr row:row].title;
}
/** 返回列表中某行数据的概要 */
- (NSString *)summaryForRow:(NSInteger)row{
    return [self modelForArr:self.dataArr row:row].summary;
}
/** 返回列表中某行数据的时间是多少分钟前 */
- (NSString *)dateForRow:(NSInteger)row{
    NSString *startTime = [self modelForArr:self.dataArr row:row].publication_date;
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *now = [NSDate date];
    NSTimeZone *zone = [NSTimeZone localTimeZone];
    NSInteger interval = [zone secondsFromGMTForDate:now];
    NSDate *currentDate = [now dateByAddingTimeInterval:interval];
    NSString *currentTime = [formatter stringFromDate:currentDate];
    return [self dateTimeDifferenceWithStartTime:startTime endTime:currentTime];
}

/** 返回列表中某行数据的阅读数 */
- (NSString *)pvForRow:(NSInteger)row{
    NSInteger pv = [self modelForArr:self.dataArr row:row].pv.integerValue;
    if (pv>=10000) {
        return [NSString stringWithFormat:@"%ld万阅",pv/10000];
    }else{
        return [NSString stringWithFormat:@"%ld阅",pv];
    }
}

/** 返回列表中某行数据的资讯类型 */
- (NSString *)newstypeForRow:(NSInteger)row{
    return [self modelForArr:self.dataArr row:row].newstype;
}

/** 返回列表中某行数据的网址链接  article_url */
- (NSString *)articleURLForRow:(NSInteger)row{
    return [self modelForArr:self.dataArr row:row].article_url;
}

- (XSNewsPicModel*)modelForArr:(NSArray *)arr row1:(NSInteger)row1
{
    return arr[row1];
}



/** 图集情况下  返回此行对应的大图链接地址 */
- (NSURL *)bigImageURLForRowInList:(NSInteger)row{
    return [NSURL URLWithString:[self modelForArr:self.dataArr row:row].big_image_url];
}
/** 图集情况下  返回此行对应的有图片数量图的链接地址 */
- (NSURL *)countImageURLForRowInList:(NSInteger)row{
    return [NSURL URLWithString:[self modelForArr:self.dataArr row:row].count_image_url];
}
/** 图集情况下  返回此行对应的另外一张图片的链接地址 */
- (NSURL *)oherImageURLForRowInList:(NSInteger)row{
    return [NSURL URLWithString:[self modelForArr:self.dataArr row:row].image_url_small];
}

/** 俱乐部资讯情况下  返回此行对应的俱乐部logo图片的链接地址 */
- (NSURL *)clubLogoImageURLForRowInList:(NSInteger)row{
    return [NSURL URLWithString:[self modelForArr:self.dataArr row:row].club_logo];
}

/** 俱乐部资讯情况下  返回此行对应的俱乐部名称 */
- (NSString *)clubNameForRowInList:(NSInteger)row{
    return [self modelForArr:self.dataArr row:row].club_name;
}


/** 当前资讯数据类型是活动 act */
- (BOOL)isActInListForRow:(NSInteger)row{
    return [[self modelForArr:self.dataArr row:row].is_act isEqualToString:@"1"];
}
/** 当前资讯数据类型是否hot Hot */
- (BOOL)isHotInListForRow:(NSInteger)row{
    return [[self modelForArr:self.dataArr row:row].is_hot isEqualToString:@"1"];
}
/** 当前资讯数据类型是否new New */
- (BOOL)isNewInListForRow:(NSInteger)row{
    return [[self modelForArr:self.dataArr row:row].is_new isEqualToString:@"1"];
}
/** 当前资讯数据类型是否top TOP */
- (BOOL)isTopInListForRow:(NSInteger)row{
    return [[self modelForArr:self.dataArr row:row].is_top isEqualToString:@"1"];
}

/** 当前资讯数据类型是否是视频 video*/
- (BOOL)isVideoInListForRow:(NSInteger)row{
    return [[self modelForArr:self.dataArr row:row].newstype isEqualToString:@"视频"];
}
/** 当前资讯数据类型是否是图集 pic*/
- (BOOL)isPicInListForRow:(NSInteger)row{
    return [[self modelForArr:self.dataArr row:row].newstype isEqualToString:@"图集"];
}
/** 当前资讯数据类型是否是俱乐部 club*/
- (BOOL)isClubInListForRow:(NSInteger)row{
    return [[self modelForArr:self.dataArr row:row].newstype isEqualToString:@"俱乐部"];
}
/** 当前资讯数据类型是否是专题 Spec*/
- (BOOL)isSpecInListForRow:(NSInteger)row{
    return [[self modelForArr:self.dataArr row:row].newstype isEqualToString:@"专题"];
}
/** 当前资讯数据类型是否是Html*/
- (BOOL)isHtmlInListForRow:(NSInteger)row{
    return [[self modelForArr:self.dataArr row:row].newstype isEqualToString:@""];
}

/** 返回某行数据的article_id=ContentId*/
- (NSString *)contentIdInListForRow:(NSInteger)row{
    return [self modelForArr:self.dataArr row:row].content_id;
}
/** 时间差 */
- (NSString *)dateTimeDifferenceWithStartTime:(NSString *)startTime endTime:(NSString *)endTime{
    NSDateFormatter *date = [[NSDateFormatter alloc]init];
    [date setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *startD = [date dateFromString:startTime];
    NSDate *endD = [date dateFromString:endTime];
    NSTimeInterval start = [startD timeIntervalSince1970]*1;
    NSTimeInterval end = [endD timeIntervalSince1970]*1;
    NSTimeInterval value = end - start - 8*3600;
    int minute = (int)value/60 %60;//分
    int hour = (int)value/3600 % 24;
    int day = (int)value/ (24 * 3600);
    NSString *str;
    if (day!= 0) {
        NSDateFormatter *dateFormatter = [NSDateFormatter new];
        [dateFormatter setDateFormat:@"yyyy-MM-dd"];
        str = [dateFormatter stringFromDate:startD];
    }else if (day==0 && hour!=0){
        str = [NSString stringWithFormat:@"%d小时前",hour];
    }else if (day==0 && hour==0 && minute!=0){
        str = [NSString stringWithFormat:@"%d分钟前",minute];
    }else{
        str = @"刚刚";
    }
    return str;
    
}







@end
