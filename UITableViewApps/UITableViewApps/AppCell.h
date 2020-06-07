//
//  AppCell.h
//  UITableViewApps
//
//  Created by YuJin on 3/6/20.
//  Copyright © 2020 YuJin. All rights reserved.
//

#import <UIKit/UIKit.h>
@class AppCell;

@protocol AppCellDelegate <NSObject>
@required
-(void)appCellDidClickDownloadButton:(AppCell *)appCell;
@end

@class CZApp;
@interface AppCell : UITableViewCell
@property (nonatomic, strong) CZApp *app;
@property (nonatomic, weak) id <AppCellDelegate> delegate;
@end
