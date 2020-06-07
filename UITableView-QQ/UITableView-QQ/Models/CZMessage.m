//
//  CZMessage.m
//  UITableView-QQ
//
//  Created by YuJin on 31/5/20.
//  Copyright © 2020 YuJin. All rights reserved.
//

#import "CZMessage.h"

@implementation CZMessage

-(instancetype)initWithDict:(NSDictionary *)dict{
    if(self=[super init]){
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+(instancetype)messagewithDict:(NSDictionary *)dict{
    return [[self alloc]initWithDict:dict];
}

@end
