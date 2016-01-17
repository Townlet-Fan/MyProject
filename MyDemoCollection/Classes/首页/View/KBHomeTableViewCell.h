//
//  KBHomeTableViewCell.h
//  MyDemoCollection
//
//  Created by 樊振 on 16/1/10.
//  Copyright © 2016年 kuibu. All rights reserved.
//

#import <UIKit/UIKit.h>
@class KBTopicModel;

@interface KBHomeTableViewCell : UITableViewCell

/**
 *  头像
 */
@property (nonatomic,retain) UIImageView *portrait;
/**
 *  名字
 */
@property (nonatomic,retain) UILabel *name;
/**
 *  帖子内容
 */
@property (nonatomic,retain) UILabel *content;
/**
 *  评论图标
 */
@property (nonatomic,retain) UIImageView *commmentView;
/**
 *  评论计数
 */
@property (nonatomic,retain) UILabel *commentCount;
/**
 *  点赞图标
 */
@property (nonatomic,retain) UIImageView *likeView;
/**
 *  点赞计数
 */
@property (nonatomic,retain) UILabel *likeCount;

- (void) setCellWith:(KBTopicModel*)model;

@end
