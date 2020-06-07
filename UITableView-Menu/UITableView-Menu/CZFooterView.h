//
//  CZFooterView.h
//  UITableView-Menu
//
//  Created by YuJin on 26/5/20.
//  Copyright © 2020 YuJin. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CZFooterView;
@protocol CZFooterViewDelegate<NSObject,UIScrollViewDelegate>
@required
-(void)footerViewUpdateData:(CZFooterView *)footerView;
@end
@interface CZFooterView : UIView
+(instancetype)footerView;
@property(nonatomic,weak)id<CZFooterViewDelegate> delegate;
@end
