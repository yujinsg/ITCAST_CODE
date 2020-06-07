//
//  NSString+CZNSStringExt.h
//  UITableView-QQ
//
//  Created by YuJin on 31/5/20.
//  Copyright © 2020 YuJin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (CZNSStringExt)

-(CGSize)sizeofTextWithMaxSize:(CGSize)maxSize font:(UIFont *)font;
+(CGSize)sizeWithText:(NSString *)text maxSize:(CGSize)maxSize font:(UIFont *)font;

@end
