//
//  KBTableViewCell.m
//  MyDemoCollection
//
//  Created by 樊振 on 16/1/3.
//  Copyright © 2016年 kuibu. All rights reserved.
//

#import "KBTableViewCell.h"
#import "UserModel.h"
#import "KBConstant.h"
#import "UIView+ITTAdditions.h"
@interface KBTableViewCell()
//用户名
@property(nonatomic,retain) UILabel *name;

//用户介绍
@property(nonatomic,retain) UILabel *introduction;

//用户头像
@property(nonatomic,retain) UIImageView *userImage;

@end

@implementation KBTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        _name = [[UILabel alloc] initWithFrame:CGRectMake(71, 5, kWindowSize.width, 40)];
        [self addSubview:_name];
        
        _userImage = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, 66, 66)];
        [self addSubview:_userImage];
        
        _introduction = [[UILabel alloc] initWithFrame:CGRectMake(5, 78, kWindowSize.width, 40)];
        [self addSubview:_introduction];
    }
    return self;
}

- (void)setCellWith:(UserModel *)model
{
    self.name.text = model.username;
    [self.userImage setImage:[UIImage imageNamed:model.imagePath]];
    //获得当前cell高度
    CGRect frame = [self frame];
    //文本赋值
    self.introduction.text = model.introduction;
    //设置label的最大行数
    self.introduction.numberOfLines = 0;
    CGSize size = [_introduction sizeThatFits:CGSizeMake(_introduction.width, MAXFLOAT)];
    _introduction.frame = CGRectMake(_introduction.left, _introduction.top, size.width, size.height);
    
    //计算出自适应的高度
    frame.size.height = _introduction.bottom + 20;
    self.frame = frame;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
