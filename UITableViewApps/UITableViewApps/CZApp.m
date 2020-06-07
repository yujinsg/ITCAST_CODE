//
//  CZApp.m
//  UITableViewApps
//
//  Created by YuJin on 3/6/20.
//  Copyright © 2020 YuJin. All rights reserved.
//

#import "CZApp.h"

@implementation CZApp
-(instancetype)initWithDict:(NSDictionary *)dict
{
    if(self=[super init]){
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+(instancetype)appWithDict:(NSDictionary *)dict{
    return [[self alloc]initWithDict:dict];
}
@end
