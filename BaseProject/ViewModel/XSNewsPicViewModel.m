//
//  XSNewsPicViewModel.m
//  BaseProject
//
//  Created by AHJD-04 on 16/10/29.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "XSNewsPicViewModel.h"

@implementation XSNewsPicViewModel

- (id)initWitharticleId:(NSString *)articleId{
    if (self = [super init]) {
        self.articleId = articleId;
    }
    return self;
}

/** 防御性编程，不允许使用init初始化 */
- (id)init{
    if (self = [super init]) {
        //%s->__func__  会显示 哪个类中的哪个方法
        NSAssert1(NO, @"%s 必须使用initWithAid初始化", __func__);
    }
    return self;
}

- (void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle{
    self.dataTask = [XSNewsNetManager getPicDetailWithContentId:_articleId completionHandle:^(XSNewsPicModel *model, NSError *error) {
        self.picModel = model;
        completionHandle(error);
    }];
}

- (NSInteger)rowNumber{
    return self.picModel.list.count;
}

- (NSURL *)picURLForRow:(NSInteger)row{
    XSNewsPicListModel *model = self.picModel.list[row];
    return [NSURL URLWithString:model.img_url];
}

@end
