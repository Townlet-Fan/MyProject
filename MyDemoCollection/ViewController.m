//
//  ViewController.m
//  MyDemoCollection
//
//  Created by 樊振 on 16/1/3.
//  Copyright © 2016年 kuibu. All rights reserved.
//

#import "ViewController.h"
#import "KBViewController.h"
#import "JSTextView.h"
#import "KBBlockAndDelegateTest.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //KBViewController *vc = [[KBViewController alloc] init];
    //[self.navigationController pushViewController:vc animated:YES];
    
    KBBlockAndDelegateTest *test = [[KBBlockAndDelegateTest alloc] init];
    [self.navigationController pushViewController:test animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)JSTextView
{
    //测试自定义TextView
    JSTextView *textView = [[JSTextView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:textView];
    //1.设置提醒文字
    textView.myPlaceholder=@"分享新鲜事...分工会经费靠规划的反馈给机会的反馈结果的恢复健康";
    //2.设置提醒文字颜色
    textView.myPlaceholderColor= [UIColor lightGrayColor];
}

@end
