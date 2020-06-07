//
//  CZGoodsCellTableViewCell.h
//  UITableView-Menu
//
//  Created by YuJin on 26/5/20.
//  Copyright © 2020 YuJin. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CZGoods;
@interface CZGoodsCell : UITableViewCell

@property(nonatomic,strong)CZGoods *goods;

+(instancetype)goodsCellWithTableView:(UITableView *)tableview;

@end
