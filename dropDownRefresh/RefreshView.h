//
//  RefreshView.h
//  ceshi zhuanyong
//
//  Created by 张小牛 on 16/7/2.
//  Copyright © 2016年 SuYunTong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RefreshView : UIView

@property (nonatomic,strong) UILabel *labelA;
@property (nonatomic,strong) UILabel *labelB;
@property (nonatomic,strong) UILabel *labelC;
@property (nonatomic,strong) UILabel *labelD;
@property (nonatomic,strong) UIImageView *imageView;

- (void)setAnomation;
- (void)remove;


@end
