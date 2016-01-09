//
//  KBTableViewCell.h
//  MyDemoCollection
//
//  Created by 樊振 on 16/1/3.
//  Copyright © 2016年 kuibu. All rights reserved.
//

#import <UIKit/UIKit.h>
@class UserModel;

@interface KBTableViewCell : UITableViewCell

//给Cell赋值并且实现自动换行
-(void)setCellWith:(UserModel*)model;

@end
