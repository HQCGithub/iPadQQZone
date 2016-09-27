//
//  IconButtom.m
//  QQ控件
//
//  Created by 润朴科技 on 16/9/27.
//  Copyright © 2016年 惠清川. All rights reserved.
//

#import "IconButtom.h"

@implementation IconButtom

-(void)rotateIfLandscape:(BOOL)islandscape{
    self.width = islandscape ? kIconButtonLandscapeWidth : kIconButtonPortraitWH;
    self.height = islandscape ? kIconButtonLandscapeHeight : kIconButtonPortraitWH;
    self.y = kIconButtonY;
    self.x = (self.superview.width - self.width) * 0.5;

}
@end
