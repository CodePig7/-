//
//  XSNewsImageCell.m
//  BaseProject
//
//  Created by AHJD-04 on 16/10/21.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "XSNewsImageCell.h"

@implementation XSNewsImageCell

- (UIImageView *)bgImageView {
    if(_bgImageView == nil) {
        _bgImageView = [[UIImageView alloc] init];
        _bgImageView.backgroundColor = [UIColor whiteColor];
    }
    return _bgImageView;
}

- (UILabel *)titleLb {
    if(_titleLb == nil) {
        _titleLb = [[UILabel alloc] init];
        //字体加粗了
        _titleLb.font = [UIFont systemFontOfSize:15];
    }
    return _titleLb;
}

- (UILabel *)summaryLb {
    if(_summaryLb == nil) {
        _summaryLb = [[UILabel alloc] init];
        _summaryLb.font = [UIFont systemFontOfSize:12];
        _summaryLb.textColor = [UIColor lightGrayColor];
        _summaryLb.numberOfLines = 1;
    }
    return _summaryLb;
}

- (TRImageView *)iconIV0 {
    if(_iconIV0 == nil) {
        _iconIV0 = [[TRImageView alloc] init];
    }
    return _iconIV0;
}

- (TRImageView *)iconIV1 {
    if(_iconIV1 == nil) {
        _iconIV1 = [[TRImageView alloc] init];
    }
    return _iconIV1;
}

- (TRImageView *)iconIV2 {
    if(_iconIV2 == nil) {
        _iconIV2 = [[TRImageView alloc] init];
    }
    return _iconIV2;
}

- (UILabel *)dateLb {
    if(_dateLb == nil) {
        _dateLb = [[UILabel alloc] init];
        _dateLb.font = [UIFont systemFontOfSize:10];
        _dateLb.textColor = [UIColor lightGrayColor];
    }
    return _dateLb;
}

- (UILabel *)pvLb {
    if(_pvLb == nil) {
        _pvLb = [[UILabel alloc] init];
        _pvLb.textColor = kNaviTitleColor;
        _pvLb.font = [UIFont systemFontOfSize:10];
    }
    return _pvLb;
}

- (TRImageView *)PicNewstype {
    if(_PicNewstype == nil) {
        _PicNewstype = [[TRImageView alloc] init];
    }
    return _PicNewstype;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.bgImageView];
        [self.contentView addSubview: self.titleLb];
        [self.contentView addSubview:self.summaryLb];
        [self.contentView addSubview:self.iconIV0];
        [self.contentView addSubview:self.iconIV1];
        [self.contentView addSubview:self.iconIV2];
        [self.contentView addSubview:self.dateLb];
        [self.contentView addSubview:self.pvLb];
//        [self.contentView addSubview:self.PicNewstype];
    }
//背景图片 左5 右5 上5 高 kWindowW*174/705
    [self.bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(3);
        make.left.mas_equalTo(8);
        make.right.mas_equalTo(-8);
        make.height.mas_equalTo(kWindowW*435/750-6);
    }];
//题目标签 距离左 右边缘10 上边缘10像素
    [self.titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(10);
        make.left.mas_equalTo(15);
        make.right.mas_equalTo(-10);
    }];
//简介标签 左边缘与题目标签一致 上边缘距离题目标签 8像素
    [self.summaryLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.top.mas_equalTo(_titleLb.mas_bottom).mas_equalTo(8);
        make.right.mas_equalTo(_titleLb.mas_rightMargin);
    }];
// 图片0
    [self.iconIV0 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.top.mas_equalTo(_summaryLb.mas_bottom).mas_equalTo(8);
        //图片0的宽高比是250*550
        make.width.mas_equalTo((kWindowW-25)/4*3);
        make.height.mas_equalTo(100);
    }];
// 图片1
    [self.iconIV1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_iconIV0.mas_right).mas_equalTo(5);
        make.top.mas_equalTo(_summaryLb.mas_bottom).mas_equalTo(8);
        make.right.mas_equalTo(-10);
        make.height.mas_equalTo(_iconIV2);
    }];
// 图片2
    [self.iconIV2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_iconIV0.mas_right).mas_equalTo(5);
        make.top.mas_equalTo(_iconIV1.mas_bottom).mas_equalTo(5);
        make.right.mas_equalTo(-10);
        make.bottom.mas_equalTo(_iconIV0.mas_bottomMargin);
    }];
//时间标签
    [self.dateLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.bottom.mas_equalTo(-10);
    }];
//阅读人数
    [self.pvLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(-10);
        make.left.mas_equalTo(_dateLb.mas_right).mas_equalTo(10);
    }];
//图集资讯类型标签
//    [self.PicNewstype mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.bottom.right.mas_equalTo(-10);
//    }];
    return self;
}

@end
