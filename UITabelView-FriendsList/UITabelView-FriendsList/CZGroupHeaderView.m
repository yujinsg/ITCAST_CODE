//
//  CZGroupHeaderView.m
//  UITabelView-FriendsList
//
//  Created by YuJin on 2/6/20.
//  Copyright © 2020 YuJin. All rights reserved.
//

#import "CZGroupHeaderView.h"
#import "CZGroup.h"

@interface CZGroupHeaderView()
@property(nonatomic,weak)UIButton *btnGroupTitle;
@property(nonatomic,weak)UILabel *lblCount;
@end


@implementation CZGroupHeaderView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
+(instancetype)groupHeaderViewWithTableView:(UITableView *)tableView{
    static NSString *ID=@"group_header_view";
    CZGroupHeaderView *headerVw=[tableView dequeueReusableHeaderFooterViewWithIdentifier:ID];
    if(headerVw==nil){
        headerVw=[[CZGroupHeaderView alloc]initWithReuseIdentifier:ID];
    }
    //headerVw.contentView.backgroundColor=[UIColor redColor];
    return headerVw;
}

-(instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{
    if(self=[super initWithReuseIdentifier:reuseIdentifier]){
        UIButton *btnGroupTitle=[[UIButton alloc]init];
        [btnGroupTitle setImage:[UIImage imageNamed:@"buddy_header_arrow"] forState:UIControlStateNormal];
        [btnGroupTitle setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btnGroupTitle setBackgroundImage:[UIImage imageNamed:@"buddy_header_bg"] forState:UIControlStateNormal];
        [btnGroupTitle setBackgroundImage:[UIImage imageNamed:@"buddy_header_bg_highlighted"] forState:UIControlStateHighlighted];
        btnGroupTitle.contentHorizontalAlignment=UIControlContentHorizontalAlignmentLeft;
        btnGroupTitle.contentEdgeInsets=UIEdgeInsetsMake(0, 10, 0, 0);
        btnGroupTitle.titleEdgeInsets=UIEdgeInsetsMake(0, 5, 0, 0);
        
        [btnGroupTitle addTarget:self action:@selector(btnGroupTitleClicked) forControlEvents:UIControlEventTouchUpInside];
        
        btnGroupTitle.imageView.contentMode=UIViewContentModeCenter;
        btnGroupTitle.imageView.clipsToBounds=NO;
        
        [self.contentView addSubview:btnGroupTitle];
        self.btnGroupTitle=btnGroupTitle;
        
        UILabel *lblCount=[[UILabel alloc]init];
        [self.contentView addSubview:lblCount];
        self.lblCount=lblCount;
    }
    return self;
}
-(void)btnGroupTitleClicked{
    NSLog(@"888888888888");
    self.group.visible=!self.group.isVisible;
    if([self.delegate respondsToSelector:@selector(groupHeaderViewDidClickTitleButton:)]){
        [self.delegate groupHeaderViewDidClickTitleButton:self];
    }    
}

-(void)setGroup:(CZGroup *)group{
    _group=group;
    [self.btnGroupTitle setTitle:group.name forState:UIControlStateNormal];
    self.lblCount.text=[NSString stringWithFormat:@"%d / %lu",group.online,(unsigned long)group.friends.count];
    if(self.group.isVisible){
        self.btnGroupTitle.imageView.transform=CGAffineTransformMakeRotation(M_PI_2);
    }else{
        self.btnGroupTitle.imageView.transform=CGAffineTransformMakeRotation(0);
    }
}

-(void)didMoveToSuperview{
    if(self.group.isVisible){
        self.btnGroupTitle.imageView.transform=CGAffineTransformMakeRotation(M_PI_2);
    }else{
        self.btnGroupTitle.imageView.transform=CGAffineTransformMakeRotation(0);
    }
}

-(void)layoutSubviews{
    [super layoutSubviews];
    [self.btnGroupTitle setTitle:self.group.name forState:UIControlStateNormal];
    self.btnGroupTitle.frame=self.bounds;
    CGFloat lblW=100;
    CGFloat lblH=self.bounds.size.height;
    CGFloat lblX=self.bounds.size.width-10-lblW;
    CGFloat lblY=0;
    self.lblCount.frame=CGRectMake(lblX, lblY, lblW, lblH);
}

@end
