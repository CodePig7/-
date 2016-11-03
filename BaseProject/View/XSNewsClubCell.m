//
//  XSNewsClubCell.m
//  BaseProject
//
//  Created by AHJD-04 on 16/10/21.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "XSNewsClubCell.h"

@implementation XSNewsClubCell
- (UIImageView *)bgImageView {
    if(_bgImageView == nil) {
        _bgImageView = [[UIImageView alloc] init];
        _bgImageView.backgroundColor = [UIColor whiteColor];
    }
    return _bgImageView;
}

- (TRImageView *)iconIV {
    if(_iconIV == nil) {
        _iconIV = [[TRImageView alloc] init];
    }
    return _iconIV;
}

- (TRImageView *)clubLogo {
    if(_clubLogo == nil) {
        _clubLogo = [[TRImageView alloc] init];
    }
    return _clubLogo;
}

- (UILabel *)clubNameLb {
    if(_clubNameLb == nil) {
        _clubNameLb = [[UILabel alloc] init];
        _clubNameLb.font = [UIFont systemFontOfSize:12];
        _clubNameLb.textColor = [UIColor lightGrayColor];
    }
    return _clubNameLb;
}

- (UILabel *)titleLb {
    if(_titleLb == nil) {
        _titleLb = [[UILabel alloc] init];
        _titleLb.font = [UIFont systemFontOfSize:14];
    }
    return _titleLb;
}

- (UILabel *)summaryLb {
    if(_summaryLb == nil) {
        _summaryLb = [[UILabel alloc] init];
        _summaryLb.font = [UIFont systemFontOfSize:12];
        _summaryLb.textColor = [UIColor lightGrayColor];
        _summaryLb.numberOfLines = 2;
    }
    return _summaryLb;
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

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.bgImageView];
        [self.contentView addSubview:self.iconIV];
        [self.contentView addSubview:self.clubLogo];
        [self.contentView addSubview:self.clubNameLb];
        [self.contentView addSubview:self.titleLb];
        [self.contentView addSubview:self.summaryLb];
        [self.contentView addSubview:self.dateLb];
        [self.contentView addSubview:self.pvLb];
        
//背景图片 左5 右5 上5 高 kWindowW*230/705
        [self.bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(3);
            make.left.mas_equalTo(8);
            make.right.mas_equalTo(-8);
            make.height.mas_equalTo(kWindowW*230/750-6);
        }];
//图片 左10，宽高92,70,竖直向上
        [self.iconIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(15);
            make.top.mas_equalTo(10);
            make.size.mas_equalTo(CGSizeMake(kWindowW/4, kWindowW/4*132/176));
        }];
//俱乐部logo图片 距离图片右边缘 8 上边缘与图片一样高 宽高 10 10
        [self.clubLogo mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(_iconIV.mas_right).mas_equalTo(8);
            make.top.mas_equalTo(10);
            make.size.mas_equalTo(CGSizeMake(10, 10));
        }];
//俱乐部名称标签 距离logo图片右边缘 8 上边缘与图片一样高 距离右边缘 10
        [self.clubNameLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(_clubLogo.mas_right).mas_equalTo(8);
            make.top.mas_equalTo(10);
            make.right.mas_equalTo(-10);
        }];
//标题 距离图片右缘8 右边缘10 上边缘与图片上边缘一样高
        [self.titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(_iconIV.mas_right).mas_equalTo(8);
            make.top.mas_equalTo(_clubLogo.mas_bottom).mas_equalTo(8);
            make.right.mas_equalTo(-10);
        }];
//简介 左右边缘与题目一样,上边距离题目下边8像素
        [self.summaryLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(_iconIV.mas_right).mas_equalTo(8);
            make.right.mas_equalTo(-10);
            make.top.mas_equalTo(_titleLb.mas_bottom).mas_equalTo(8);
        }];
//时间 下边缘比图片底部下移3  左边缘与简介对齐
        [self.dateLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(_iconIV.mas_right).mas_equalTo(8);
            make.bottom.mas_equalTo(_summaryLb.mas_bottom).mas_equalTo(8);
        }];
//阅读人数 下边缘与时间标签一致 左边缘距离时间标签10像素
        [self.pvLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(_summaryLb.mas_bottom).mas_equalTo(8);
            make.left.mas_equalTo(_dateLb.mas_right).mas_equalTo(10);
        }];
    }
    return self;
}

@end
