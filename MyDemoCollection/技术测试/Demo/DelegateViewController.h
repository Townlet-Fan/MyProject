//
//  DelegateViewController.h
//  blockAndDelageta
//
//  Created by dbjyz on 16/1/8.
//  Copyright © 2016年 dbjyz. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DelegateViewController;
@protocol meDelegateViewController <NSObject>

-(void)delegateClick:(NSString *)meStr;
@end


@interface DelegateViewController : UIViewController

@property(strong, nonatomic)id<meDelegateViewController>delegate;

@end
