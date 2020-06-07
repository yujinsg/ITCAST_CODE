//
//  CZMessageCell.h
//  UITableView-QQ
//
//  Created by YuJin on 31/5/20.
//  Copyright © 2020 YuJin. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CZMessgaeFrame;
@interface CZMessageCell : UITableViewCell

@property(nonatomic,strong)CZMessgaeFrame *messageFrame;
+(instancetype)messageCellWithTableView:(UITableView *)tabelView;
@end
