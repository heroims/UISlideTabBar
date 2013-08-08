//
//  UISlideTabBar.h
//  xiguateng
//
//  Created by apple on 12-10-14.
//  Copyright (c) 2012年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol UISlideTabBarDelegate

@required
-(void)selectSlideTabBarChange:(NSInteger)index;

@end

@interface UISlideTabBar : UIView

@property(nonatomic,strong)id<UISlideTabBarDelegate> delegate;
@property(nonatomic,retain)UIImageView *SelectImageV;

-(id)initWithFrame:(CGRect)frame titleArr:(NSArray*)titleArr titleColor:(UIColor*)titleColor selectImage:(UIImage*)selectImage font:(UIFont*)font;
-(id)initWithFrame:(CGRect)frame titleArr:(NSArray*)titleArr titleColor:(UIColor*)titleColor selectImage:(UIImage*)selectImage selectIndexDefault:(NSInteger)selectIndexDefault;
-(void)setSelectBtn:(NSInteger)index;

@end
