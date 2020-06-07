//
//  CZQQFriendsTableViewController.m
//  UITabelView-FriendsList
//
//  Created by YuJin on 2/6/20.
//  Copyright © 2020 YuJin. All rights reserved.
//

#import "CZQQFriendsTableViewController.h"
#import "CZGroup.h"
#import "CZQQFriend.h"
#import "CZFriendCell.h"
#import "CZGroupHeaderView.h"

@interface CZQQFriendsTableViewController ()<CZGroupHeaderViewDelegate>
@property(nonatomic,strong)NSArray *groups;
@property(nonatomic,strong)CZGroupHeaderView *HeaderView;

@end

@implementation CZQQFriendsTableViewController

-(NSArray *)groups{
    if(_groups==nil){
    NSString *path=[[NSBundle mainBundle]pathForResource:@"friends.plist" ofType:nil];
        NSArray *arrayDict=[NSArray arrayWithContentsOfFile:path];
        NSMutableArray *arrayModels=[NSMutableArray array];
        for(NSDictionary *dict in arrayDict){
            CZGroup *model=[CZGroup groupWithDict:dict];
            [arrayModels addObject:model];
        }
        _groups=arrayModels;
    }
    NSLog(@"****** %lu",[_groups count]);
    return _groups;
}

- (void)groupHeaderViewDidClickTitleButton:(CZGroupHeaderView *)groupHeaderView
{
    // 刷新table view
    //[self.tableView reloadData];
    
    // 局部刷新(只刷新某个组)
    // 创建一个用来表示某个组的对象
    NSLog(@"9999999999");
    NSIndexSet *idxSet = [NSIndexSet indexSetWithIndex:groupHeaderView.tag];
    
    if (self.tableView.style == UITableViewStyleGrouped && groupHeaderView.tag == 0) {
        
        groupHeaderView.group = self.groups[groupHeaderView.tag];
    }
    
    [self.tableView reloadSections:idxSet withRowAnimation:UITableViewRowAnimationFade];
}



-(BOOL)prefersStatusBarHidden{
    return YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    //self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.tableView.sectionHeaderHeight=44;
//    if (self.tableView.style == UITableViewStyleGrouped) {
//        self.HeaderView = (CZGroupHeaderView *)[self tableView:nil viewForHeaderInSection:0];
//        self.HeaderView.frame = CGRectMake(0, 0, self.view.frame.size.width, 44);
//        self.tableView.tableHeaderView = self.HeaderView;
//    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    //NSLog(@"numofsection %ld",[self.groups count]);
    return self.groups.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    CZGroup *group=self.groups[section];
    if(group.isVisible){
        return group.friends.count;
    }else{
        return 0;
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    // Configure the cell...
    CZGroup *group=self.groups[indexPath.section];
    CZQQFriend *friend=group.friends[indexPath.row];
    
    CZFriendCell *cell=[CZFriendCell friendCellWithTableView:tableView];
    cell.friendModel=friend;
    return cell;
}

//-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
//    CZGroup *group=self.groups[section];
//    return group.name;
//}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    CZGroup *group=self.groups[section];
    CZGroupHeaderView *headerVw=[CZGroupHeaderView groupHeaderViewWithTableView:tableView];
    
    // importtant !!!!!!!!!!
    headerVw.delegate=self;
    
    headerVw.tag=section;
    headerVw.group=group;
    return headerVw;
}


// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}


/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
