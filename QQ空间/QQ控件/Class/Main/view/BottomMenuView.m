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
        [self setupSubItemWithImage:@"tabbar_mood" type:kbottomItemMood];
         [self setupSubItemWithImage:@"tabbar_photo" type:kbottomItemPhoto];
         [self setupSubItemWithImage:@"tabbar_blog" type:kbottomItemBlog];
    }
    return self;
}
-(void)setupSubItemWithImage:(NSString *)imageStr type:(ItemType)type{
    UIButton *btn = [[UIButton alloc]init];
    [btn setImage:[UIImage imageNamed:imageStr] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:@"tabbar_separate_selected_bg"] forState:UIControlStateHighlighted];
    btn.tag = type;
    [btn addTarget:self action:@selector(itemClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:btn];
}
-(void)itemClick:(UIButton *)sender{
    if ([self.delegate respondsToSelector:@selector(bottomItemClick: type:)]) {
        [self.delegate bottomItemClick:self type:(int)sender.tag];
    }
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
