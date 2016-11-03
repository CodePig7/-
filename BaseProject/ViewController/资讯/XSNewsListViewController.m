//
//  XSNewsListViewController.m
//  BaseProject
//
//  Created by AHJD-04 on 16/10/19.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "XSNewsListViewController.h"
#import "XSNewsViewModel.h"
#import "XSNewsScrollViewViewModel.h"
#import "iCarousel.h"
#import "CustomPageControl.h"
#import "XSNewsListCell.h"
#import "XSNewsImageCell.h"
#import "XSNewsClubCell.h"
#import "XSNewsHtmlViewController.h"

@interface XSNewsListViewController ()<iCarouselDelegate,iCarouselDataSource>
@property (nonatomic,strong) XSNewsViewModel *newsVM;
@property (nonatomic,strong) XSNewsScrollViewViewModel *scrollVM;
@end

@implementation XSNewsListViewController
{//添加成员变量,因为不需要懒加载,所以不需要是属性
    iCarousel *_ic;
//    CustomPageControl *_pageControl;
    NSTimer *_timer;
    UIPageControl *_pageControl;
}


/** 头部滚动视图 */
- (UIView *)headerView{
    //是定时器无效
    [_timer invalidate];
    //头部视图origin无效 宽度无效 肯定是与table同宽
    UIView *headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kWindowW, kWindowW/750 * 360)];
    
    //添加滚动栏
    _ic = [iCarousel new];
    [headView addSubview:_ic];
    [_ic mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
    }];
    _ic.delegate = self;
    _ic.dataSource = self;
    _ic.pagingEnabled = YES;
    _ic.scrollSpeed = 1;
    
    //添加底部视图
    UIView *botoomView = [UIView new];
    botoomView.backgroundColor = [UIColor clearColor];
    [headView addSubview:botoomView];
    [botoomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.mas_equalTo(0);
        make.height.mas_equalTo(35);
    }];
    
    _pageControl = [UIPageControl new];
    _pageControl.numberOfPages = self.newsVM.pageNumbers;
    [botoomView addSubview:_pageControl];
    [_pageControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-10);
        make.centerY.mas_equalTo(0);
        make.left.mas_equalTo(10);
    }];
    
    //如果只有一张图,则不显示圆点
    _pageControl.hidesForSinglePage = YES;
    //如果只有一张图,则不可以滚动
    _ic.scrollEnabled = self.newsVM.pageNumbers != 1;
    _pageControl.pageIndicatorTintColor = [UIColor redColor];
    _pageControl.currentPageIndicatorTintColor = [UIColor blueColor];
    
    if (self.newsVM.pageNumbers > 1) {
        _timer = [NSTimer bk_scheduledTimerWithTimeInterval:5 block:^(NSTimer *timer) {
            [_ic scrollToItemAtIndex:_ic.currentItemIndex+1 animated:YES];
        } repeats:YES];
    }

    //小圆点不可以和用户交互
    _pageControl.userInteractionEnabled = NO;
    return headView;
}

#pragma mark - iCarouselDelegate
- (NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel{
    
    return self.newsVM.pageNumbers;
}

- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view{
    if (!view) {
        view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kWindowW, kWindowW/750 * 360 + 35)];
        UIImageView *imageView = [UIImageView new];
        [view addSubview:imageView];
        imageView.tag = 100;
        imageView.contentMode = 1;//2=UIViewContentModeScaleAspectFill
        //如果子视图的范围超出了父视图的边界，那么超出的部分就会被裁剪掉 默认是NO
        view.clipsToBounds = YES;
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
    }
    UIImageView *imageView = (UIImageView *)[view viewWithTag:100];
    [imageView setImageWithURL:[self.newsVM imageUrlBigForPage:index]placeholderImage:[UIImage imageNamed:@"asset_default_skin_bg"]];
    
    return view;
}

/** 允许循环滚动 */
- (CGFloat)carousel:(iCarousel *)carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value{
    //设置旋转木马效果
    if (option == iCarouselOptionWrap) {
        return YES;
    }
    return value;
}

//建立一个数据模型 
- (XSNewsViewModel *)newsVM{
    if (!_newsVM) {
        _newsVM = [[XSNewsViewModel alloc]initWithType:_infoType.integerValue];
    }
    return _newsVM;
}

/** 监控当前滚到了第几个 */
- (void)carouselCurrentItemIndexDidChange:(iCarousel *)carousel{
//    NSLog(@"%ld", carousel.currentItemIndex);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[XSNewsListCell class] forCellReuseIdentifier:@"ListCell"];
    [self.tableView registerClass:[XSNewsImageCell class] forCellReuseIdentifier:@"ImageCell"];
    [self.tableView registerClass:[XSNewsClubCell class] forCellReuseIdentifier:@"ClubCell"];
    
    self.tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.newsVM refreshDataCompletionHandle:^(NSError *error) {
            self.tableView.tableHeaderView = [self headerView];
            [self.tableView.header endRefreshing];
            [self.tableView reloadData];
        }];
        
    }];
    self.tableView.footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [self.newsVM getMoreDataCompletionHandle:^(NSError *error) {
            self.tableView.tableHeaderView = [self headerView];
            [self.tableView.footer endRefreshing];
            [self.tableView reloadData];
        }];
    }];
    [self.tableView.header beginRefreshing];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

#pragma mark - TableView dataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.newsVM.rowNumber;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//cell类型是图集的话
    if ([[self.newsVM newstypeForRow:indexPath.row] isEqualToString:@"图集"]) {
        XSNewsImageCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ImageCell"];
        cell.titleLb.text = [self.newsVM titleForRow:indexPath.row];
        cell.summaryLb.text = [self.newsVM summaryForRow:indexPath.row];
        cell.dateLb.text = [self.newsVM dateForRow:indexPath.row];
        cell.pvLb.text = [self.newsVM pvForRow:indexPath.row];
        [cell.iconIV0.imageView setImageWithURL:[self.newsVM bigImageURLForRowInList:indexPath.row] placeholderImage:[UIImage imageNamed:@"asset_default_skin_bg"]];
        [cell.iconIV1.imageView setImageWithURL:[self.newsVM oherImageURLForRowInList:indexPath.row] placeholderImage:[UIImage imageNamed:@"asset_default_skin_bg"]];
        [cell.iconIV2.imageView setImageWithURL:[self.newsVM countImageURLForRowInList:indexPath.row] placeholderImage:[UIImage imageNamed:@"asset_default_skin_bg"]];
        cell.backgroundColor = [UIColor colorWithRed:0.93 green:0.93 blue:0.94 alpha:1.00];
        return cell;
//cell类型是俱乐部类型
    }else if ([[self.newsVM newstypeForRow:indexPath.row] isEqualToString:@"俱乐部"]){
        XSNewsClubCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ClubCell"];
        [cell.iconIV.imageView setImageWithURL:[self.newsVM imageURLForRow:indexPath.row]placeholderImage:[UIImage imageNamed:@"asset_default_skin_bg"]];
        [cell.clubLogo.imageView setImageWithURL:[self.newsVM clubLogoImageURLForRowInList:indexPath.row]];
        cell.clubNameLb.text = [self.newsVM clubNameForRowInList:indexPath.row];
        cell.titleLb.text = [self.newsVM titleForRow:indexPath.row];
        cell.summaryLb.text = [self.newsVM summaryForRow:indexPath.row];
        cell.dateLb.text = [self.newsVM dateForRow:indexPath.row];
        cell.pvLb.text = [self.newsVM pvForRow:indexPath.row];
        cell.backgroundColor = [UIColor colorWithRed:0.93 green:0.93 blue:0.94 alpha:1.00];
        return cell;
//cell类型是普通类型
    }else{
        XSNewsListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ListCell"];
        [cell.iconIV.imageView setImageWithURL:[self.newsVM imageURLForRow:indexPath.row]placeholderImage:[UIImage imageNamed:@"asset_default_skin_bg"]];
        cell.titleLb.text = [self.newsVM titleForRow:indexPath.row];
        cell.summaryLb.text = [self.newsVM summaryForRow:indexPath.row];
        cell.dateLb.text = [self.newsVM dateForRow:indexPath.row];
        cell.pvLb.text = [self.newsVM pvForRow:indexPath.row];
        cell.backgroundColor = [UIColor colorWithRed:0.93 green:0.93 blue:0.94 alpha:1.00];
        return cell;
    }
}
/** 去掉分割线左侧缝隙 */
kRemoveCellSeparator
/** 点击cell跳转界面*/
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    XSNewsHtmlViewController *vc = [[XSNewsHtmlViewController alloc]initWithURL:[NSURL URLWithString:[self.newsVM articleURLForRow:indexPath.row]]];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/** 滚动栏中被选中后触发 */
- (void)carousel:(iCarousel *)carousel didSelectItemAtIndex:(NSInteger)index{
    XSNewsHtmlViewController *vc = [[XSNewsHtmlViewController alloc]initWithURL:[self.newsVM articleUrlForPage:index]];
    [self.navigationController pushViewController:vc animated:YES];
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([[self.newsVM newstypeForRow:indexPath.row] isEqualToString:@"图集"]) {
        return kWindowW*435/750;
    }else if ([[self.newsVM newstypeForRow:indexPath.row] isEqualToString:@"俱乐部"]){
        return kWindowW*233/750;
    }else{
        return kWindowW*195/750;
    }
}


@end
