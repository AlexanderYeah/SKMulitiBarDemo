//
//  SKMulitiBarView.m
//  ChaozhouTax
//
//  Created by AY on 2017/12/11.
//  Copyright © 2017年 AlexanderYeah. All rights reserved.
//

#import "SKMulitiBarView.h"

#define kBarItemPadding 1.5
@implementation SKMulitiBarView

/*
 Only override drawRect: if you perform custom drawing.
 An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
     Drawing code
}
*/


- (instancetype)initWithFrame:(CGRect)frame
{
	if (self = [super initWithFrame:frame]) {
		[self createUI];
	}
	return  self;
}

#pragma mark - 搭建UI
- (void)createUI{
	
	
	
	CGFloat self_height = SCREEN_HEIGHT * 0.406;
	CGFloat self_width = SCREEN_WIDTH;
	
	CGFloat table_height = self_height * 0.5;
	CGFloat table_width = self_width * 0.77;
	
	CGFloat table_left_padding = 0.172 * self_width;
	
	CGFloat first_part_height = 0.18 * self_height;
	CGFloat second_part_height = 0.18 * self_height;
	/**------------MARK: 1 涉地税 Top 10-------------**/
	
	// 1 涉地税图标
	CGFloat localTaxIcon_left_padding = 15;
	CGFloat localTaxIcon_w = 30;
	
	CGFloat localTax_top_padding = (first_part_height - localTaxIcon_w)/2;
	UIImageView *localTaxImgView = [[UIImageView alloc]init];
	localTaxImgView.image = [UIImage imageNamed:@""];
	localTaxImgView.backgroundColor = SKRandomColor;
	localTaxImgView.layer.cornerRadius = localTaxIcon_w / 2;
	localTaxImgView.layer.masksToBounds = YES;
	[self addSubview:localTaxImgView];
	
	
	[localTaxImgView mas_makeConstraints:^(MASConstraintMaker *make) {
		make.width.equalTo(localTaxIcon_w);
		make.height.equalTo(localTaxIcon_w);
		make.left.equalTo(self.mas_left).offset(localTaxIcon_left_padding);
		make.top.equalTo(self.mas_top).offset(localTax_top_padding);
	}];
	
	// 2 lbl
	
	UILabel *taxLbl = [[UILabel alloc]init];
	taxLbl = [[UILabel alloc]init];
	taxLbl.text = @"涉地税TOP 10";
	taxLbl.textColor = kMainColor;
	taxLbl.font = [UIFont systemFontOfSize:18.0f];
	taxLbl.textAlignment = NSTextAlignmentLeft;
	[self addSubview:taxLbl];
	
	[taxLbl mas_makeConstraints:^(MASConstraintMaker *make) {
		make.width.equalTo(SCREEN_WIDTH / 2);
		make.height.equalTo(localTaxIcon_w);
		make.left.equalTo(localTaxImgView.mas_right).offset(15);
		make.centerY.equalTo(localTaxImgView.mas_centerY).offset(0);
	}];
	
	
	/**------------MARK: 2 指示 sample-------------**/
	CGFloat sample_width = 15;
	CGFloat sample_item_padding = (table_width / 4) - sample_width;
	
	CGFloat sample_top_padding = (second_part_height - sample_width)/2;
	NSArray *sampleArr = @[@"已流失",@"滞留中",@"已流转",@"赢单"];
	// for 循环创建四个颜色指示view
	for (int i = 0; i < 4; i ++) {
		// 指示
		UIView *sampleView = [[UIView alloc]init];
		sampleView.layer.cornerRadius = sample_width/2;
		sampleView.layer.masksToBounds= YES;
		[self addSubview:sampleView];
		
		[sampleView mas_makeConstraints:^(MASConstraintMaker *make) {
			make.width.equalTo(sample_width);
			make.height.equalTo(sample_width);
			make.left.equalTo(localTaxImgView.mas_right).offset((sample_item_padding + sample_width + 5) * i + 12);
			make.top.equalTo(taxLbl.mas_bottom).offset(sample_top_padding + localTax_top_padding);
		}];
		
		
// color
switch (i) {
  case 0:
    sampleView.backgroundColor = [UIColor colorWithRed:91/255.0f green:177/255.0f blue:149/255.0f alpha:1];
    break;
  case 1:
    sampleView.backgroundColor = [UIColor colorWithRed:20/255.0f green:149/255.0f blue:249/255.0f alpha:1];
    break;
	
  case 2:
    sampleView.backgroundColor = [UIColor colorWithRed:13/255.0f green:104/255.0f blue:212/255.0f alpha:1];
    break;
  case 3:
    sampleView.backgroundColor = [UIColor colorWithRed:29/255.0f green:191/255.0f blue:41/255.0f alpha:1];
    break;
  default:
    break;
}

		
		// 名字
		
		UILabel *sampleLbl = [[UILabel alloc]init];
		sampleLbl = [[UILabel alloc]init];
		sampleLbl.text = sampleArr[i];
		sampleLbl.textColor = [UIColor blackColor];
		sampleLbl.font = [UIFont systemFontOfSize:14.0f];
		sampleLbl.textAlignment = NSTextAlignmentLeft;
		[self addSubview:sampleLbl];
	
		[sampleLbl mas_makeConstraints:^(MASConstraintMaker *make) {
			make.width.equalTo(sample_item_padding);
			make.height.equalTo(sample_width);
			make.left.equalTo(sampleView.mas_right).offset(5);
			make.centerY.equalTo(sampleView.mas_centerY).offset(0);
		}];

	}
	
	
	/**------------MARK: 3 表格-------------**/
	
	CGFloat bar_item_padding = 5;
	CGFloat bar_item_width = (table_width - 9 * bar_item_padding) / 10;
	
	SKLog(@"bar_item_width---%f",bar_item_width);
	
	
	// x 轴
	
	UIView *xAxisLineView = [[UIView alloc]init];
	xAxisLineView.backgroundColor = [UIColor blackColor];
	[self addSubview:xAxisLineView];
	
	[xAxisLineView mas_makeConstraints:^(MASConstraintMaker *make) {
		make.width.equalTo(table_width);
		make.height.equalTo(1);
		make.left.equalTo(self.mas_left).offset(table_left_padding);
		make.top.equalTo(self.mas_top).offset(first_part_height + second_part_height + table_height);
	}];
	
	// y 轴
	
	UIView *yAxisLineView = [[UIView alloc]init];
	yAxisLineView.backgroundColor = [UIColor blackColor];
	[self addSubview:yAxisLineView];
	
	
	[yAxisLineView mas_makeConstraints:^(MASConstraintMaker *make) {
		make.width.equalTo(1);
		make.height.equalTo(table_height);
		make.left.equalTo(self.mas_left).offset(table_left_padding);
		make.top.equalTo(self.mas_top).offset(first_part_height + second_part_height);
	}];
	
	// y 轴 刻度
	
	CGFloat scaleLbl_w = 30;
	CGFloat scaleLbl_h = 12;
	CGFloat scale_item_padding = table_height / 2 - scaleLbl_h/2;
	
	NSArray *yScaleArr = @[@"0",@"10",@"20"];
	for (int i = 0; i < yScaleArr.count; i++) {
	
		UILabel *yScaleLbl = [[UILabel alloc]init];
		yScaleLbl.text = yScaleArr[i];
		yScaleLbl.textColor = [UIColor blackColor];
		yScaleLbl.font = [UIFont systemFontOfSize:15.0f];
		yScaleLbl.textAlignment = NSTextAlignmentRight;
		
		[self addSubview:yScaleLbl];

		[yScaleLbl mas_makeConstraints:^(MASConstraintMaker *make) {
			make.width.equalTo(scaleLbl_w);
			make.height.equalTo(scaleLbl_h);
			make.right.equalTo(yAxisLineView.mas_left).offset(-5);
			make.bottom.equalTo(xAxisLineView.mas_top).offset(- (scale_item_padding) * i);
		}];
		
	}
	
	
	// 有一个总的对比的高度 应该是最大的值,其余的值以此
	CGFloat maxValue = 30;
	
	NSArray *contentArr = @[@[@{@"type":@"1",@"value":@"10"},@{@"type":@"0",@"value":@"5"},@{@"type":@"2",@"value":@"5"},@{@"type":@"3",@"value":@"5"}],@[@{@"type":@"2",@"value":@"18"},@{@"type":@"3",@"value":@"3"}],@[@{@"type":@"2",@"value":@"12"},@{@"type":@"3",@"value":@"5"}],@[@{@"type":@"2",@"value":@"11"},@{@"type":@"0",@"value":@"6"}],@[@{@"type":@"0",@"value":@"12"},@{@"type":@"3",@"value":@"2"}],@[@{@"type":@"0",@"value":@"6"},@{@"type":@"2",@"value":@"10"},@{@"type":@"1",@"value":@"2"},@{@"type":@"3",@"value":@"8"}],@[@{@"type":@"2",@"value":@"9"},@{@"type":@"1",@"value":@"4"}],@[@{@"type":@"3",@"value":@"11"},@{@"type":@"3",@"value":@"9"}],@[@{@"type":@"1",@"value":@"7"},@{@"type":@"0",@"value":@"6"}],@[@{@"type":@"3",@"value":@"6"},@{@"type":@"2",@"value":@"2"}]];
	
	// 第一层循环 循环出每一个bar 的数据
	for (int i = 0; i < contentArr.count; i ++) {
		// 第二层循环 创建每一个bar 中的控件
		NSArray *itemArr = contentArr[i];
		// 每条条形图的底部高度
		CGFloat bar_bottom_padding = 0;
		// Bar 的总共value 值
		CGFloat bar_total_value = 0;
		for (int j = 0; j < itemArr.count; j ++) {
			// UILable 创建
			
			// 根据 i 来 确定 x 的值 ，根据 j 来 确定 y 的值
			
			// 取出对应的value 算出高度,必上Top 10 中最大的值,算出比率 再去乘以 table_height
			
			NSString *value = itemArr[j][@"value"];
			CGFloat ratio_height = [value floatValue] / maxValue;
			
			CGFloat bar_height = ratio_height * table_height;
			bar_bottom_padding = bar_bottom_padding + bar_height;
			
			SKLog(@"bar_bottom_padding---%f",bar_bottom_padding);
			CGFloat	temp_height = 0;
			if (j == 0) {
				temp_height = bar_bottom_padding;
			}else{
				temp_height = bar_bottom_padding;
			}
			UILabel *barLbl = [[UILabel alloc]init];
			barLbl.backgroundColor = [self getColorWithType:itemArr[j][@"type"]];
			[self addSubview:barLbl];
			
			[barLbl mas_makeConstraints:^(MASConstraintMaker *make) {
				make.width.equalTo(bar_item_width);
				make.height.equalTo(bar_height);
				make.left.equalTo(yAxisLineView.mas_left).offset(1 + (bar_item_padding + bar_item_width) * i);
				make.top.equalTo(xAxisLineView.mas_top).offset(- bar_bottom_padding - j * kBarItemPadding);
			}];
			bar_total_value = bar_total_value + [itemArr[j][@"value"] floatValue];
			if (j == itemArr.count - 1) {
				// 每一个bar 头顶上显示一个总的数值
				UILabel *totalValueLbl = [[UILabel alloc]init];
				totalValueLbl.textAlignment = NSTextAlignmentCenter;
				totalValueLbl.font = [UIFont systemFontOfSize:10.0f];
				totalValueLbl.text = [NSString stringWithFormat:@"%.0f",bar_total_value];
				[self addSubview:totalValueLbl];
			
				[totalValueLbl mas_makeConstraints:^(MASConstraintMaker *make) {
					make.width.equalTo(bar_item_width);
					make.height.equalTo(15);
					make.left.equalTo(yAxisLineView.mas_left).offset(1 + (bar_item_padding + bar_item_width) * i);
					make.top.equalTo(barLbl.mas_top).offset(- 20 + kBarItemPadding);
				}];
			
			}
			
		}
		
	}
	
	/**------------MARK: 4 显示点击地区 Lbl -------------**/
	
}



#pragma mark - 根据type 类型 返回对应不同的颜色
- (UIColor *)getColorWithType:(NSString *)type
{
	NSInteger idx = [type integerValue];

	switch (idx) {
  case 0:
    return  [UIColor colorWithRed:91/255.0f green:177/255.0f blue:149/255.0f alpha:1];
    break;
  case 1:
    return[UIColor colorWithRed:20/255.0f green:149/255.0f blue:249/255.0f alpha:1];
    break;
	
  case 2:
    return [UIColor colorWithRed:13/255.0f green:104/255.0f blue:212/255.0f alpha:1];
    break;
  case 3:
    return [UIColor colorWithRed:29/255.0f green:191/255.0f blue:41/255.0f alpha:1];
    break;

	default:
		break;
	}

	return nil;
}





@end
