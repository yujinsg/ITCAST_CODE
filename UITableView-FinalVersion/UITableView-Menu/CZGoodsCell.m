//
//  CZGoodsCell.m
//  UITableView-Menu
//
//  Created by YuJin on 26/5/20.
//  Copyright © 2020 YuJin. All rights reserved.
//

#import "CZGoodsCell.h"
#import "CZGoods.h"


@interface CZGoodsCell()
@property (weak, nonatomic) IBOutlet UIImageView *imgViewIcon;
@property (weak, nonatomic) IBOutlet UILabel *lblTitle;
@property (weak, nonatomic) IBOutlet UILabel *lblPrice;
@property (weak, nonatomic) IBOutlet UILabel *lblBuyCount;
@end

@implementation CZGoodsCell

-(void)setGoods:(CZGoods *)goods{
    _goods=goods;
    self.imageView.image=[UIImage imageNamed:goods.icon];
    self.lblTitle.text=goods.title;
    self.lblPrice.text=[NSString stringWithFormat:@"¥ %@",goods.price];
    self.lblBuyCount.text=[NSString stringWithFormat:@"%@ buy",goods.buyCount];
}

+(instancetype)goodsCellWithTableView:(UITableView *)tableview{
    
    static NSString *ID=@"goods_cell";
    CZGoodsCell *cell=[tableview dequeueReusableCellWithIdentifier:ID];
    if(cell==nil){
        cell=[[[NSBundle mainBundle]loadNibNamed:@"CZGoodsCell" owner:nil options:nil]firstObject];
    }
    return cell;
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
