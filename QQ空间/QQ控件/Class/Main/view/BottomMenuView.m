//
//  BottomMenuView.m
//  QQ控件
//
//  Created by 润朴科技 on 16/9/27.
//  Copyright © 2016年 惠清川. All rights reserved.
//

#import "BottomMenuView.h"

@implementation BottomMenuView
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        //创建子控件
        [self setupSubItemWithImage:@"tabbar_mood"];
         [self setupSubItemWithImage:@"tabbar_photo"];
         [self setupSubItemWithImage:@"tabbar_blog"];
    }
    return self;
}
-(void)setupSubItemWithImage:(NSString *)imageStr{
    UIButton *btn = [[UIButton alloc]init];
    [btn setImage:[UIImage imageNamed:imageStr] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:@"tabbar_separate_selected_bg"] forState:UIControlStateHighlighted];
    [self addSubview:btn];
}
-(void)rotateIfLandscape:(BOOL)islandscape{
    //1.item的个数
    NSInteger count = [self subviews].count;
    //2.设置本身的frame
    self.width = self.superview.width;
    self.height = islandscape ? kDockItemHeight : kDockItemHeight * count;
    self.y = self.superview.height - self.height;
    //3.设置item的frame
    for (int i = 0; i<count; i++) {
        UIButton *item = self.subviews[i];
        item.width = islandscape ? self.width / count : self.width;
        item.height = kDockItemHeight;
        item.x = islandscape ? item.width * i : 0;
        item.y = islandscape ? 0 : item.height * i;
    }
}

@end
