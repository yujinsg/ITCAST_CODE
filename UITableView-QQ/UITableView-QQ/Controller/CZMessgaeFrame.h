//
//  CZMessgaeFrame.h
//  UITableView-QQ
//
//  Created by YuJin on 31/5/20.
//  Copyright © 2020 YuJin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
#import "CZMessage.h"

#define textFont [UIFont systemFontOfSize:13]

@interface CZMessgaeFrame : NSObject


@property(nonatomic,strong)CZMessage *message;
@property(nonatomic,assign,readonly)CGRect timeFrame;
@property(nonatomic,assign,readonly)CGRect iconFrame;
@property(nonatomic,assign,readonly)CGRect textFrame;
@property(nonatomic,assign,readonly)CGFloat rowHeight;

@end
