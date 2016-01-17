//
//  AppDelegate.m
//  MyDemoCollection
//
//  Created by 樊振 on 16/1/3.
//  Copyright © 2016年 kuibu. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "KB_BlockTest.h"
#import "KBViewController.h"
#import "KBHomeViewController.h"
#import "KBMyTableViewController.h"
#import "KBResourceViewController.h"
#import "KBTools.h"
#import "DDMenuController.h"
#import "KBMenuTableViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    //测试区
    //KB_BlockTest *kb = [[KB_BlockTest alloc] init];
    
    //UITabBarController
    KBHomeViewController *homeVC = [[KBHomeViewController alloc] init];
    UITabBarItem *homeBarItem = [[UITabBarItem alloc] initWithTitle:@"首页" image:LOAD_BUNDLE_IMAGE(@"SnsPlatform/UMS_qq_on") selectedImage:LOAD_BUNDLE_IMAGE(@"SnsPlatform/UMS_qq_off")];
    homeVC.tabBarItem = homeBarItem;
    
    KBMyTableViewController *myTableVC = [[KBMyTableViewController alloc] init];
    UITabBarItem *myBarItem = [[UITabBarItem alloc] initWithTitle:@"我的" image:LOAD_BUNDLE_IMAGE(@"SnsPlatform/UMS_twitter_on") selectedImage:LOAD_BUNDLE_IMAGE(@"SnsPlatform/UMS_twitter_off")];
    myTableVC.tabBarItem = myBarItem;

    KBResourceViewController *resourceVC = [[KBResourceViewController alloc] init];
    UITabBarItem *resourceBarItem = [[UITabBarItem alloc]initWithTitle:@"资源版块" image:LOAD_BUNDLE_IMAGE(@"SnsPlatform/UMS_wechat_timeline_off") selectedImage:LOAD_BUNDLE_IMAGE(@"SnsPlatform/UMS_wechat_timeline_icon")];
    resourceVC.tabBarItem = resourceBarItem;
    
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    tabBarController.viewControllers = [NSArray arrayWithObjects:homeVC,resourceVC,myTableVC,nil];
    
    //设置导航栏
    _nav = [[UINavigationController alloc] initWithRootViewController:tabBarController];
    _ddMenuController = [[DDMenuController alloc] initWithRootViewController:_nav];
    _ddMenuController.leftViewController = [[KBMenuTableViewController alloc] init];
    self.window.rootViewController = _ddMenuController;
    //self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:[[ViewController alloc] init]];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
