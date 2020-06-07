//
//  CZWeibo.m
//  004微博案例
//
//  Created by apple on 15/3/2.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import "CZWeibo.h"

@implementation CZWeibo

- (instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
+ (instancetype)weiboWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}

@end
