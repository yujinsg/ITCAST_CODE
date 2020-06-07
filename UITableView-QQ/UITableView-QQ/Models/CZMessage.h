//
//  CZMessage.h
//  UITableView-QQ
//
//  Created by YuJin on 31/5/20.
//  Copyright © 2020 YuJin. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum{
    CZMessageTypeMe=0,
    CZMessageTypeOther=1
}CZMessageType;
@interface CZMessage : NSObject

@property(nonatomic,copy)NSString *text;
@property(nonatomic,copy)NSString *time;
@property(nonatomic,assign) CZMessageType type;
@property(nonatomic,assign)BOOL hideTime;

-(instancetype)initWithDict:(NSDictionary *)dict;
+(instancetype)messagewithDict:(NSDictionary *)dict;

@end
