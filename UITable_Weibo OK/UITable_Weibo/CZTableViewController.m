//
//  CZTableViewController.m
//  004微博案例
//
//  Created by apple on 15/3/2.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import "CZTableViewController.h"
#import "CZWeibo.h"
#import "CZWeiboCell.h"

@interface CZTableViewController ()

@property (nonatomic, strong) NSArray *weibos;

@end

@implementation CZTableViewController

#pragma mark - 懒加载数据
- (NSArray *)weibos
{
    if (_weibos == nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"weibos.plist" ofType:nil];
        NSArray *arrayDict = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *arrayModels = [NSMutableArray array];
        for (NSDictionary *dict in arrayDict) {
            CZWeibo *model = [CZWeibo weiboWithDict:dict];
            [arrayModels addObject:model];
        }
        _weibos = arrayModels;
    }
    return _weibos;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 统一设置行高
    self.tableView.rowHeight = 300;
    
//    NSLog(@"%@", self.view);
//    NSLog(@"%@", self.tableView);
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view 数据源方法

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.weibos.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSLog(@"cellForRowAtIndexPath:");
    
    // 1. 获取模型数据
    CZWeibo *model = self.weibos[indexPath.row];
    
    
    // 2. 创建单元格
    static NSString *ID = @"weibo_cell";
    CZWeiboCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[CZWeiboCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    // 3. 设置单元格数据
    cell.weibo = model;
    
    // 4. 返回单元格
    return cell;
}



#pragma mark - Table view 代理方法

// 返回每行的行高的方法
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CZWeibo *model = self.weibos[indexPath.row];
    return model.rowHeight;
}


- (BOOL)prefersStatusBarHidden
{
    return YES;
}


@end











