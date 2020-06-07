//
//  CZGroup.h
//  UITabelView-FriendsList
//
//  Created by YuJin on 2/6/20.
//  Copyright © 2020 YuJin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CZGroup : NSObject
@property(nonatomic,copy)NSString *name;
@property(nonatomic,assign)int online;
@property(nonatomic,copy)NSArray *friends;
@property(nonatomic, assign, getter=isVisible) BOOL visible;

-(instancetype)initWithDict:(NSDictionary *)dict;
+(instancetype)groupWithDict:(NSDictionary *)dict;
@end
