//
//  CZMessageCell.m
//  UITableView-QQ
//
//  Created by YuJin on 31/5/20.
//  Copyright © 2020 YuJin. All rights reserved.
//

#import "CZMessageCell.h"
#import "CZMessage.h"
#import "CZMessgaeFrame.h"

@interface CZMessageCell()
@property (nonatomic, weak) UILabel *lblTime;
@property (nonatomic, weak) UIImageView *imgViewIcon;
@property (nonatomic, weak) UIButton *btnText;
@end

@implementation CZMessageCell


+(instancetype)messageCellWithTableView:(UITableView *)tableView{
    
    static NSString *ID=@"message_cell";
    CZMessageCell *cell=[tableView dequeueReusableCellWithIdentifier:ID];
    
    if(cell==nil){
        cell=[[CZMessageCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    return cell;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    NSLog(@"initWithStyle");
    
    if(self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        // time label
        UILabel *lblTime=[[UILabel alloc]init];
        lblTime.font=[UIFont systemFontOfSize:12];
        lblTime.textAlignment=NSTextAlignmentCenter;
        [self.contentView addSubview:lblTime];
        self.lblTime=lblTime;
        
        //ICON UIImageView
        UIImageView *imgViewIcon=[[UIImageView alloc]init];
        [self.contentView addSubview:imgViewIcon];
        self.imgViewIcon=imgViewIcon;
        
        //TEXT button
        UIButton *btnText=[[UIButton alloc]init];
        btnText.titleLabel.font=textFont;
        [btnText setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        btnText.titleLabel.numberOfLines=0;
        btnText.contentEdgeInsets=UIEdgeInsetsMake(15, 20, 15, 20);
        
        [self.contentView addSubview:btnText];
        self.btnText=btnText;
    }
    self.backgroundColor=[UIColor clearColor];
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setMessageFrame:(CZMessgaeFrame *)messageFrame{
    NSLog(@"set MessgaeFrame");
    _messageFrame=messageFrame;
    // 获取数据模型
    CZMessage *message = messageFrame.message;
    
    // 分别设置每个子控件的数据 和 frame
    
    // 设置 "时间Label"的数据 和 frame
    self.lblTime.text=message.time;
    self.lblTime.frame=messageFrame.timeFrame;
    //self.lblTime.hidden=messsage.hideTime;
    
    // 设置 头像
    // 根据消息类型, 判断应该使用哪张图片
    NSString *iconImg = message.type==CZMessageTypeMe ? @"me" : @"other";
    self.imgViewIcon.image=[UIImage imageNamed:iconImg];
    self.imgViewIcon.frame=messageFrame.iconFrame;
    
    // 设置消息正文
    [self.btnText setTitle:message.text forState:UIControlStateNormal];
    self.btnText.frame=messageFrame.textFrame;
    
    // 设置正文的背景图
    NSString *imgNor,*imgHighlighted;
    if(message.type==CZMessageTypeMe){
        imgNor=@"chat_send_nor";
        imgHighlighted=@"chat_send_press_pic";
        [self.btnText setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    }else{
        imgNor=@"chat_recive_nor";
        imgHighlighted=@"chat_recive_press_pic";
        [self.btnText setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    
    // 加载图片
    UIImage *imageNormal=[UIImage imageNamed:imgNor];
    UIImage *imageHighlighted=[UIImage imageNamed:imgHighlighted];
    
    // 用平铺的方式拉伸图片
    imageNormal=[imageNormal stretchableImageWithLeftCapWidth:imageNormal.size.width*0.5 topCapHeight:imageNormal.size.height*0.5];
    imageHighlighted = [imageHighlighted stretchableImageWithLeftCapWidth:imageHighlighted.size.width*0.5 topCapHeight:imageHighlighted.size.height*0.5];
    // 设置背景图
    [self.btnText setBackgroundImage:imageNormal forState:UIControlStateNormal];
    [self.btnText setBackgroundImage:imageHighlighted forState:UIControlStateHighlighted];
      
}

@end
