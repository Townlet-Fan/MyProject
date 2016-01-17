//
//  KBMenuTableViewController.m
//  MyDemoCollection
//
//  Created by 樊振 on 16/1/14.
//  Copyright © 2016年 kuibu. All rights reserved.
//

#import "KBMenuTableViewController.h"
#import "KBChooseMutiImages.h"
#import "AppDelegate.h"
#import "DDMenuController.h"
@interface KBMenuTableViewController()

@property (nonatomic,strong) AppDelegate *appDelegate;

@end

@implementation KBMenuTableViewController

- (void)viewDidLoad
{
    _appDelegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kWindowSize.width, kWindowSize.height) style:UITableViewStylePlain];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    switch (indexPath.row) {
        case 0:
            cell.textLabel.text = @"选择多张照片";
            break;
            
        default:
            break;
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [self tableView:tableView cellForRowAtIndexPath:indexPath];
    return cell.height;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0:
            [_appDelegate.nav pushViewController:[[KBChooseMutiImages alloc] init] animated:YES];
            [_appDelegate.ddMenuController showRootController:YES];
            break;
            
        default:
            break;
    }
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)sectio
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 100, kWindowSize.width, 200)];
    view.backgroundColor = [UIColor grayColor];
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    UIView *view = [self tableView:tableView viewForHeaderInSection:section];
    return view.height;
}

@end


