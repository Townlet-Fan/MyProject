//
//  UIViewController+KBComAddition.h
//  MyDemoCollection
//
//  Created by 樊振 on 16/1/9.
//  Copyright © 2016年 kuibu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (KBComAddition)

- (void)setLeftButtonWithTitle:(NSString *)title action:(SEL)action;
- (void)setLeftButtonWithImageName:(NSString *)imageName action:(SEL)action;

- (void)setRightButtonWithTitle:(NSString *)title action:(SEL)action;
- (void)setRightButtonWithImageName:(NSString *)imageName action:(SEL)action;

- (void)setTitleViewWithTitle:(NSString *)title;

@end
