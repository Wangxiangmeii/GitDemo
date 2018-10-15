//
//  tableViewController.m
//  GitDemo
//
//  Created by ZJQ on 2018/9/11.
//  Copyright © 2018年 ZJQ. All rights reserved.
//

#import "tableViewController.h"
#import "MJRefresh.h"


@interface tableViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView * tableView;
@property(nonatomic,strong)NSArray * arr;

@end

@implementation tableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.arr = [NSArray arrayWithObjects:@"第一个",@"第二个",@"第三个",@"第四个",@"第五个", nil];
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 50, kWidth, kHeigth-43)];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    [self.view addSubview:self.tableView];
    
    [self refreshTable];
    
}

-(void)refreshTable{
    __weak typeof(self) weakSelf = self;
    
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
//        [weakSelf getNetworkData:YES];
    }];
    
    //默认block方法：设置上拉加载更多
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        //Call this Block When enter the refresh status automatically
//        [weakSelf getNetworkData:NO];
    }];
    
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
