//
//  KB_BlockTest.h
//  MyDemoCollection
//
//  Created by 樊振 on 16/1/4.
//  Copyright © 2016年 kuibu. All rights reserved.
//测试block原理及用法，调用在Appdelegate

#import <UIKit/UIKit.h>
typedef void (^FailBlock)(NSString *err);
typedef void (^SuccessBlock)(NSString *succ);

@interface KB_BlockTest : UIViewController

/** 获取七牛上传token */
-(void)getQiniuUploadScope:(NSString *)scope success:(void (^)(NSString *token))success failure:(void (^)(NSError *error))failure;

- (void)upLoadImageUrl:(NSString*)imageUrl success:(SuccessBlock)SUCCE failure:(FailBlock)FAIL;

@end
