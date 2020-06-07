//
//  CZApp.h
//  UITableViewApps
//
//  Created by YuJin on 3/6/20.
//  Copyright © 2020 YuJin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CZApp : NSObject
@property(nonatomic,copy)NSString *size;
@property(nonatomic,copy)NSString *download;
@property(nonatomic,copy)NSString *name;
@property(nonatomic,copy)NSString *icon;
@property(nonatomic,assign)BOOL isDownloaded;

-(instancetype)initWithDict:(NSDictionary *)dict;
+(instancetype)appWithDict:(NSDictionary *)dict;

@end
