//
//  KBTableView.m
//  MyDemoCollection
//
//  Created by 樊振 on 16/1/3.
//  Copyright © 2016年 kuibu. All rights reserved.
//

#import "KBTableView.h"
#import "KBTableViewCell.h"
#import "UserModel.h"
#import "UIView+ITTAdditions.h"
@interface KBTableView ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation KBTableView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //代理类
        self.delegate = self;
        //数据源
        self.dataSource = self;
    }
    return self;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_tableData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //指定cellIdentifier为自定义的cell
    static NSString *CellIdentifier = @"Cell";
    //自定义cell类
    KBTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[KBTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    UserModel *user = [_tableData objectAtIndex:indexPath.row];
    [cell setCellWith:user];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    KBTableViewCell *cell = (KBTableViewCell*)[self tableView:self cellForRowAtIndexPath:indexPath];
    return cell.height;
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
