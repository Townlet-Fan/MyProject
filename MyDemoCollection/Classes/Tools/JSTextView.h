//
//  JSTextView.h
//  MyDemoCollection
//
//  Created by 樊振 on 16/1/12.
//  Copyright © 2016年 kuibu. All rights reserved.
//自定义TextView 实现placeholder

#import <UIKit/UIKit.h>

@interface JSTextView : UITextView

@property(nonatomic,copy) NSString *myPlaceholder;  //文字

@property(nonatomic,strong) UIColor *myPlaceholderColor; //文字颜色

@end
