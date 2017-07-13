//
//  RefreshView.m
//  ceshi zhuanyong
//
//  Created by 张小牛 on 16/7/2.
//  Copyright © 2016年 SuYunTong. All rights reserved.
//

#define ZXNColor(R,G,B,A) [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:A]
#define boundWidth      [UIScreen mainScreen].bounds.size.width
#define boundHeight     [UIScreen mainScreen].bounds.size.height
#define mainWidth 80
#define imageWidth 60
#define imageX boundWidth/2-imageWidth/2
#import "RefreshView.h"

@implementation RefreshView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self) {
        self = [super initWithFrame:frame];
        [self customView];
    }
    return self;
}

- (void)customView{

    self.backgroundColor = [UIColor whiteColor];//ZXNColor(238, 238, 238, 1);

    _imageView = [[UIImageView alloc]init];
    _imageView.image = [UIImage imageNamed:@"yinxing"];
    _imageView.layer.masksToBounds = YES;
    _imageView.layer.cornerRadius = imageWidth/2;
    _imageView.frame = CGRectMake(imageX, (mainWidth-imageWidth)/2, imageWidth, imageWidth);
    [self addSubview:_imageView];
    
    UIImageView* imageView2 = [[UIImageView alloc]init];
    imageView2.image = [UIImage imageNamed:@"xing"];
    imageView2.layer.masksToBounds = YES;
    imageView2.layer.cornerRadius = 10;
    imageView2.frame = CGRectMake(imageX+20, (mainWidth-imageWidth)/2+18, 20, 20);
    [self addSubview:imageView2];
    
    _labelA = [[UILabel alloc]init];
    //    _labelA.frame = CGRectMake(imageX-mainWidth-15, 10, mainWidth, 30);
    _labelA.frame = CGRectMake(0, 10, mainWidth, 30);
    _labelA.textAlignment = NSTextAlignmentRight;
    _labelA.textColor = ZXNColor(29, 137, 206, 1);
    _labelA.font = [UIFont fontWithName:@"AmericanTypewriter-Bold" size:20];
    _labelA.adjustsFontSizeToFitWidth = YES;
    _labelA.alpha = 0;
    
    _labelA.text = @"畅行江苏";
    [self addSubview:_labelA];
    
    _labelB = [[UILabel alloc]init];
    _labelB.frame = CGRectMake(imageX-mainWidth-30-20, 10+30+10, 40, 10);
    _labelB.font = [UIFont fontWithName:@"AmericanTypewriter-Bold" size:20];
    _labelB.adjustsFontSizeToFitWidth = YES;
    _labelB.textColor = ZXNColor(29, 137, 206, 1);
    _labelB.text = @"乐在途中";
    _labelB.alpha = 0;
    [self addSubview:_labelB];
    
    _labelC = [[UILabel alloc]init];
    _labelC.frame = CGRectMake(boundWidth/2+imageWidth/2+15, 20, imageX-30, 30);
    _labelC.textAlignment = NSTextAlignmentCenter;
    _labelC.font = [UIFont fontWithName:@"Helvetica-Bold" size:18];
    _labelC.textColor = [UIColor lightGrayColor];
    _labelC.text = @"正在刷新数据";
    _labelC.adjustsFontSizeToFitWidth = YES;
    [self addSubview:_labelC];
    _labelC.alpha = 0.2;
    
    _labelD = [[UILabel alloc]init];
    _labelD.frame = CGRectMake(boundWidth/2+imageWidth/2+15, 20+30, imageX-30, 20);
    _labelD.textAlignment = NSTextAlignmentCenter;
    _labelD.font = [UIFont fontWithName:@"Helvetica-Bold" size:18];
    _labelD.textColor = [UIColor lightGrayColor];
    _labelD.text =[self getCurrentTime];
    _labelD.adjustsFontSizeToFitWidth = YES;
    _labelD.alpha = 0.2;
    [self addSubview:_labelD];

    
}

- (NSString *)getCurrentTime{
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *dateTime = [formatter stringFromDate:[NSDate date]];
    return dateTime;
}
- (void)setAnomation{
    
    CABasicAnimation* rotationAnimation;
    rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = [NSNumber numberWithFloat: M_PI * 2.0 ];
    rotationAnimation.duration = 0.8;
    rotationAnimation.cumulative = YES;
    rotationAnimation.repeatCount = 20;
    
    [self.imageView.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
    
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:2];
    self.labelB.alpha = 1;
    self.labelA.alpha = 1;
    self.labelC.alpha = 1;
    self.labelD.alpha = 1;
    self.labelB.frame = CGRectMake(imageX-mainWidth-30, 10+30, mainWidth, 30);
    self.labelA.center = CGPointMake(boundWidth/2-60/2-80+35, 25);
    [UIView setAnimationCurve:(UIViewAnimationCurveEaseOut)];
    [UIView commitAnimations];
}
- (void)remove{
    [self removeFromSuperview];
}
@end
