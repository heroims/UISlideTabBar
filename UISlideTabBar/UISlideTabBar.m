//
//  UISlideTabBar.m
//  xiguateng
//
//  Created by apple on 12-10-14.
//  Copyright (c) 2012年 apple. All rights reserved.
//

#import "UISlideTabBar.h"

@implementation UISlideTabBar

-(void)dealloc{
    [_SelectImageV release];
    
    [super dealloc];
}

-(void)subBtnClick:(id)sender{
    NSInteger tag=((UIButton*)sender).tag%100;
    
    if (_SelectImageV.frame.size.width*tag==_SelectImageV.frame.origin.x) {
        return;
    }
    
    [UIView beginAnimations:@"anim" context:nil];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(endAnimation)];
    [UIView setAnimationDuration:0.3];
    _SelectImageV.frame=CGRectMake(_SelectImageV.frame.size.width*tag, 0, _SelectImageV.frame.size.width, _SelectImageV.frame.size.height);
    [UIView commitAnimations];
   
    [_delegate selectSlideTabBarChange:tag];
}

-(void)setSelectBtn:(NSInteger)index{
    
    if (_SelectImageV.frame.size.width*index==_SelectImageV.frame.origin.x) {
        return;
    }
    
    [UIView beginAnimations:@"anim" context:nil];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDuration:0.3];
    _SelectImageV.frame=CGRectMake(_SelectImageV.frame.size.width*index, 0, _SelectImageV.frame.size.width, _SelectImageV.frame.size.height);
    [UIView commitAnimations];

}
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(id)initWithFrame:(CGRect)frame titleArr:(NSArray*)titleArr titleColor:(UIColor*)titleColor selectImage:(UIImage*)selectImage font:(UIFont*)font
{
    self = [super initWithFrame:frame];
    if (self) {
        NSInteger barCount=[titleArr count];
        float btnWidth=self.frame.size.width/barCount;
        
        _SelectImageV=[[UIImageView alloc] initWithImage:selectImage];
        _SelectImageV.frame=CGRectMake(0, 0, btnWidth, self.frame.size.height);
        [self addSubview:_SelectImageV];
        
        for (int i=0; i<barCount; i++) {
            UIButton *subBtn=[UIButton buttonWithType:UIButtonTypeCustom];
            [subBtn setTitle:titleArr[i] forState:UIControlStateNormal];
            subBtn.tag=100+i;
            subBtn.titleLabel.font=font;
            [subBtn setTitleColor:titleColor forState:UIControlStateNormal];
            [subBtn addTarget:self action:@selector(subBtnClick:) forControlEvents:UIControlEventTouchUpInside];
            subBtn.frame=CGRectMake(self.frame.size.width/barCount*i, 0, btnWidth, self.frame.size.height);
            [self addSubview:subBtn];
        }
        // Initialization code
    }
    return self;
}

-(id)initWithFrame:(CGRect)frame titleArr:(NSArray*)titleArr titleColor:(UIColor*)titleColor selectImage:(UIImage*)selectImage selectIndexDefault:(NSInteger)selectIndexDefault
{
    self = [super initWithFrame:frame];
    if (self) {
        NSInteger barCount=[titleArr count];
        float btnWidth=self.frame.size.width/barCount;
        
        _SelectImageV=[[UIImageView alloc] initWithImage:selectImage];
        _SelectImageV.frame=CGRectMake(self.frame.size.width/barCount*selectIndexDefault, 0, btnWidth, self.frame.size.height);
        
        [self addSubview:_SelectImageV];
        
        for (int i=0; i<barCount; i++) {
            UIButton *subBtn=[UIButton buttonWithType:UIButtonTypeCustom];
            [subBtn setTitle:titleArr[i] forState:UIControlStateNormal];
            subBtn.tag=100+i;
            [subBtn setTitleColor:titleColor forState:UIControlStateNormal];
            [subBtn addTarget:self action:@selector(subBtnClick:) forControlEvents:UIControlEventTouchUpInside];
            subBtn.frame=CGRectMake(self.frame.size.width/barCount*i, 0, btnWidth, self.frame.size.height);
            [self addSubview:subBtn];
        }
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
