//
//  KBTopicModel.h
//  MyDemoCollection
//
//  Created by 樊振 on 16/1/10.
//  Copyright © 2016年 kuibu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface KBTopicModel : NSObject
/**
 *  头像
 */
@property (nonatomic,retain) UIImage *portrait;
/**
 *  名字
 */
@property (nonatomic,retain) NSString *name;
/**
 *  帖子内容
 */
@property (nonatomic,retain) NSString *content;

/**
 *  评论计数
 */
@property (nonatomic,assign) NSInteger commentCount;

/**
 *  点赞计数
 */
@property (nonatomic,assign) NSInteger likeCount;

@end
