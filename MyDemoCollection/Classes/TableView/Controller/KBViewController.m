//
//  KBViewController.m
//  MyDemoCollection
//
//  Created by 樊振 on 16/1/3.
//  Copyright © 2016年 kuibu. All rights reserved.
//

#import "KBViewController.h"
#import "KBTableView.h"
#import "UIView+ITTAdditions.h"
#import "UserModel.h"
#import "MJRefresh.h"
@interface KBViewController (){
    
    NSMutableArray *tableData;  //tableView数据存放数组
}

@property(nonatomic,retain) KBTableView *tableView;

@property (nonatomic,retain) UIRefreshControl *refreshControl;

@property (nonatomic,retain) UIActivityIndicatorView *myActivityIndicatorView;

@end

@implementation KBViewController

-(void)myMethodName
{
    //停止动画
    [_myActivityIndicatorView stopAnimating];
    //将菊花隐藏掉
    _myActivityIndicatorView.hidden = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    tableData = [[NSMutableArray alloc] init];
    [self createUserData];
    [self initTableView];
    
    ///******内置刷新的常用属性设置******/
    //_refreshControl = [[UIRefreshControl alloc] init];
    //_refreshControl.tintColor = [UIColor redColor];
    //_refreshControl.attributedTitle =[[NSAttributedString alloc]initWithString:@"智课网正在加载"];
    //[_refreshControl addTarget:self action:@selector(pullToRefresh) forControlEvents:UIControlEventValueChanged];
    //[_tableView addSubview:_refreshControl];
    
    ////-------------UIActivityIndicatorView-----------
    //_myActivityIndicatorView = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];//指定进度轮的大小
    //[_myActivityIndicatorView setCenter:CGPointMake(160, 200)];//指定进度轮中心点
    //[_myActivityIndicatorView setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleGray];//设置进度轮显示类型
    //[self.view addSubview:_myActivityIndicatorView];
    //[_myActivityIndicatorView startAnimating];
    ////[self performSelector:@selector(myMethodName) withObject:nil afterDelay:2.0f];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//初始化tableView;
-(void)initTableView{
    
    _tableView = [[KBTableView alloc] initWithFrame:CGRectMake(self.view.left, self.view.top, self.view.width, self.view.height)];
    NSLog(@"%@",tableData);
    _tableView.tableData = tableData;
    [self.view addSubview:_tableView];
}

-(void)createUserData{
    
    UserModel *user = [[UserModel alloc] init];
    [user setUsername:@"胖虎"];
    [user setIntroduction:@"我是胖虎我怕谁!!我是胖虎我怕谁!!我是胖虎我怕谁!!"];
    [user setImagePath:@"3.jpg"];
    
    UserModel *user2 = [[UserModel alloc] init];
    [user2 setUsername:@"多啦A梦"];
    [user2 setIntroduction:@"我是多啦A梦我有肚子!!我是多啦A梦我有肚子!!我是多啦A梦我有肚子!!我是多啦A梦我有肚子!!我是多啦A梦我有肚子!!我是多啦A梦我有肚子!!我是多啦A梦我有肚子!!我是多啦A梦我有肚子!!的风格基金分开了房间管理的会计管理的康复机构的法律可根据地分离开关键的浪费国家发的连接的管理看到结果来看大家带来开发工具等法律地方见过了多久发感慨了国家的管理罚款法规和对方就更好的反馈结果和地方考高级回复的价格考核得分高科技复合接口的法规和东风科技规划的反馈结果"];
    [user2 setImagePath:@"2.jpg"];
    
    UserModel *user3 = [[UserModel alloc] init];
    [user3 setUsername:@"大雄"];
    [user3 setIntroduction:@"我是大雄我谁都怕，我是大雄我谁都怕，我是大雄我谁都怕，我是大雄我谁都怕，我是大雄我谁都怕，我是大雄我谁都怕，"];
    [user3 setImagePath:@"icon"];
    
    [tableData addObject:user];
    [tableData addObject:user2];
    [tableData addObject:user3];  
    
}

-(void)pullToRefresh
{
    [tableData addObjectsFromArray:tableData];
    _tableView.tableData = tableData;
    [_tableView reloadData];
    [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(timerStop) userInfo:nil repeats:NO];
}

-(void)timerStop
{
    [_refreshControl endRefreshing];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
