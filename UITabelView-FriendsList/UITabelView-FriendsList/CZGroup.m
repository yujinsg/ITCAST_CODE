//
//  CZGroup.m
//  UITabelView-FriendsList
//
//  Created by YuJin on 2/6/20.
//  Copyright © 2020 YuJin. All rights reserved.
//

#import "CZGroup.h"
#import "CZQQFriend.h"

@implementation CZGroup
-(instancetype)initWithDict:(NSDictionary *)dict{
    if(self=[super init]){
        [self setValuesForKeysWithDictionary:dict];
        NSMutableArray *arrayModels=[NSMutableArray array];
        for(NSDictionary *dict_sub in self.friends){
            CZQQFriend *model=[CZQQFriend friendWithDict:dict_sub];
            [arrayModels addObject:model];
        }
        self.friends=arrayModels;
    }
    return self;
}

+(instancetype)groupWithDict:(NSDictionary *)dict{
    return [[self alloc]initWithDict:dict];
}
@end
