//
//  ViewController.m
//  GitDemo
//
//  Created by ZJQ on 2018/9/5.
//  Copyright © 2018年 ZJQ. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UILabel * lbl = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, kWidth, 6)];
    lbl.text = @"我是测试";
    [self.view addSubview:lbl];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
