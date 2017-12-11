//
//  SKSingleBarView.m
//  ChaozhouTax
//
//  Created by Alexander on 2017/12/11.
//  Copyright © 2017年 AlexanderYeah. All rights reserved.
//

#import "SKSingleBarView.h"

@implementation SKSingleBarView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame
{
	if (self = [super initWithFrame:frame]) {
		[self createUI];
	}
	
	return self;
}

#pragma mark -  搭建UI
- (void)createUI
{
	CGFloat self_height = SCREEN_HEIGHT * 0.406 / 0.844;
	CGFloat self_width = SCREEN_WIDTH;
	
	CGFloat table_height = 0.57 * self_height;
	CGFloat table_width = self_width * 0.77;
	
	CGFloat first_part_height = 0.18 * self_height;
	CGFloat second_part_height = 0.18 * self_height;
	CGFloat table_left_padding = 0.172 * self_width;
	/**------------MARK: 1 地区对比 Top 10-------------**/
	
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
	taxLbl.text = @"地区对比";
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
	CGFloat sampleView_width = table_width/5;
	CGFloat sampleView_height = 18;
	CGFloat sampleLbl_item_padding = (table_width / 4) - sampleView_width;
	
	CGFloat sample_top_padding = (second_part_height - sampleView_width)/2;
	NSArray *sampleArr = @[@"AA排行",@"BB排行"];
	
	// for 循环创建四个颜色指示view
	for (int i = 0; i < sampleArr.count; i ++) {
		// 指示
		UIView *sampleView = [[UIView alloc]init];
		sampleView.layer.cornerRadius = sampleView_width/2;
		sampleView.layer.masksToBounds= YES;
		[self addSubview:sampleView];
		CGFloat sampleLbl_left_padding = 0;
		[sampleView mas_makeConstraints:^(MASConstraintMaker *make) {
			make.width.equalTo(sampleView_width);
			make.height.equalTo(sampleView_height);
			make.left.equalTo(self.mas_left).offset(table_left_padding + sampleLbl_left_padding);
			make.top.equalTo(taxLbl.mas_bottom).offset(sample_top_padding + localTax_top_padding);
		}];
		
	}

}

@end
