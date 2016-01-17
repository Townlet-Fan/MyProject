//
//  KBResourceViewController.m
//  MyDemoCollection
//
//  Created by 樊振 on 16/1/7.
//  Copyright © 2016年 kuibu. All rights reserved.
//

#import "KBResourceViewController.h"
#import "KB_BlockTest.h"
@interface KBResourceViewController ()

@end

@implementation KBResourceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 64, 100, 100)];
    button.backgroundColor = [UIColor redColor];
    [button addTarget:self action:@selector(pushInto) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)pushInto
{
    [self.navigationController pushViewController:[[KB_BlockTest alloc] init] animated:YES];
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
