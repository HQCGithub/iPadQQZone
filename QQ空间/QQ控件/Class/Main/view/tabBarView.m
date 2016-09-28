//
//  tabBarView.m
//  QQ控件
//
//  Created by 润朴科技 on 16/9/27.
//  Copyright © 2016年 惠清川. All rights reserved.
//

#import "tabBarView.h"
const CGFloat kRatio = 0.4;

@interface tabBarView ()
@property (nonatomic, strong) tabBarItem *selectedItem;
@end
@implementation tabBarView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setupTabBarItemWithImageName:@"tab_bar_feed_icon" title:@"全部动态"];
        [self setupTabBarItemWithImageName:@"tab_bar_passive_feed_icon" title:@"与我相关"];
        [self setupTabBarItemWithImageName:@"tab_bar_pic_wall_icon" title:@"照片墙"];
        [self setupTabBarItemWithImageName:@"tab_bar_e_album_icon" title:@"电子相框"];
        [self setupTabBarItemWithImageName:@"tab_bar_friend_icon" title:@"好友"];
        [self setupTabBarItemWithImageName:@"tab_bar_e_more_icon" title:@"更多"];

    }
    return self;
}
-(void)setupTabBarItemWithImageName:(NSString *)imageName title:(NSString *)title{
    tabBarItem *item = [tabBarItem buttonWithType:UIButtonTypeCustom];
    [item setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [item setTitle:title forState:UIControlStateNormal];
    [item setBackgroundImage:[UIImage imageNamed:@"tabbar_separate_selected_bg"] forState:UIControlStateSelected];
    
    [item addTarget:self action:@selector(itemClick:) forControlEvents:UIControlEventTouchDown];
    
    // 绑定tag
    item.tag = self.subviews.count;
    [self addSubview:item];
}
// 监听item的点击
- (void)itemClick:(tabBarItem *)item
{
    if ([self.delegate respondsToSelector:@selector(tabBar: fromeIndex:toIndex:)]) {
        [self.delegate tabBar:self fromeIndex:self.selectedItem.tag toIndex:item.tag];
    }
    
    // 1.选中三部曲
    self.selectedItem.selected = NO;
    self.selectedItem = item;
    self.selectedItem.selected = YES;
}
-(void)rotateIfLandscape:(BOOL)islandscape{
    //0.获取子控件的个数
    NSInteger count = [self subviews].count;
    //1.设置本身的frame
    self.width = self.superview.width;
    self.height = kDockItemHeight * count;
    //3.设置子控件的frame
    for (int i = 0; i < count; i++) {
        UIButton *item = self.subviews[i];
        item.width = self.superview.width;
        item.height = kDockItemHeight;
        item.y = item.height * i;
    }
}

#pragma mark - 让SelectItem变成不选中
- (void)unSelected
{
    self.selectedItem.selected = NO;
}

@end
@implementation tabBarItem
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.imageView.contentMode = UIViewContentModeCenter;
    }
    return self;
}
-(void)setHighlighted:(BOOL)highlighted{

}
-(CGRect)imageRectForContentRect:(CGRect)contentRect{
    if (self.width == self.height) { // 竖屏
        return self.bounds;
    } else { // 横屏
        CGFloat width = self.width * kRatio;
        CGFloat height = self.height;
        CGFloat x = 0;
        CGFloat y = 0;
        return CGRectMake(x, y, width, height);
    }
    
}
-(CGRect)titleRectForContentRect:(CGRect)contentRect{
    if (self.width == self.height) { // 竖屏
        return CGRectMake(0, 0, -1, -1);
    } else { // 横屏
        CGFloat width = self.width * (1 - kRatio);
        CGFloat height = self.height;
        CGFloat x = self.width * kRatio;
        CGFloat y = 0;
        return CGRectMake(x, y, width, height);
    }
}
@end
