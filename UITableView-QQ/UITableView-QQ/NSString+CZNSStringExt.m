//
//  NSString+CZNSStringExt.m
//  UITableView-QQ
//
//  Created by YuJin on 31/5/20.
//  Copyright © 2020 YuJin. All rights reserved.
//

#import "NSString+CZNSStringExt.h"

@implementation NSString (CZNSStringExt)
-(CGSize)sizeofTextWithMaxSize:(CGSize)maxSize font:(UIFont *)font{
    NSDictionary *attrs=@{NSFontAttributeName:font};
    return [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
    
}
+(CGSize)sizeWithText:(NSString *)text maxSize:(CGSize)maxSize font:(UIFont *)font{
    return [text sizeofTextWithMaxSize:maxSize font:font];
}


@end
