//
//  tabBarView.m
//  QQ控件
//
//  Created by 润朴科技 on 16/9/27.
//  Copyright © 2016年 惠清川. All rights reserved.
//

#import "tabBarView.h"

@implementation tabBarView

-(void)rotateIfLandscape:(BOOL)islandscape{
    self.width = self.superview.width;
    self.height = kDockItemHeight * 6;
}


@end
