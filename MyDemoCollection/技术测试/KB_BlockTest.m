//
//  KB_BlockTest.m
//  MyDemoCollection
//
//  Created by 樊振 on 16/1/4.
//  Copyright © 2016年 kuibu. All rights reserved.
//

#import "KB_BlockTest.h"

@implementation KB_BlockTest

- (void)viewDidLoad
{
    //程序会首先执行这
    [self getQiniuUploadScope:@"ceshi" success:^(NSString *token) {
        NSLog(@"执行第三步：token == %@",token);
    } failure:^(NSError *error) {
        NSLog(@"error == %@",error);
    }];
    
    [self upLoadImageUrl:@"www.baidu1.com" success:^(NSString *succ) {
        NSLog(@"%@",succ);
    } failure:^(NSString *err) {
        NSLog(@"%@",err);
        NSLog(@"dfsjdsjdjfkhsdfkdsh");
    }];
}

//函数正常参数和block函数参数理解【不管是什么只要是函数都是要触发才能执行的，block函数也是函数】
/*
 自定义函数：如果参数是正常的参数，调用此函数是会直接使用正常参数执行，如果是以block函数作为参数时【此时作用恰恰相反：他是来获取值的，而不是提供值的了】，此时他并不是这个函数的真正的参数了，而是在来这个函数获取值触发回调的。
 */



//单独定义block函数，此时eg：FailureBlock、SuccessBlock就是其函数名

/*自定义语法：
 返回值类型(^函数名)(参数类型 参数名）;
 */

//eg：
/*
 typedef void(^FailureBlock)(NSError *error);
 typedef void(^SuccessBlock)(id json);
 */


//优点：我们可以在一个函数里先传来一个参数。。。处理，，，处理完成后有直接在本函数里使用，，，再传给其block函数参数，相当于我们写了好几个函数，大大地减少了函数的个数，非常方便。


//直接在参数里定义block函数
//注意看是block函数作为函数的参数，此时参数名就是函数名
-(void)getQiniuUploadScope:(NSString *)scope success:(void (^)(NSString *token))success failure:(void (^)(NSError *error))failure{
    
    NSLog(@"执行第一步：scope == %@",scope);
    
    //在这里判断看是执行（触发）成功的函数或者是失败的函数
    //如果是默认执行成功函数时接直接
    /*
     if (success) {
     success(@"jiayazi");
     }
     */
    if ([scope isEqualToString:@"ceshi"]) {
        NSLog(@"执行第二步");
        success(@"jiayazi");//此时就是在触发参数block函数，这就是回调。【从函数一调用过来的，经过函数二执行处理下，又会回调到函数一】
    }else{
        NSError * error;
        failure(error);
    }
}

- (void) upLoadImageUrl:(NSString *)imageUrl success:(SuccessBlock)SUCCE failure:(FailBlock)FAIL
{
    NSLog(@"%@,%@",SUCCE,FAIL);
    
    if ([imageUrl isEqualToString:@"www.baidu.com"]) {
        SUCCE(@"上传成功");
    }else{
        FAIL(@"上传失败");
    }
}

@end
