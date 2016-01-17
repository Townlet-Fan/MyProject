//
//  DelegateViewController.m
//  blockAndDelageta
//
//  Created by dbjyz on 16/1/8.
//  Copyright © 2016年 dbjyz. All rights reserved.
//

#import "DelegateViewController.h"

@interface DelegateViewController ()

@end

@implementation DelegateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton *btn=[[UIButton alloc]init];
    btn.frame = CGRectMake(100, 300, 120, 50);
    btn.backgroundColor=[UIColor blueColor];
    [btn setTitle:@"点击传值" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

-(void)btnClick{
    
    [_delegate delegateClick:@"我是传值方，代理是什么：是回调，就是在A中发生的事情，发生完成后通知B，只是通知B。。。B只是被通知，并不能左右A中的东西，只是接到指令要做什么事情了"];
   [self.navigationController popViewControllerAnimated:YES]; 
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
