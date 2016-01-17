//
//  KBBlockAndDelegateTest.m
//  MyDemoCollection
//
//  Created by 樊振 on 16/1/13.
//  Copyright © 2016年 kuibu. All rights reserved.
//

#import "KBBlockAndDelegateTest.h"
#import "BlockViewController.h"
#import "DelegateViewController.h"

@interface KBBlockAndDelegateTest ()<meDelegateViewController>
@property(strong, nonatomic)BlockViewController * BlockVC;
@end


@implementation KBBlockAndDelegateTest

- (void)viewDidLoad
{
    UIButton *btn=[[UIButton alloc]init];
    btn.frame = CGRectMake(100, 200, 120, 50);
    btn.backgroundColor=[UIColor blueColor];
    [btn setTitle:@"代理传值" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    UIButton *btn2=[[UIButton alloc]init];
    btn2.frame = CGRectMake(100, CGRectGetMaxY(btn.frame)+20, 120, 50);
    btn2.backgroundColor=[UIColor blueColor];
    [btn2 setTitle:@"Block传值" forState:UIControlStateNormal];
    [btn2 addTarget:self action:@selector(block) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn2];
}

-(void)btnClick{
    DelegateViewController * delegateVC = [[DelegateViewController alloc] init];
    delegateVC.delegate = self;
    [self.navigationController pushViewController:delegateVC animated:YES];
    
}


-(void)block{
    //block传值
    BlockViewController * BlockVC = [BlockViewController new];
    
    //当且仅当nextVCBlock在A中被调用时，block内部才会被执行,此作用一是初始化nextVCBlock，而是获取值
    BlockVC.nextVCBlock = ^(NSString * meStr){
        NSLog(@"我是block传来的值 == %@",meStr);
    };
    
    [self.navigationController pushViewController:BlockVC animated:YES];
}


#pragma 代理方法
-(void)delegateClick:(NSString *)meStr{
    NSLog(@"我是获值方，此方法是在传值方触发 == %@",meStr);
    
}

@end
