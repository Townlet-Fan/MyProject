//
//  KBChooseMutiImages.m
//  MyDemoCollection
//
//  Created by 樊振 on 16/1/14.
//  Copyright © 2016年 kuibu. All rights reserved.
//

#import "KBChooseMutiImages.h"
#import "ZYQAssetPickerController.h"
@interface KBChooseMutiImages()<ZYQAssetPickerControllerDelegate,UINavigationControllerDelegate>
{
    NSMutableArray *images;
}
@property (nonatomic,strong) UITextView *textView;

@end

@implementation KBChooseMutiImages

- (void)viewDidLoad
{
    images = [[NSMutableArray alloc] init];
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(50, 50, 50, 50)];
    button.backgroundColor = [UIColor redColor];
    [button addTarget:self action:@selector(chooseImages) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    _textView = [[UITextView alloc] initWithFrame:CGRectMake(50, 150, 200, 200)];
    _textView.backgroundColor=[UIColor grayColor];
    [self.view addSubview:_textView];
}

- (void)chooseImages
{
    ZYQAssetPickerController *picker = [[ZYQAssetPickerController alloc] init];
    picker.maximumNumberOfSelection = 10;
    picker.assetsFilter = [ALAssetsFilter allPhotos];
    picker.showEmptyGroups=NO;
    picker.delegate=self;
    picker.selectionFilter = [NSPredicate predicateWithBlock:^BOOL(id evaluatedObject, NSDictionary *bindings) {
        if ([[(ALAsset*)evaluatedObject valueForProperty:ALAssetPropertyType] isEqual:ALAssetTypeVideo]) {
            NSTimeInterval duration = [[(ALAsset*)evaluatedObject valueForProperty:ALAssetPropertyDuration] doubleValue];
            return duration >= 5;
        } else {
            return YES;
        }
    }];
    
    [self presentViewController:picker animated:YES completion:NULL];
}

#pragma mark - ZYQAssetPickerController Delegate
-(void)assetPickerController:(ZYQAssetPickerController *)picker didFinishPickingAssets:(NSArray *)assets{
    //[src.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    //dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        ////src.contentSize=CGSizeMake(assets.count*src.frame.size.width, src.frame.size.height);
        //dispatch_async(dispatch_get_main_queue(), ^{
            ////pageControl.numberOfPages=assets.count;
        //});
        
        //for (int i=0; i<assets.count; i++) {
            //ALAsset *asset=assets[i];
            ////UIImageView *imgview=[[UIImageView alloc] initWithFrame:CGRectMake(i*src.frame.size.width, 0, src.frame.size.width, src.frame.size.height)];
            ////imgview.contentMode=UIViewContentModeScaleAspectFill;
            ////imgview.clipsToBounds=YES;
            //UIImage *tempImg=[UIImage imageWithCGImage:asset.defaultRepresentation.fullScreenImage];
            //NSLog(@"tempImg:%@",tempImg);
            //dispatch_async(dispatch_get_main_queue(), ^{
                ////[imgview setImage:tempImg];
                ////[src addSubview:imgview];
                //[images addObject:tempImg];
                //NSLog(@"%@",images);

            //});
            
        //}
        
        //[self setTextViewWithImages];
    //});
    
    for (int i=0; i<assets.count; i++) {
        ALAsset *asset=assets[i];
        UIImage *tempImg=[UIImage imageWithCGImage:asset.defaultRepresentation.fullScreenImage];
        NSLog(@"tempImg:%@",tempImg);
        [images addObject:tempImg];
        NSLog(@"%@",images);
    }
    [self setTextViewWithImages];
}

- (void)setTextViewWithImages
{                NSLog(@"----------%@",images);

    for (NSInteger i = 0; i<images.count; i++) {
        UIImageView *image = [[UIImageView alloc] initWithFrame:CGRectMake(i*40, 0, 40, 40)];
        image.image = images[i];
        [_textView addSubview:image];
    }
    
}

@end
