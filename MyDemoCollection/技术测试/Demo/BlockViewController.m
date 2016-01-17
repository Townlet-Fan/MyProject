//
//  BlockViewController.m
//  blockAndDelageta
//
//  Created by dbjyz on 16/1/8.
//  Copyright © 2016年 dbjyz. All rights reserved.
//

#import "BlockViewController.h"

@interface BlockViewController ()

@end

@implementation BlockViewController

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
    //必须要判断
    if (_nextVCBlock) {
        _nextVCBlock(@"我是block传值");
    }
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
