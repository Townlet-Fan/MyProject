//
//  ViewController.m
//  MyDemoCollection
//
//  Created by 樊振 on 16/1/3.
//  Copyright © 2016年 kuibu. All rights reserved.
//

#import "ViewController.h"
#import "KBViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    KBViewController *vc = [[KBViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
