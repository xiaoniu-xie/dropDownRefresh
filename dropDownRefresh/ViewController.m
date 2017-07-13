//
//  ViewController.m
//  dropDownRefresh
//
//  Created by 张小牛 on 2017/7/12.
//  Copyright © 2017年 ZXN. All rights reserved.
//
#define boundWidth      [UIScreen mainScreen].bounds.size.width
#define boundHeight     [UIScreen mainScreen].bounds.size.height
#define mainWidth 80
#define ZXNColor(R,G,B,A) [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:A]
#import "ViewController.h"
#import "RefreshView.h" 

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>{
    
    RefreshView *mainView;//下拉刷新的图
    UITableView *table;
    UIView *view_bar;
    UILabel *title_label;
    
}

@end

@implementation ViewController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    table=[[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStyleGrouped];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    table.delegate=self;
    table.dataSource=self;
    table.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:table];
    
    view_bar =[[UIView alloc]init];
    view_bar .frame=CGRectMake(0, 0, self.view.frame.size.width, 44+20);
    view_bar.backgroundColor=[UIColor clearColor];
    
    [self.view addSubview: view_bar];
    title_label=[[UILabel alloc]initWithFrame:CGRectMake(0, 20, boundWidth, 44)];
    title_label.text=@"";
    title_label.font=[UIFont boldSystemFontOfSize:16];
    title_label.backgroundColor=[UIColor clearColor];
    title_label.textColor =[UIColor whiteColor];
    title_label.textAlignment = NSTextAlignmentCenter;
    [view_bar addSubview:title_label];
}

#define mark - 刷新的方法
//判断滚动方向向上还是向下
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    //导航栏滚动
    if(table.contentOffset.y<0) {
        [UIView animateWithDuration:2 animations:^{
            [view_bar setHidden:YES];
        }];
    }
    if(table.contentOffset.y<50){
        //上滑动
        [view_bar setHidden:NO];
        view_bar.backgroundColor = ZXNColor(21, 107, 176, table.contentOffset.y / 1000);
        title_label.text=@"";
    }else{

        [UIView animateWithDuration:2 animations:^{
            [view_bar setHidden:NO];
            view_bar.backgroundColor=ZXNColor(21, 107, 176, 0.9);
            title_label.text=@"畅行江苏";
        }];
    }
    //刷新的方法
    if (-scrollView.contentOffset.y > 0) {
        [view_bar setHidden:YES];
        [mainView setAnomation];
        mainView = [[RefreshView alloc]initWithFrame:CGRectMake(0, -mainWidth, boundWidth, mainWidth)];
        [table addSubview:mainView];
    }

}

//松手的时候
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    CGFloat offset = -scrollView.contentOffset.y;
    
    if (offset >= mainWidth) {
        [UIView animateWithDuration:0.3 animations:^{
            table.contentInset = UIEdgeInsetsMake(mainWidth, 0, 0, 0);
        } completion:^(BOOL finished) {
            [self performSelector:@selector(backToTop) withObject:nil afterDelay:2.5f];
        }];
    }
    
}

//动画结束，删除一切
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    [mainView remove];
}

//跳到顶部的方法
-(void)backToTop{
    [UIView animateWithDuration:0.3 animations:^{
        table.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
    } completion:^(BOOL finished) {
        NSLog(@"刷新的方法");
    }];
    
}
@end
