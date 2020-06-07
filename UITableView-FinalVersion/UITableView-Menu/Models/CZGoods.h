//
//  CZGoods.h
//  UITableView-Menu
//
//  Created by YuJin on 25/5/20.
//  Copyright © 2020 YuJin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CZGoods : NSObject
@property(copy,nonatomic)NSString *buyCount;
@property(copy,nonatomic)NSString *icon;
@property(copy,nonatomic)NSString *price;
@property(copy,nonatomic)NSString *title;

-(instancetype)initWithDict:(NSDictionary *)dict;
+(instancetype)goodsWithDict:(NSDictionary *)dict;


@end
