//
//  IconButtom.m
//  QQ控件
//
//  Created by 润朴科技 on 16/9/27.
//  Copyright © 2016年 惠清川. All rights reserved.
//

#import "IconButtom.h"

@implementation IconButtom
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setImage:[UIImage imageNamed:@"Easy"] forState:UIControlStateNormal];
        [self setTitle:@"百醇->牛奶味" forState:UIControlStateNormal];
        self.titleLabel.font = [UIFont systemFontOfSize:14];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return self;
}

-(void)rotateIfLandscape:(BOOL)islandscape{
    self.width = islandscape ? kIconButtonLandscapeWidth : kIconButtonPortraitWH;
    self.height = islandscape ? kIconButtonLandscapeHeight : kIconButtonPortraitWH;
    self.y = kIconButtonY;
    self.x = (self.superview.width - self.width) * 0.5;
}
-(void)setHighlighted:(BOOL)highlighted{

}
-(CGRect)imageRectForContentRect:(CGRect)contentRect{
    if (self.width == self.height) {//竖屏
        CGFloat width = self.width;
        CGFloat height = self.height;
        CGFloat x = 0 ;
        CGFloat y = 0 ;
        return CGRectMake(x, y, width, height);
    }else{//横屏
        CGFloat width = self.width;
        CGFloat height = width;
        CGFloat x = 0 ;
        CGFloat y = 0 ;
        return CGRectMake(x, y, width, height);
    }
    
}
-(CGRect)titleRectForContentRect:(CGRect)contentRect{
    if (self.width == self.height) {//竖屏
        return CGRectMake(0, 0, -1, -1);
    }else{//横屏
        CGFloat width = self.width;
        CGFloat height = self.height - width;
        CGFloat x = 0 ;
        CGFloat y = width ;
        return CGRectMake(x, y, width, height);
    }
}
@end
