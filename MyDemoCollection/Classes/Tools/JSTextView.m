//
//  JSTextView.m
//  MyDemoCollection
//
//  Created by 樊振 on 16/1/12.
//  Copyright © 2016年 kuibu. All rights reserved.
//

#import "JSTextView.h"

@interface JSTextView ()

@property (nonatomic,weak) UILabel *placeholderLabel; //这里先拿出这个label以方便我们后面的使用

@end

@implementation JSTextView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if(self) {
        self.backgroundColor= [UIColor clearColor];
        UILabel *placeholderLabel = [[UILabel alloc]init];//添加一个占位label
        placeholderLabel.backgroundColor= [UIColor clearColor];
        placeholderLabel.numberOfLines=0; //设置可以输入多行文字时可以自动换行
        [self addSubview:placeholderLabel];
        
        self.placeholderLabel= placeholderLabel; //赋值保存
        self.myPlaceholderColor= [UIColor lightGrayColor]; //设置占位文字默认颜色
        self.font= [UIFont systemFontOfSize:15]; //设置默认的字体
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textDidChange) name:UITextViewTextDidChangeNotification object:self]; //通知:监听文字的改变
    }
    return self;
}

#pragma mark -监听文字改变
- (void)textDidChange {
    self.placeholderLabel.hidden = self.hasText;//这个 hasText  是一个 系统的 BOOL  属性，如果 UITextView 输入了文字  hasText 就是 YES，反之就为 NO。
}
#pragma mark - 我们在  - (void)layoutSubviews 方法里面设置 UILabel 的 frame.
- (void)layoutSubviews {
    
    [super layoutSubviews];
    self.placeholderLabel.top=8; //设置UILabel 的 y值
    self.placeholderLabel.left=5;//设置 UILabel 的 x 值
    self.placeholderLabel.width=self.width-self.placeholderLabel.left*2.0; //设置 UILabel 的 x
    //根据文字计算高度
    CGSize maxSize =CGSizeMake(self.placeholderLabel.width,MAXFLOAT);
    self.placeholderLabel.height= [self.myPlaceholder boundingRectWithSize:maxSize options:NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : self.placeholderLabel.font} context:nil].size.height;
}
#pragma mark - 重写我们 暴露出来的 文字 ,颜色以及系统的font 的 set方法 :
- (void)setMyPlaceholder:(NSString*)myPlaceholder{
    _myPlaceholder= [myPlaceholder copy];
    //设置文字
    self.placeholderLabel.text= myPlaceholder;
    //重新计算子控件frame
    [self setNeedsLayout];
}

- (void)setMyPlaceholderColor:(UIColor*)myPlaceholderColor{
    _myPlaceholderColor= myPlaceholderColor;
    //设置颜色
    self.placeholderLabel.textColor= myPlaceholderColor;
}
//重写这个set方法保持font一致
- (void)setFont:(UIFont*)font {
    [super setFont:font];
    self.placeholderLabel.font= font;
    //重新计算子控件frame
    [self setNeedsLayout];
}

#pragma mark - 重写 - (void)setText:(NSString*)text  以及 - (void)setAttributedText:(NSAttributedString*)attributedText 方法来控制 UILabel 的显示 和 隐藏
- (void)setText:(NSString*)text{
    [super setText:text];
    [self textDidChange]; //这里调用的就是 UITextViewTextDidChangeNotification 通知的回调
}

- (void)setAttributedText:(NSAttributedString*)attributedText {
    [super setAttributedText:attributedText];
    [self textDidChange]; //这里调用的就是UITextViewTextDidChangeNotification 通知的回调
}

- (void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:UITextViewTextDidChangeNotification];
}

@end
