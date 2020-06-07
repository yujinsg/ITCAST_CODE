//
//  CZQQFriend.h
//  UITabelView-FriendsList
//
//  Created by YuJin on 2/6/20.
//  Copyright © 2020 YuJin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CZQQFriend : NSObject
@property(nonatomic,copy)NSString *icon;
@property(nonatomic,copy)NSString *name;
@property(nonatomic,copy)NSString *intro;
@property(nonatomic,assign,getter=isVip) BOOL vip;

-(instancetype)initWithDict:(NSDictionary *)dict;
+(instancetype)friendWithDict:(NSDictionary *)dict;

@end
