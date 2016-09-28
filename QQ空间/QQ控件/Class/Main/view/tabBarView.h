//
//  tabBarView.h
//  QQ控件
//
//  Created by 润朴科技 on 16/9/27.
//  Copyright © 2016年 惠清川. All rights reserved.
//

#import <UIKit/UIKit.h>
@class tabBarView;
@protocol tabBarViewDelegate <NSObject>

@optional
-(void)tabBar:(tabBarView *)tabBar fromeIndex:(NSInteger)frome toIndex:(NSInteger)to;

@end
@interface tabBarView : UIView
@property (nonatomic, weak) id<tabBarViewDelegate> delegate;
-(void)rotateIfLandscape:(BOOL)islandscape;
- (void)unSelected;

@end

@interface tabBarItem : UIButton

@end
