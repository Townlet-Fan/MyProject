//
//  AppDelegate.h
//  MyDemoCollection
//
//  Created by 樊振 on 16/1/3.
//  Copyright © 2016年 kuibu. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DDMenuController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) UINavigationController *nav;

@property (strong, nonatomic) DDMenuController *ddMenuController;

@end

