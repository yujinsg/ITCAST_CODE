//
//  CZGroupHeaderView.h
//  UITabelView-FriendsList
//
//  Created by YuJin on 2/6/20.
//  Copyright © 2020 YuJin. All rights reserved.
//

#import <UIKit/UIKit.h>


@class CZGroupHeaderView;
@protocol CZGroupHeaderViewDelegate <NSObject>
@required

- (void)groupHeaderViewDidClickTitleButton:(CZGroupHeaderView *)groupHeaderView;

@end

@class CZGroup;
@interface CZGroupHeaderView : UITableViewHeaderFooterView

@property (nonatomic,strong)CZGroup *group;
+(instancetype)groupHeaderViewWithTableView:(UITableView *)tableView;
@property(nonatomic,weak) id<CZGroupHeaderViewDelegate> delegate;

@end
