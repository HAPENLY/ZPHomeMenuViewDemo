//
//  ViewController.m
//  ZPHomeMenuViewDemo
//
//  Created by hudong on 16/7/25.
//  Copyright © 2016年 ZPengs. All rights reserved.
//

#import "ViewController.h"
#import "ZPHomeMenuView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    ZPHomeMenuView *menuView = [[ZPHomeMenuView alloc]init];
    menuView.frame = CGRectMake(0, 64, self.view.frame.size.width, 160);
    [self.view addSubview:menuView];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
