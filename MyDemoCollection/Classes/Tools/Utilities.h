//
//  Utilities.h
//  MyDemoCollection
//
//  Created by 樊振 on 16/1/10.
//  Copyright © 2016年 kuibu. All rights reserved.
//

#ifndef Utilities_h
#define Utilities_h


#endif /* Utilities_h */

#pragma mark - 屏幕尺寸
//屏幕尺寸
#define kWindowSize [UIScreen mainScreen].bounds.size

#pragma mark - 图片
//TODO:(bundle读取文件还要琢磨？？？)
////读取本地图片
//#define LOADIMAGE(file,ext) [UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:file ofType:ext]]
////定义UIImage对象
//#define IMAGE(A) [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:A ofType:nil]]

#pragma mark - 颜色
//RGB245
#define KColor_245 [UIColor colorWithRed:245/255.0 green:245/255.0 blue:245/255.0 alpha:1]
//RGB250
#define KColor_250 [UIColor colorWithRed:250/255.0 green:250/255.0 blue:250/255.0 alpha:1]
//(灰色)RGB-alpha
#define KColor_alpha(color,Alpha) [UIColor colorWithRed:color/255.0 green:color/255.0 blue:color/255.0 alpha:Alpha]







