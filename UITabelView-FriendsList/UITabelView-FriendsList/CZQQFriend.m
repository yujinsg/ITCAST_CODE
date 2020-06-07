//
//  CZQQFriend.m
//  UITabelView-FriendsList
//
//  Created by YuJin on 2/6/20.
//  Copyright © 2020 YuJin. All rights reserved.
//

#import "CZQQFriend.h"

@implementation CZQQFriend

-(instancetype)initWithDict:(NSDictionary *)dict{
    if(self=[super init]){
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}


+(instancetype)friendWithDict:(NSDictionary *)dict{
    return [[self alloc]initWithDict:dict];
}
@end
