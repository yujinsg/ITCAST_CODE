//
//  ViewController.m
//  UITableView-QQ
//
//  Created by YuJin on 31/5/20.
//  Copyright © 2020 YuJin. All rights reserved.
//

#import "ViewController.h"
#import "CZMessage.h"
#import "CZMessageCell.h"
#import "CZMessgaeFrame.h"

@interface ViewController () <UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UITextField *txtInput;

@property(nonatomic,strong)NSMutableArray *messaegFrames;

@end

@implementation ViewController

-(BOOL)prefersStatusBarHidden{
    return YES;
}

-(NSMutableArray *)messaegFrames{
    NSLog(@"rewrite messageFrame");
    if(_messaegFrames==nil){
        NSString *path=[[NSBundle mainBundle]pathForResource:@"messages.plist" ofType:nil];
        NSArray *arrayDict=[NSArray arrayWithContentsOfFile:path];
        NSMutableArray *arrayModels=[NSMutableArray array];
        for(NSDictionary *dict in arrayDict){
            CZMessage *model=[CZMessage messagewithDict:dict];
            CZMessage *lastMessage=(CZMessage *)[[arrayModels lastObject]message];
            
            if([model.time isEqualToString:lastMessage.time]){
                model.hideTime=YES;
            }
            
            CZMessgaeFrame *modelFrame=[[CZMessgaeFrame alloc]init];
            modelFrame.message=model;
            [arrayModels addObject:modelFrame];
        }
        _messaegFrames=arrayModels;
    }
    return _messaegFrames;
}

#pragma mark - /********** 文本框的代理方法 *********/
//- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
//{
//    return YES;
//}
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    NSString *text=self.txtInput.text;
    [self sendMessage:text withType:CZMessageTypeMe];
    [self sendMessage:@"******!" withType:CZMessageTypeOther];
    textField.text=nil;
    return YES;
}

// 发送消息
- (void)sendMessage:(NSString *)msg withType:(CZMessageType)type{
    CZMessage *model=[[CZMessage alloc]init];
    NSDate *nowDate=[NSDate date];
    NSDateFormatter *formatter=[[NSDateFormatter alloc]init];
    //formatter.dateFormat=@"HH:mm";
    formatter.dateFormat = @"今天 HH:mm";
    model.time=[formatter stringFromDate:nowDate];
    model.type=type;
    model.text=msg;
    
    
    CZMessgaeFrame *lastMessageFrame=[self.messaegFrames lastObject];
    NSString *lastTime=lastMessageFrame.message.time;
    if([model.time isEqualToString:lastTime]){
        model.hideTime=YES;
    }
    CZMessgaeFrame *modelFrame=[[CZMessgaeFrame alloc]init];
    modelFrame.message=model;
    [self.messaegFrames addObject:modelFrame];
    
    [self.tableView reloadData];
    NSIndexPath *idxPath=[NSIndexPath indexPathForRow:self.messaegFrames.count-1 inSection:0];
    [self.tableView scrollToRowAtIndexPath:idxPath atScrollPosition:UITableViewScrollPositionTop animated:YES];
}


#pragma mark - /********** UITableView的代理方法 *********/
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    //[self.txtInput endEditing:YES];
    [self.view endEditing:YES];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"55555555555");
}
- (void)viewDidLoad{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor=[UIColor colorWithRed:236/255.0 green:236/255.0 blue:236/255.0 alpha:1];
    
    self.tableView.allowsSelection=NO;
    
    UIView *leftVw=[[UIView alloc]init];
    leftVw.frame=CGRectMake(0, 0, 5, 1);
    self.txtInput.leftView=leftVw;
    self.txtInput.leftViewMode=UITextFieldViewModeAlways;
    
    // 监听键盘的弹出事件
    // 1. 创建一个NSNotificationCenter对象。
    NSNotificationCenter *center=[NSNotificationCenter defaultCenter];
    
    // 2. 监听键盘的弹出通知
    [center addObserver:self selector:@selector(keyboardWillChangeFrame:) name:UIKeyboardWillChangeFrameNotification object:nil];
    
//    self.txtInput.keyboardAppearance = UIKeyboardAppearanceDark;
//    self.txtInput.keyboardType = UIKeyboardTypeAlphabet;


}

-(void)keyboardWillChangeFrame:(NSNotification *)noteInfo{
    
//        NSLog(@"通知名称: %@", noteInfo.name);
//
//        NSLog(@"通知的发布者: %@", noteInfo.object);
//
//        NSLog(@"通知的具体内容: %@", noteInfo.userInfo);
    CGRect rectEnd=[noteInfo.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    CGFloat keyboardY=rectEnd.origin.y;
    
    // 用键盘的Y值减去屏幕的高度计算出平移的值
    // 1. 如果是键盘弹出事件, 那么计算出的值就是负的键盘的高度
    // 2. 如果是键盘的隐藏事件, 那么计算出的值就是零， 因为键盘在隐藏以后, 键盘的Y值就等于屏幕的高度。
    CGFloat transformValue=keyboardY-self.view.frame.size.height;
    
    [UIView animateWithDuration:0.25 animations:^{
        self.view.transform=CGAffineTransformMakeTranslation(0, transformValue);
    }];
    
    // 让UITableView的最后一行滚动到最上面
    NSIndexPath *lastRowIdxPath=[NSIndexPath indexPathForRow:self.messaegFrames.count-1 inSection:0];
    [self.tableView scrollToRowAtIndexPath:lastRowIdxPath atScrollPosition:UITableViewScrollPositionTop animated:YES];
}

// ***************** 注意: 监听通知以后一定要在监听通知的对象的dealloc方法中移除监听 *************/.

- (void)dealloc
{
    // 移除通知
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.messaegFrames.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CZMessgaeFrame *modelFrame=self.messaegFrames[indexPath.row];
    CZMessageCell *cell=[CZMessageCell messageCellWithTableView:tableView];
    cell.messageFrame=modelFrame;
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [self.messaegFrames[indexPath.row] rowHeight];
}
@end
