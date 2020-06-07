//
//  CZMessgaeFrame.m
//  UITableView-QQ
//
//  Created by YuJin on 31/5/20.
//  Copyright © 2020 YuJin. All rights reserved.
//

#import "CZMessgaeFrame.h"
#import <UIKit/UIKit.h>
#import "NSString+CZNSStringExt.h"


@implementation CZMessgaeFrame

-(void)setMessage:(CZMessage *)message{
    NSLog(@"set message");
    _message=message;
    // 计算每个控件的frame 和 行高
    CGFloat screenW=[UIScreen mainScreen].bounds.size.width;
    // 设置一个统一的间距
    CGFloat margin=5;
    
    // 计算时间label的frame
    CGFloat timeX=0;
    CGFloat timeY=0;
    CGFloat timeW=screenW;
    CGFloat timeH=15;
    if(!message.hideTime){
        _timeFrame=CGRectMake(timeX, timeY, timeW, timeH);
    }
    
    // 计算头像的frame
    CGFloat iconW=30;
    CGFloat iconH=30;
    CGFloat iconY=CGRectGetMaxY(_timeFrame)+margin;
    CGFloat iconX=message.type==CZMessageTypeMe? screenW-iconW-margin:margin;
    _iconFrame=CGRectMake(iconX, iconY, iconW, iconH);
    
    // 计算消息正文的frame
    // 1. 先计算正文的大小
    //NSDictionary *attrs = @{NSFontAttributeName :textFont};
    //CGSize textSize= [message.text boundingRectWithSize:CGSizeMake(200, MAX_FLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
    CGSize textSize=[message.text sizeofTextWithMaxSize:CGSizeMake(200, MAXFLOAT) font:textFont];
    CGFloat textW=textSize.width+40;
    CGFloat textH=textSize.height+30;
    // 2. 再计算x,y
    CGFloat textX=message.type==CZMessageTypeOther?CGRectGetMaxX(_iconFrame) :(screenW-margin-iconW-textW);
    CGFloat textY=iconY;
    _textFrame=CGRectMake(textX, textY, textW, textH);
    
    // 计算行高
    // 获取 头像的最大的Y值和正文的最大的Y值, 然后用最大的Y值+ margin
    CGFloat maxY=MAX(CGRectGetMaxY(_textFrame), CGRectGetMaxY(_iconFrame));
    _rowHeight=maxY+margin;
}

@end
