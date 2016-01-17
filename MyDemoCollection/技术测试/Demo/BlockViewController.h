//
//  BlockViewController.h
//  blockAndDelageta
//
//  Created by dbjyz on 16/1/8.
//  Copyright © 2016年 dbjyz. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^NextVCBlock)(NSString *textField);
@interface BlockViewController : UIViewController

@property(nonatomic,copy)NextVCBlock nextVCBlock;


//注意block传值和block方法回调是不一样的，要注意
@end
