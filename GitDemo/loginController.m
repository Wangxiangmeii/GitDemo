//
//  loginController.m
//  GitDemo
//
//  Created by ZJQ on 2018/9/11.
//  Copyright © 2018年 ZJQ. All rights reserved.
//

#import "loginController.h"
#import "tableViewController.h"

@interface loginController ()

@end

@implementation loginController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"登录";
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton * button = [[UIButton alloc]initWithFrame:CGRectMake((kWidth-40)/2, (kHeigth-20)/2, 40, 20)];
    [button setTitle:@"点我" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:18];
    [button addTarget:self action:@selector(goTableview) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

-(void)goTableview{
    tableViewController * ta = [[tableViewController alloc]init];
    [self.navigationController pushViewController:ta animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
