//
//  ViewController.m
//  UITableView-Menu
//
//  Created by YuJin on 25/5/20.
//  Copyright © 2020 YuJin. All rights reserved.
//

#import "ViewController.h"
#import "CZGoods.h"

@interface ViewController () <UITableViewDataSource>
@property(strong,nonatomic)NSArray *goods;
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
}

-(NSArray *)goods{
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
    static NSString *ID=@"goods_cell";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:ID];
    if(cell==nil){
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    cell.imageView.image=[UIImage imageNamed:model.icon];
    cell.textLabel.text=model.title;
    cell.detailTextLabel.text=[NSString stringWithFormat:@"¥%@  Total %@ buy",model.price,model.buyCount];
    return cell;
}

@end
