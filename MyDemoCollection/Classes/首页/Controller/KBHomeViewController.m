//
//  KBHomeViewController.m
//  MyDemoCollection
//
//  Created by 樊振 on 16/1/7.
//  Copyright © 2016年 kuibu. All rights reserved.
//

#import "KBHomeViewController.h"
#import "UIViewController+KBComAddition.h"
#import "KB_BlockTest.h"
#import "KBHomeTableViewCell.h"
#import "KBTopicModel.h"
#import "MJRefresh.h"
#import "MBProgressHUD.h"
#import "MBProgressHUD+NJ.h"
#import "MJExtension.h"
@interface KBHomeViewController ()<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate>
{
    NSMutableArray *dataSource;//数据源
    
    NSTimer *timer;
}

@property (nonatomic,strong) UITableView *homeTableView;

@end

@implementation KBHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    dataSource = [[NSMutableArray alloc] init];
    [self setTitleViewWithTitle:@"首页"];
    
    //设置数据源
    [self setDataSource];

    //设置表
    _homeTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kWindowSize.width, self.view.height - 48) style:UITableViewStylePlain];
    _homeTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [_homeTableView registerClass:[KBHomeTableViewCell class] forCellReuseIdentifier:@"KBHomeTableViewCell"];
    _homeTableView.delegate = self;
    _homeTableView.dataSource = self;
    [self.view addSubview:_homeTableView];
    
    __unsafe_unretained UITableView *tableView = _homeTableView;
    //下拉刷新
    _homeTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [tableView reloadData];
        [MBProgressHUD showMessage:@"加载数据中....."];
        // 模拟延迟加载数据，因此2秒后才调用（真实开发中，可以移除这段gcd代码）
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            // 结束刷新
            [tableView.mj_header endRefreshing];
            [MBProgressHUD hideHUD];
            [MBProgressHUD showSuccess:@"加载成功"];
        });
    }];
    
    // 设置自动切换透明度(在导航栏下面自动隐藏)
    tableView.mj_header.automaticallyChangeAlpha = YES;
    
    //上拉刷新
    _homeTableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [self setDataSource];
        [tableView reloadData];
        // 模拟延迟加载数据，因此2秒后才调用（真实开发中，可以移除这段gcd代码）
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            // 结束刷新
            [tableView.mj_footer endRefreshing];
        });
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - privateMethod
- (void)setDataSource
{
    KBTopicModel *model = [[KBTopicModel alloc] init];
    model.portrait = LOAD_BUNDLE_IMAGE(@"SnsPlatform/UMS_qq_off");
    model.name = @"樊振";
    model.content = @"多少积分回复都是看见过好多帅哥还是空间规划的设计开发和收到房款加速度恢复快速的恢复开机速度和房价快速的发货的时间开房大厦";
    model.commentCount = 3;
    model.likeCount = 5;
    [dataSource addObject:model];
    
    KBTopicModel *model1 = [[KBTopicModel alloc] init];
    model1.portrait = LOAD_BUNDLE_IMAGE(@"SnsPlatform/UMS_wechat_timeline_off");
    model1.name = @"法法师";
    model1.content = @"发几个地方挂机了东方国际大发了个积分大连国际饭店里高科技的法律高科技的法律可根据地分离开关键的覆盖了看到结果到了可根据地离开过国家的妇科国际饭店管理快递费价格来看的房价更快乐发达国家法定离开国家的房间管理的开发过节费多少；可适当；老福克斯的；了罚款多少；法律考试的法律；上岛咖啡；个；大哥看到三个";
    model1.commentCount = 23;
    model1.likeCount = 25;
    [dataSource addObject:model1];
    
    KBTopicModel *model2 = [[KBTopicModel alloc] init];
    model2.portrait = LOAD_BUNDLE_IMAGE(@"SnsPlatform/UMS_twitter_on");
    model2.name = @"fdsdgdsgsd";
    model2.content = @"罚款了速度；发生的客观；飞得更快；大多数；福克斯；法兰克福；了康复锻炼方式；都发了多少；看到了师傅看电视；了罚款多少；分开发股份你们V刹那部分价格放假了都是；；反倒是；发了多少分；收款方老大顺丰快递了师傅几点上课了攻击速度开了房间的思考方式的；罚款多少；佛罚款；领导送风口俄日；的疯狂的斯洛伐克哦我看发牢骚；地方看电视了；付款；代理商福克斯的；老福克斯；偶然覅；多少了开发了；的收费口；客服；蓝色的开发；额";
    model2.commentCount = 33;
    model2.likeCount = 53;
    [dataSource addObject:model2];
    
    //字典转模型
    UIImage *image =LOAD_BUNDLE_IMAGE(@"SnsPlatform/UMS_twitter_on");
    NSDictionary *dict = @{@"portrait":image,@"name":@"forever",@"content":@"视；了罚款多少；分开发股份你",@"commentCount":@"100",@"likeCount":@"123"};
    NSLog(@"dict:™%@",dict);
    KBTopicModel *model3 = [KBTopicModel mj_objectWithKeyValues:dict];
    NSLog(@"pro:%@",model3.portrait);
    [dataSource addObject:model3];
}
#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    //NSLog(@"%f",_homeTableView.contentOffset.y);
    //if (_homeTableView.contentOffset.y < -120) {
        //[_homeTableView.mj_header beginRefreshing];
        //timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(stopTime) userInfo:nil repeats:NO];
        //NSLog(@"%@-----%@",[NSDate distantPast],[NSDate distantFuture]);
    //}else if (_homeTableView.contentOffset.y>150){
        //[_homeTableView.mj_footer beginRefreshing];
        //timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(stopTime) userInfo:nil repeats:NO];
    //}
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    //NSLog(@"%f",_homeTableView.contentOffset.y);
}

//- (void)stopTime
//{
    //[_homeTableView.mj_header endRefreshing];
    //if ([timer isValid]) {
        //[timer invalidate];
    //}
    //timer = nil;
//}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    KBHomeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"KBHomeTableViewCell"];
    if(cell==nil) {
        cell = [[KBHomeTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"KBHomeTableViewCell"];
    }
    KBTopicModel *model = [dataSource objectAtIndex:indexPath.row];
    [cell setCellWith:model];
    return cell;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    KBHomeTableViewCell *cell = (KBHomeTableViewCell*)[self tableView:tableView cellForRowAtIndexPath:indexPath];
    return cell.height;
}

- (BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath NS_AVAILABLE_IOS(6_0);
{
    return NO;
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
