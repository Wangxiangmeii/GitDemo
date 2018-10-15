//
//  ViewController.m
//  GitDemo
//
//  Created by ZJQ on 2018/9/5.
//  Copyright © 2018年 ZJQ. All rights reserved.
//

#import "ViewController.h"
#import "MJRefresh.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView * table;
@property(nonatomic,strong)NSArray * arr;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    UILabel * lbl = [[UILabel alloc]initWithFrame:CGRectMake(0, 50, kWidth, 30)];
//    lbl.text = @"我是测试";
//    [self.view addSubview:lbl];
//    [self sagBye];
//    [self sagHello];
//    [self saychange];
    
    self.arr = [NSArray arrayWithObjects:@"第一个",@"第二个",@"第三个",@"第四个",@"第五个", nil];
    self.table = [[UITableView alloc]initWithFrame:CGRectMake(0, 50, kWidth, kHeigth-20)];
    self.table.delegate = self;
    self.table.dataSource = self;
    self.table.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    [self.view addSubview:self.table];
    
    [self refreshTable];
    
}

-(void)refreshTable{
    
//    __weak typeof(self) weakSelf = self;
    __weak typeof(self) weakSelf = self;
    //默认下拉刷新
    self.table.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
//        [weakSelf getNetworking:YES];
    }];
    //默认上拉加载
    self.table.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMore)];
    
}



-(void)sagHello{
    NSLog(@"你好，世界");
}

-(void)sagBye{
    NSLog(@"再见，世界");
}

-(void)saychange{
    NSLog(@"测试一下下");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.arr.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 40;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    cell.textLabel.text = self.arr[indexPath.row];
//    MJPicture * picture = _pictures[indexPath.row];
//    cell.textLabel.text = picture.name;
//    cell.detailTextLabel.text = picture.passtime;
//    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:picture.profile_image]];
    return cell;
}




@end
