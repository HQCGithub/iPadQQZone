//
//  DockView.m
//  QQ控件
//
//  Created by 润朴科技 on 16/9/27.
//  Copyright © 2016年 惠清川. All rights reserved.
//

#import "DockView.h"
#import "BottomMenuView.h"
#import "tabBarView.h"
#import "IconButtom.h"

@interface DockView ()
    
@end
@implementation DockView
-(instancetype)initWithFrame:(CGRect)frame{
    if (self == [super initWithFrame:frame]) {
        //初始化bottomMenu
        [self setupBottomView];
        //添加tabBar
        [self setupTabBarView];
        //添加IconButton
        [self setupIconButton];
    }
    return self ;
}
#pragma mark - 初始化bottomMenu
-(void)setupBottomView{
    _bottomMenu = [[BottomMenuView alloc]init];
    [self addSubview:self.bottomMenu];
    self.bottomMenu.autoresizingMask = UIViewAutoresizingFlexibleTopMargin;
}
#pragma mark - 添加tabBar
-(void)setupTabBarView{
    _tabBar = [[tabBarView alloc]init];
    [self addSubview:self.tabBar];
    self.tabBar.autoresizingMask = UIViewAutoresizingFlexibleTopMargin;
}
#pragma mark - 添加IconButton
-(void)setupIconButton{
     _iconButtom = [[IconButtom alloc]init];
    [self addSubview:self.iconButtom];

}
-(void)rotateIfLandscape:(BOOL)islandscape{
//1.设置本身的width
     self.width = islandscape ? kDockLandscapeWidth : kDockPortraitWidth;
//2.设置bottomMenu的frame
    [self.bottomMenu rotateIfLandscape:islandscape];

//3.设置tabbar的frame
    [self.tabBar rotateIfLandscape:islandscape];
    self.tabBar.y = self.height - self.bottomMenu.height - self.tabBar.height;
//4.设置iconButtom的frame
   [self.iconButtom rotateIfLandscape:islandscape];
}


@end
