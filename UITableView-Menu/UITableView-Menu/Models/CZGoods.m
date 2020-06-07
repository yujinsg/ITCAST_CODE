//
//  CZGoods.m
//  UITableView-Menu
//
//  Created by YuJin on 25/5/20.
//  Copyright © 2020 YuJin. All rights reserved.
//

#import "CZGoods.h"

@implementation CZGoods

-(instancetype)initWithDict:(NSDictionary *)dict{
    if(self=[super init]){
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+(instancetype)goodsWithDict:(NSDictionary *)dict{
    return [[self alloc]initWithDict:dict];
}

@end
