//
//  UserModel.h
//  MyDemoCollection
//
//  Created by 樊振 on 16/1/3.
//  Copyright © 2016年 kuibu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserModel : NSObject

//用户名

@property (nonatomic,copy) NSString *username;

//介绍

@property (nonatomic,copy) NSString *introduction;

//头像图片路径

@property (nonatomic,copy) NSString *imagePath;

@end
