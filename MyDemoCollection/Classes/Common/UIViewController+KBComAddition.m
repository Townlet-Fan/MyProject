//
//  UIViewController+KBComAddition.m
//  MyDemoCollection
//
//  Created by 樊振 on 16/1/9.
//  Copyright © 2016年 kuibu. All rights reserved.
//

#import "UIViewController+KBComAddition.h"

@implementation UIViewController (KBComAddition)

- (void)setLeftButtonWithTitle:(NSString *)title action:(SEL)action
{
    UIBarButtonItem *backButtonItem = [[UIBarButtonItem alloc] initWithTitle:title style:UIBarButtonItemStylePlain target:self action:action];
    backButtonItem.customView.frame = CGRectMake(0, 0, 40, 35);
    self.navigationItem.leftBarButtonItem = backButtonItem;
}
- (void)setLeftButtonWithImageName:(NSString *)imageName action:(SEL)action
{
    
}

- (void)setRightButtonWithTitle:(NSString *)title action:(SEL)action
{
    
}
- (void)setRightButtonWithImageName:(NSString *)imageName action:(SEL)action
{
    
}

- (void)setTitleViewWithTitle:(NSString *)title
{
    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(60, 0, self.view.frame.size.width-120, 60)];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.font = [UIFont systemFontOfSize:18.0f];
    titleLabel.text= title;
    titleLabel.textColor = [UIColor blackColor];
    [self.navigationItem setTitleView:titleLabel];
}

@end
