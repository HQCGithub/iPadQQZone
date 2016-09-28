//
//  DockView.h
//  QQ控件
//
//  Created by 润朴科技 on 16/9/27.
//  Copyright © 2016年 惠清川. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BottomMenuView,tabBarView,IconButtom;

@interface DockView : UIView
    @property (nonatomic, strong, readonly) BottomMenuView *bottomMenu;
    @property (nonatomic, strong, readonly) tabBarView *tabBar;
    @property (nonatomic, strong, readonly) IconButtom *iconButtom;

-(void)rotateIfLandscape:(BOOL)islandscape;
@end
