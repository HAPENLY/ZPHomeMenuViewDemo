//
//  ZPHomeMenuView.m
//  DongFangZhiUser
//
//  Created by hudong on 16/7/23.
//  Copyright © 2016年 ZPengs. All rights reserved.
//

#import "ZPHomeMenuView.h"
#import "ZPHomeMenuBtnFrame.h"
/**
 *  设定每行有多少个Btn
 */
#define BtnNum 5
#define ZPUI_SCREEN_WIDTH [[UIScreen mainScreen] bounds].size.width
@interface ZPHomeMenuView ()<UIScrollViewDelegate>
{
    UIView *_backView1;
    UIView *_backView2;
    UIPageControl *_pageControl;
}
/**Title*/
@property (strong, nonatomic) NSArray *TitleArray;
/**Image*/
@property (strong, nonatomic) NSArray *ImageArray;
@end
@implementation ZPHomeMenuView
-(instancetype)initWithFrame:(CGRect)frame{
//    这些其实应该是后台返回来的，我们后台没有只好手写了蛋疼
    _TitleArray = @[@"到店洗车",@"新车贷款",@"维修保养",@"违章查询",@"驾校报名",@"精品商城",@"低价购车",@"商家联盟",@"保险办理",@"积分商城",@"KTV",@"健身",@"酒店",@"旅游",@"美食"];
    _ImageArray = @[@"xiche",@"daikuan",@"baoyang",@"weizhang",@"jiaxiao",@"shangcheng",@"dijia",@"lianmeng",@"baoxian",@"jifen",@"ktv",@"jianshen",@"hotel",@"travel",@"food"];
    if (self =[super initWithFrame:frame]) {
        _backView1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ZPUI_SCREEN_WIDTH, 160)];
        _backView2 = [[UIView alloc] initWithFrame:CGRectMake(ZPUI_SCREEN_WIDTH, 0, ZPUI_SCREEN_WIDTH, 160)];
        UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, ZPUI_SCREEN_WIDTH, 180)];
        scrollView.contentSize = CGSizeMake(2*ZPUI_SCREEN_WIDTH, 180);
        scrollView.pagingEnabled = YES;
        scrollView.delegate = self;
        scrollView.showsHorizontalScrollIndicator = NO;
        [scrollView addSubview:_backView1];
        [scrollView addSubview:_backView2];
        [self addSubview:scrollView];
            //创建20个
            for (int i = 0; i < 20; i++) {
                if (i < BtnNum) {
                    CGRect frame = CGRectMake(i*ZPUI_SCREEN_WIDTH/BtnNum, 0, ZPUI_SCREEN_WIDTH/BtnNum, 80);
                    NSString *title = _TitleArray[i] ;
                    NSString *imageStr = _ImageArray[i];
                    ZPHomeMenuBtnFrame *btnView = [[ZPHomeMenuBtnFrame alloc] initWithFrame:frame title:title imageStr:imageStr];
                    btnView.tag = 10+i;
                    [_backView1 addSubview:btnView];
                    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(OnTapBtnView:)];
                    [btnView addGestureRecognizer:tap];
                    
                }else if(i<(2*BtnNum)){
                    CGRect frame = CGRectMake((i-BtnNum)*ZPUI_SCREEN_WIDTH/BtnNum, 80, ZPUI_SCREEN_WIDTH/BtnNum, 80);
                    NSString *title = _TitleArray[i] ;
                    NSString *imageStr = _ImageArray[i];
                    ZPHomeMenuBtnFrame *btnView = [[ZPHomeMenuBtnFrame alloc] initWithFrame:frame title:title imageStr:imageStr];
                    btnView.tag = 10+i;
                    [_backView1 addSubview:btnView];
                    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(OnTapBtnView:)];
                    [btnView addGestureRecognizer:tap];
                }else if(i < (3*BtnNum)){
                    CGRect frame = CGRectMake((i-(2*BtnNum))*ZPUI_SCREEN_WIDTH/BtnNum, 0, ZPUI_SCREEN_WIDTH/BtnNum, 80);
                    NSString *title = _TitleArray[i] ;
                    NSString *imageStr = _ImageArray[i];
                    ZPHomeMenuBtnFrame *btnView = [[ZPHomeMenuBtnFrame alloc] initWithFrame:frame title:title imageStr:imageStr];
                    btnView.tag = 10+i;
                    [_backView2 addSubview:btnView];
                    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(OnTapBtnView:)];
                    [btnView addGestureRecognizer:tap];
                }else if(i < (4*BtnNum)&&_TitleArray.count>(4*BtnNum)&&_ImageArray.count>(4*BtnNum)){
                    CGRect frame = CGRectMake((i-(3*BtnNum))*ZPUI_SCREEN_WIDTH/BtnNum, 80, ZPUI_SCREEN_WIDTH/BtnNum, 80);
                    NSString *title = _TitleArray[i] ;
                    NSString *imageStr = _ImageArray[i];
                    ZPHomeMenuBtnFrame *btnView = [[ZPHomeMenuBtnFrame alloc] initWithFrame:frame title:title imageStr:imageStr];
                    btnView.tag = 10+i;
                    [_backView2 addSubview:btnView];
                    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(OnTapBtnView:)];
                    [btnView addGestureRecognizer:tap];
                }
            _pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(ZPUI_SCREEN_WIDTH/4-80, 160, 0, 20)];
            _pageControl.currentPage = 0;
            _pageControl.numberOfPages = 2;
            [self addSubview:_pageControl];
            [_pageControl setCurrentPageIndicatorTintColor:[UIColor colorWithRed:0.9328 green:0.873 blue:0.4881 alpha:1.0]];
            [_pageControl setPageIndicatorTintColor:[UIColor grayColor]];
        }
    }
    return self;
}
-(void)OnTapBtnView:(UITapGestureRecognizer *)sender{
    NSLog(@"tag:%d",sender.view.tag);
}
#pragma mark - UIScrollViewDelegate
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat scrollViewW = scrollView.frame.size.width;
    CGFloat x = scrollView.contentOffset.x;
    int page = (x + scrollViewW/2)/scrollViewW;
    _pageControl.currentPage = page;
}

@end
