
//  CZWeiboCell.m
//  004微博案例
//
//  Created by apple on 15/3/2.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import "CZWeiboCell.h"
#import "CZWeibo.h"
#define nameFont [UIFont systemFontOfSize:12]
#define textFont [UIFont systemFontOfSize:14]


@interface CZWeiboCell ()
@property (nonatomic, weak) UIImageView *imgViewIcon;
@property (nonatomic, weak) UILabel *lblNickName;
@property (nonatomic, weak) UIImageView *imgViewVip;
@property (nonatomic, weak) UILabel *lblText;
@property (nonatomic, weak) UIImageView *imgViewPicture;


@end


@implementation CZWeiboCell


#pragma mark - 重写单元格的initWithStyle:方法
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        // 创建5个子控件
        
        // 1. 头像
        UIImageView *imgViewIcon = [[UIImageView alloc] init];
        [self.contentView addSubview:imgViewIcon];
        self.imgViewIcon = imgViewIcon;
        
        // 2. 昵称
        UILabel *lblNickName = [[UILabel alloc] init];
        // 设置Label的文字大小
        lblNickName.font = nameFont;
        
        [self.contentView addSubview:lblNickName];
        self.lblNickName = lblNickName;
        
        // 3. 会员
        UIImageView *imgViewVip = [[UIImageView alloc] init];
        imgViewVip.image = [UIImage imageNamed:@"vip"];
        [self.contentView addSubview:imgViewVip];
        self.imgViewVip = imgViewVip;
        
        // 4. 正文
        UILabel *lblText = [[UILabel alloc] init];
        lblText.font = textFont;
        // 设置正文的Label可以自动换行
        lblText.numberOfLines = 0;
        [self.contentView addSubview:lblText];
        self.lblText = lblText;
        
        // 5. 配图
        UIImageView *imgViewPicture = [[UIImageView alloc] init];
        [self.contentView addSubview:imgViewPicture];
        self.imgViewPicture = imgViewPicture;
    }
    return self;
}


#pragma mark - 重写weibo属性的set方法
- (void)setWeibo:(CZWeibo *)weibo
{
    _weibo = weibo;
    
    // 1. 设置当前单元格中的子控件的数据
    [self settingData];
    
    // 2. 设置当前单元格中的子控件的frame
    [self settingFrame];
}


// 设置数据的方法
- (void)settingData
{
    CZWeibo *model = self.weibo;
    // 1. 头像
    self.imgViewIcon.image = [UIImage imageNamed:model.icon];
    
    // 2. 昵称
    self.lblNickName.text = model.name;
    
    // 3. 会员
    if (model.isVip) {
        self.imgViewVip.hidden = NO;
    } else {
        self.imgViewVip.hidden = YES;
    }
    
    // 4. 正文
    self.lblText.text = model.text;
 
    
    // 5. 配图
    if (model.picture) {
        // 有配图
        // 如果model.picture的值是nil, 那么下面这句话执行会报异常
        self.imgViewPicture.image = [UIImage imageNamed:model.picture];
        // 显示图片框
        self.imgViewPicture.hidden = NO;
    } else {
        // 如果没有配图, 隐藏图片框
        self.imgViewPicture.hidden = YES;
    }

}

// 设置frame的方法
- (void)settingFrame
{
    // 提取统一的间距
    CGFloat margin = 10;
    
    // 1. 头像
    CGFloat iconW = 35;
    CGFloat iconH = 35;
    CGFloat iconX = margin;
    CGFloat iconY = margin;
    self.imgViewIcon.frame = CGRectMake(iconX, iconY, iconW, iconH);
    
    // 2. 昵称
    // 获取昵称字符串
    NSString *nickName = self.lblNickName.text;
    CGFloat nameX = CGRectGetMaxX(self.imgViewIcon.frame) + margin;
    
    // 根据Label中文字的内容, 来动态计算Label的高和宽
    CGSize nameSize = [self sizeWithText:nickName andMaxSize:CGSizeMake(MAXFLOAT, MAXFLOAT) andFont:nameFont];
    
    CGFloat nameW = nameSize.width;
    CGFloat nameH = nameSize.height;
    CGFloat nameY = iconY + (iconH - nameH) / 2;

    self.lblNickName.frame = CGRectMake(nameX, nameY, nameW, nameH);
    
    // 3. 会员
    CGFloat vipW = 10;
    CGFloat vipH = 10;
    CGFloat vipX = CGRectGetMaxX(self.lblNickName.frame) + margin;
    CGFloat vipY = nameY;
    self.imgViewVip.frame = CGRectMake(vipX, vipY, vipW, vipH);
    

    
    // 4. 正文
    CGFloat textX = iconX;
    CGFloat textY = CGRectGetMaxY(self.imgViewIcon.frame) + margin;
    CGSize textSize = [self sizeWithText:self.lblText.text andMaxSize:CGSizeMake(355, MAXFLOAT) andFont:textFont];
    CGFloat textW = textSize.width;
    CGFloat textH = textSize.height;
    self.lblText.frame = CGRectMake(textX, textY, textW, textH);
    
    
    // 5. 配图
    CGFloat picW = 100;
    CGFloat picH = 100;
    CGFloat picX = iconX;
    CGFloat picY = CGRectGetMaxY(self.lblText.frame) + margin;
    self.imgViewPicture.frame = CGRectMake(picX, picY, picW, picH);
    
    
    //6. 计算每行的高度
    CGFloat rowHeight = 0;
    if (self.weibo.picture) {
        // 如果有配图, 那么行高就等于配图的最大的Y值  + margin
        rowHeight = CGRectGetMaxY(self.imgViewPicture.frame) + margin;
    } else {
        // 如果没有配图, 那么行高就等于正文的最大的Y值  + margin
        rowHeight = CGRectGetMaxY(self.lblText.frame) + margin;
    }
    self.weibo.rowHeight=rowHeight;
    
}

// 根据给定的字符串、最大值的size、给定的字体, 来计算文字应该占用的大小
- (CGSize)sizeWithText:(NSString *)text andMaxSize:(CGSize)maxSize andFont:(UIFont *)font
{
    NSDictionary *attr = @{NSFontAttributeName : font};
    return [text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attr context:nil].size;
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}



@end
