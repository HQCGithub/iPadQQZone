//
//  BottomMenuView.h
//  QQ控件
//
//  Created by 润朴科技 on 16/9/27.
//  Copyright © 2016年 惠清川. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef enum {
    kbottomItemMood,
    kbottomItemPhoto,
    kbottomItemBlog
}ItemType;
@class BottomMenuView;
@protocol BottomMenuViewDelegate <NSObject>

@optional
-(void)bottomItemClick:(BottomMenuView *)item type:(ItemType)type;

@end
@interface BottomMenuView : UIView

@property (nonatomic, weak) id<BottomMenuViewDelegate> delegate;
-(void)rotateIfLandscape:(BOOL)islandscape;

@end
