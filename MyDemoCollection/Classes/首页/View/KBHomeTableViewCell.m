//
//  KBHomeTableViewCell.m
//  MyDemoCollection
//
//  Created by 樊振 on 16/1/10.
//  Copyright © 2016年 kuibu. All rights reserved.
//

#import "KBHomeTableViewCell.h"
#import "KBTopicModel.h"
#import "UIView+ITTAdditions.h"

#define Content_WidthTo_CellEdge 10
#define PortraitSize 50

#define CommentViewSize 30
#define LikeViewSize CommentViewSize

#define CommentViewSpaceWithContent 15

@interface KBHomeTableViewCell()
{
    UIView *backgroundView;
}
@end

@implementation KBHomeTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self initCell];
    }
    return self;
}

- (void)initCell
{
    //背景
    backgroundView = [[UIView alloc] initWithFrame:CGRectMake(Content_WidthTo_CellEdge, Content_WidthTo_CellEdge, kWindowSize.width - 2*Content_WidthTo_CellEdge,self.height - Content_WidthTo_CellEdge)];
    backgroundView.layer.cornerRadius = 10;
    backgroundView.backgroundColor = KColor_alpha(244, 1);
    [self.contentView addSubview:backgroundView];
    
    //头像
    _portrait = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, PortraitSize, PortraitSize)];
    [backgroundView addSubview:_portrait];
    
    //姓名
    _name = [[UILabel alloc] initWithFrame:CGRectMake(_portrait.right+5, _portrait.top, 100, 30)];
    [backgroundView addSubview:_name];
    
    //帖子内容
    _content = [[UILabel alloc] initWithFrame:CGRectMake(_name.left, _name.bottom+5, kWindowSize.width - _portrait.right-20, 50)];
    [backgroundView addSubview:_content];
    //评论图标
    _commmentView = [[UIImageView alloc] initWithFrame:CGRectMake(kWindowSize.width - 150, _content.bottom + CommentViewSpaceWithContent, CommentViewSize, CommentViewSize)];
    _commmentView.image = LOAD_BUNDLE_IMAGE(@"SnsPlatform/UMS_wechat_timeline_off");
    
    [backgroundView addSubview:_commmentView];
    //评论计数
    _commentCount = [[UILabel alloc] initWithFrame:CGRectMake(_commmentView.right, _commmentView.top, CommentViewSize, CommentViewSize)];
    [backgroundView addSubview:_commentCount];
    
    //点赞图标
    _likeView = [[UIImageView alloc] initWithFrame:CGRectMake(_commentCount.right+5, _commentCount.top, LikeViewSize, LikeViewSize)];
    _likeView.image = LOAD_BUNDLE_IMAGE(@"SnsPlatform/UMS_twitter_on");
    [backgroundView addSubview:_likeView];
    //点赞计数
    _likeCount = [[UILabel alloc] initWithFrame:CGRectMake(_likeView.right, _likeView.top, LikeViewSize, LikeViewSize)];
    [backgroundView addSubview:_likeCount];
}

- (void)setCellWith:(KBTopicModel*)model
{
    //头像
    if (model.portrait) {
        _portrait.image = model.portrait;
    }else{
        _portrait.image = LOAD_BUNDLE_IMAGE(@"Buttons/UMS_User-Avatar-Placeholder");
    }
    
    //名字
    _name.text = model.name;
    
    //帖子内容
    _content.text = model.content;
    _content.numberOfLines = 0;
    CGSize size = [_content sizeThatFits:CGSizeMake(_content.width, MAXFLOAT)];
    _content.frame = CGRectMake(_content.left, _content.top, size.width, size.height);
    
    //评论跳转
    _commmentView.frame = CGRectMake(_commmentView.left, _content.bottom + CommentViewSpaceWithContent, _commmentView.width, _commmentView.height);
    _commentCount.text = [NSString stringWithFormat:@"%ld",(long)model.commentCount];
    _commentCount.frame = CGRectMake(_commentCount.left, _commmentView.top, _commentCount.width , _commentCount.height);
    
    //点赞
    _likeView.frame = CGRectMake(_likeView.left, _commentCount.top, _likeView.width, _likeView.height);
    _likeCount.text = [NSString stringWithFormat:@"%ld",(long)model.likeCount];
    _likeCount.frame = CGRectMake(_likeCount.left, _likeView.top, _likeCount.width, _likeCount.height);
    
    //背景
    backgroundView.frame = CGRectMake(backgroundView.left, backgroundView.top, backgroundView.width, _likeCount.bottom+10);
    self.frame = CGRectMake(self.left, self.top, self.width, _likeCount.bottom+20);
    self.contentView.frame = self.frame;
}

@end
