//
//  XSNewsHtmlViewController.h
//  BaseProject
//
//  Created by AHJD-04 on 16/10/25.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XSNewsHtmlViewController : UIViewController

- (id)initWithURL:(NSURL *)url;
@property(nonatomic,strong) NSURL *url;

@end
