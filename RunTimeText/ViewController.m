//
//  ViewController.m
//  RunTimeText
//
//  Created by 周彦彤 on 16/3/9.
//  Copyright © 2016年 Developer. All rights reserved.
//

#import "ViewController.h"
#import "UIImage+MyImage.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImage *image = [UIImage imageNamed:@"old"];
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    imageView.image = image;
    [self.view addSubview:imageView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
