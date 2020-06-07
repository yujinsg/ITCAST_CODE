//
//  CZHeaderView.m
//  UITableView-Menu
//
//  Created by YuJin on 26/5/20.
//  Copyright © 2020 YuJin. All rights reserved.
//

#import "CZHeaderView.h"
@interface CZHeaderView()

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property(strong,nonatomic)NSTimer *timer;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;

@end
@implementation CZHeaderView

/*
// Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.index++;
 index=num%5;
 self.scrollView.contentOffset=CGPointMake(300*index, 0);- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
+(instancetype)headerView{
    CZHeaderView *headerView=[[[NSBundle mainBundle]loadNibNamed:@"CZHeaderView" owner:nil options:nil]firstObject];
    return headerView;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.scrollView.delegate=self;
    self.scrollView.contentSize=CGSizeMake(300*5, 100);
    self.scrollView.pagingEnabled=YES;
    for(int i=0;i<5;i++){
        CGRect frame=CGRectMake(300*i, 0, 300, 100);
        UIImageView *imageView=[[UIImageView alloc]initWithFrame:frame];
        NSString *path=[NSString stringWithFormat:@"n%d",i+1];
        imageView.image=[UIImage imageNamed:path];
        [self.scrollView addSubview:imageView];
    }
    
    self.timer=[NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(scrowImage) userInfo:nil repeats:YES];
    NSRunLoop *runLoop=[NSRunLoop currentRunLoop];
    [runLoop addTimer:self.timer forMode:NSRunLoopCommonModes];
}

-(void)scrowImage {
    NSLog(@"jjjj");
    int index=self.scrollView.contentOffset.x/300;
    index++;                                                        
    int num=index%5;
    self.scrollView.contentOffset=CGPointMake(300*num, 0);
    self.pageControl.currentPage=num;
}


-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    NSLog(@"start drag");
    [self.timer invalidate];
}

-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    CGFloat x=self.scrollView.contentOffset.x;
    CGFloat y=self.scrollView.contentOffset.y;
    NSLog(@"%f %f",x,y);
    self.timer=[NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(scrowImage) userInfo:nil repeats:YES];
    NSRunLoop *runLoop=[NSRunLoop currentRunLoop];
    [runLoop addTimer:self.timer forMode:NSRunLoopCommonModes];
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat x=self.scrollView.contentOffset.x;
    int num=(x+150)/300;
    self.pageControl.currentPage=num;
}

@end
