//
//  LookProfileViewController.m
//  ChaozhouTax
//
//  Created by AY on 2017/12/11.
//  Copyright © 2017年 AlexanderYeah. All rights reserved.
//

#import "LookProfileViewController.h"
#import "SKMulitiBarView.h"
#import "SKSingleBarView.h"
#define SCREEN_WIDTH   [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
@interface LookProfileViewController ()


@end

@implementation LookProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
	// 667 * 375
	
	SKMulitiBarView *view = [[SKMulitiBarView alloc]init];
	
	view.frame = CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT * 0.406);
	view.backgroundColor = [UIColor whiteColor];
	
	[self.view addSubview:view];
	
	
	SKSingleBarView *singleView = [[SKSingleBarView alloc]init];
	singleView.frame = CGRectMake(0, 64 + SCREEN_HEIGHT * 0.406 , SCREEN_WIDTH, SCREEN_HEIGHT * 0.406 / 0.844);
	singleView.backgroundColor = [UIColor lightGrayColor];
	[self.view addSubview:singleView];
	
	
}

@end
