//
//  ViewController.m
//  UITableView-Menu
//
//  Created by YuJin on 25/5/20.
//  Copyright © 2020 YuJin. All rights reserved.
//

#import "ViewController.h"
#import "CZGoods.h"
#import "CZGoodsCell.h"
#import "CZFooterView.h"
#import "CZHeaderView.h"

@interface ViewController () <UITableViewDataSource,CZFooterViewDelegate>

@property(strong,nonatomic)NSMutableArray *goods;
@property (weak, nonatomic) IBOutlet UITableView *goodsTableView;


@end

@implementation ViewController

-(BOOL)prefersStatusBarHidden{
    return YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.goodsTableView.dataSource=self;
    self.goodsTableView.rowHeight=60;
//    UIButton *button=[UIButton buttonWithType:UIButtonTypeContactAdd];
//    button.backgroundColor=[UIColor redColor];
//    button.frame=CGRectMake(20, 50 ,30, 100);
//    self.goodsTableView.tableFooterView=button;
    //UIView *footerView=[[[NSBundle mainBundle]loadNibNamed:@"CZFooterView" owner:nil options:nil]firstObject];
    //CZFooterView *footerView=[[[NSBundle mainBundle]loadNibNamed:@"CZFooterView" owner:nil options:nil]firstObject];
    CZFooterView *footerView=[CZFooterView footerView];
    footerView.frame=CGRectMake(20,0,0 ,70);
    footerView.delegate=self;
    self.goodsTableView.tableFooterView=footerView;
    //CZHeaderView *headerView=[[[NSBundle mainBundle]loadNibNamed:@"CZHeaderView" owner:nil options:nil]firstObject];
    CZHeaderView *headerView=[CZHeaderView headerView];
    self.goodsTableView.tableHeaderView=headerView;
    
    
}

-(void)footerViewUpdateData:(CZFooterView *)footerView{
    CZGoods *model=[[CZGoods alloc]init];
    model.title=@"GHHhHHH";
    model.price=@"99.80";
    model.buyCount=@"56";
    model.icon=@"008";
    [self.goods addObject:model];
    [self.goodsTableView reloadData];
    //error can't refrsh cell
    //[self.goodsTableView reloadRowsAtIndexPaths:@[idxPath] withRowAnimation:UITableViewRowAnimationLeft];
    NSIndexPath *idxPath=[NSIndexPath indexPathForRow:self.goods.count-1 inSection:0];
    [self.goodsTableView scrollToRowAtIndexPath:idxPath atScrollPosition:UITableViewScrollPositionTop animated:YES];
}

-(NSMutableArray *)goods{
    if(_goods==nil)
    {
        NSString *path=[[NSBundle mainBundle]pathForResource:@"tgs.plist" ofType:nil];
        NSArray *arrayDict=[NSArray arrayWithContentsOfFile:path];
        NSMutableArray *arrayModel=[NSMutableArray array];
        for(NSDictionary *dict in arrayDict){
            CZGoods *goods=[CZGoods goodsWithDict:dict];
            [arrayModel addObject:goods];
        }
        _goods=arrayModel;
    }
    return _goods;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.goods count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CZGoods *model=self.goods[indexPath.row];
    CZGoodsCell *cell=[CZGoodsCell goodsCellWithTableView:tableView];
//    static NSString *ID=@"goods_cell";
//
//    //CZGoodsCell *cell=[CZGoodsCell goodsCellWithTableView:tableView];
//    CZGoodsCell *cell=[tableView dequeueReusableCellWithIdentifier:ID];
//    if(cell==nil){
//        cell=[[[NSBundle mainBundle]loadNibNamed:@"CZGoodsCell" owner:nil options:nil]firstObject];
//    }
//    cell.imageView.image=[UIImage imageNamed:model.icon];
//    cell.textLabel.text=model.title;
//    cell.detailTextLabel.text=[NSString stringWithFormat:@"¥%@  Total %@ buy",model.price,model.buyCount];
    
    cell.goods=model;
    return cell;
}

@end
