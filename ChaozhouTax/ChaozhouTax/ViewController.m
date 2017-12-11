//
//  ViewController.m
//  ChaozhouTax
//
//  Created by AY on 2017/10/12.
//  Copyright © 2017年 AlexanderYeah. All rights reserved.
//

#import "ViewController.h"
#import "LookProfileViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	
	
	
	UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
	[btn setTitle:@"Let's go" forState:UIControlStateNormal];
	[btn setTitleColor:[UIColor cyanColor] forState:UIControlStateNormal];
	[btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
	btn.frame = CGRectMake(150, 120, 100, 50);
	[self.view addSubview:btn];
	
	

}


- (void)btnClick:(UIButton *)btn
{
	LookProfileViewController *lookVC =[[LookProfileViewController alloc]init];
	lookVC.view.backgroundColor = [UIColor whiteColor];
	[self presentViewController:lookVC animated:YES completion:nil];
	
	
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}


@end
