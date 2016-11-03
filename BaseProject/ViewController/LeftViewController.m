//
//  LeftViewController.m
//  BaseProject
//
//  Created by AHJD-04 on 16/9/30.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "LeftViewController.h"
#import <NSString+Icons.h>
#import "MyDynamicViewController.h"
#import "MyDownloadViewController.h"
#import "MySubscribeViewController.h"
#import "MyCollectViewController.h"
#import "SettingViewController.h"

@interface LeftViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UIImageView *Left_bgImageView;
@property (weak, nonatomic) IBOutlet UIButton *headPortraitBtn;
@property (weak, nonatomic) IBOutlet UIButton *cardBtn;
@property (weak, nonatomic) IBOutlet UILabel *myCardLb;
@property (weak, nonatomic) IBOutlet UIView *lineView;
@property (weak, nonatomic) IBOutlet UIImageView *settingImage;
@property (weak, nonatomic) IBOutlet UIButton *settingBtn;
@property (weak, nonatomic) IBOutlet UILabel *NameLb;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation LeftViewController


- (void)viewDidLoad{
    [super viewDidLoad];
    [self leftSetting];
    self.tableView.tableFooterView = [UIView new];
//取消cell之间的分割线
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

/** 掌盟侧滑栏的按钮设置 */
- (void)leftSetting{
    //设置背景图片
    self.Left_bgImageView.contentMode = UIViewContentModeScaleToFill;
    [self.Left_bgImageView setImage:[UIImage imageNamed:@"login_bkg"]];


    //设置头像按钮的配置
    [self.headPortraitBtn setImage:[UIImage imageNamed:@"touxiang"] forState:UIControlStateNormal];
    self.headPortraitBtn.layer.cornerRadius = 20;
    self.headPortraitBtn.layer.borderWidth = 2;
    //创建色彩空间对象
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    self.headPortraitBtn.layer.borderColor = CGColorCreate(colorSpace,(CGFloat[]){173.4 ,163.2 ,130 , 1});
    [self.headPortraitBtn bk_addEventHandler:^(id sender) {
        NSLog(@"跳转至我的资料界面");//后期改动
    } forControlEvents:UIControlEventTouchUpInside];

    //设置名片按钮
    [self.cardBtn setImage:[UIImage imageNamed:@"left_card"] forState:UIControlStateNormal];
    [self.cardBtn bk_addEventHandler:^(id sender) {
        NSLog(@"跳转至我的名片");//后期改动
    } forControlEvents:UIControlEventTouchUpInside];

    //设置我的名片文本
    self.myCardLb.text = @"我的名片";
    self.myCardLb.font = [UIFont systemFontOfSize:10.0f];
    self.myCardLb.textAlignment = NSTextAlignmentCenter;
    self.myCardLb.textColor = [UIColor whiteColor];
    
    //设置按钮
    [self.settingBtn bk_addEventHandler:^(id sender) {
        NSLog(@"跳转至设置按钮");
    } forControlEvents:UIControlEventTouchUpInside];
    //设置按钮的图片
    [self.settingImage setImage:[UIImage imageNamed:@"left_setting"]];
    
    //
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.scrollEnabled = NO;

}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 4;
}
kRemoveCellSeparator
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    cell.backgroundColor = [UIColor clearColor];
    UILabel *vcNameLb = (UILabel *)[cell.contentView viewWithTag:100];
    vcNameLb.textColor = [UIColor whiteColor];
    UIImageView *vcImage = (UIImageView *)[cell.contentView viewWithTag:50];
    switch (indexPath.row) {
        case 0:
            [vcImage setImage:[UIImage imageNamed:@"left_timeline"]];
            vcNameLb.text = @"我的动态";
            break;
        case 1:
            [vcImage setImage:[UIImage imageNamed:@"left_download"]];
            vcNameLb.text = @"我的下载";
            break;
        case 2:
            [vcImage setImage:[UIImage imageNamed:@"left_subscibe"]];
            vcNameLb.text = @"我的订阅";
            break;
        case 3:
            [vcImage setImage:[UIImage imageNamed:@"left_collect"]];
            vcNameLb.text = @"我的收藏";
            break;
        default:
            break;
    }
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}










@end
