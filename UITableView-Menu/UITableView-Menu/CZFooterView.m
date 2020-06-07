//
//  CZFooterView.m
//  UITableView-Menu
//
//  Created by YuJin on 26/5/20.
//  Copyright © 2020 YuJin. All rights reserved.
//

#import "CZFooterView.h"


@interface CZFooterView()
@property (weak, nonatomic) IBOutlet UIButton *btnLoadMore;
@property (weak, nonatomic) IBOutlet CZFooterView *waitingView;
- (IBAction)btnLoadMoreClick:(UIButton *)sender;
@end

@implementation CZFooterView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

+(instancetype)footerView{
    CZFooterView *footerView=[[[NSBundle mainBundle]loadNibNamed:@"CZFooterView" owner:nil options:nil]firstObject];
    return footerView;
}

- (IBAction)btnLoadMoreClick:(UIButton *)sender {
    self.btnLoadMore.hidden=YES;
    self.waitingView.hidden=NO;
    //using delegate do belowitem 1-3
    //1. create model
    //2.add model to goods
    //3.refresh UITableView
//    if([self.delegate respondsToSelector:@selector(footerViewUpdateData:)])
//    {
//        [self.delegate footerViewUpdateData:self];
//    }
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if([self.delegate respondsToSelector:@selector(footerViewUpdateData:)])
        {
            [self.delegate footerViewUpdateData:self];
        }
        self.btnLoadMore.hidden=NO;
        self.waitingView.hidden=YES;
    });
}
@end
