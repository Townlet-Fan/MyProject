//
//  KBTools.h
//  MyDemoCollection
//
//  Created by 樊振 on 16/1/8.
//  Copyright © 2016年 kuibu. All rights reserved.
//

#import <Foundation/Foundation.h>

#pragma mark - 读取bundle文件(图片)
#define bundlePath [[NSBundle mainBundle] pathForResource:@"UMSocialSDKResourcesNew" ofType:@"bundle"]
#define LOAD_BUNDLE_IMAGE(imageString) [UIImage imageWithContentsOfFile:[bundlePath stringByAppendingPathComponent:imageString]]


@interface KBTools : NSObject

@end
