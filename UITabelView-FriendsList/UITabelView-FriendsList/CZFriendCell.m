//
//  CZFriendCell.m
//  UITabelView-FriendsList
//
//  Created by YuJin on 2/6/20.
//  Copyright © 2020 YuJin. All rights reserved.
//

#import "CZFriendCell.h"
#import "CZQQFriend.h"

@implementation CZFriendCell

-(void)setFriendModel:(CZQQFriend *)friendModel
{
    _friendModel=friendModel;
    self.imageView.image=[UIImage imageNamed:friendModel.icon];
    self.textLabel.text=friendModel.name;
    self.detailTextLabel.text=friendModel.intro;
    
    self.textLabel.textColor=friendModel.isVip?[UIColor redColor]:[UIColor blackColor];
}

+(instancetype)friendCellWithTableView:(UITableView *)tableView{
    static NSString *ID=@"friend_cell";
    CZFriendCell *cell=[tableView dequeueReusableCellWithIdentifier:ID];
    if(cell==nil){
        cell=[[CZFriendCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    return cell;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
