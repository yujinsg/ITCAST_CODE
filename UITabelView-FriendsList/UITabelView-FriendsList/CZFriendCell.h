//
//  CZFriendCell.h
//  UITabelView-FriendsList
//
//  Created by YuJin on 2/6/20.
//  Copyright © 2020 YuJin. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CZQQFriend;
@interface CZFriendCell : UITableViewCell

+(instancetype)friendCellWithTableView:(UITableView *)tableView;

@property(nonatomic,strong)CZQQFriend *friendModel;

@end
