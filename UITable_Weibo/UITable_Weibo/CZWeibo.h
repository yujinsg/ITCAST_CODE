//
//  CZWeibo.h
//  004微博案例
//
//  Created by apple on 15/3/2.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>

@interface CZWeibo : NSObject

@property (nonatomic, copy) NSString *text;
@property (nonatomic, copy) NSString *icon;
@property (nonatomic, copy) NSString *picture;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign, getter=isVip) BOOL vip;

@property(nonatomic,assign)CGFloat rowHeight;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)weiboWithDict:(NSDictionary *)dict;

@end
