//
//  MainVC.m
//  QQ控件
//
//  Created by 润朴科技 on 16/9/27.
//  Copyright © 2016年 惠清川. All rights reserved.
//

#import "MainVC.h"
#import "DockView.h"

@interface MainVC ()
    @property (nonatomic, strong) DockView *dock;
@end

@implementation MainVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //设置背景色
    self.view.backgroundColor = [UIColor colorWithRed:55.0/255 green:55.0/255 blue:55.0/255 alpha:1.0];
    //添加dockView
    [self setupDockView];
    
}
-(void)setupDockView{
    self.dock = [[DockView alloc]init];
    self.dock.backgroundColor = [UIColor redColor];
    BOOL islandscape = self.view.width == kLandscapeWidth;
    self.dock.height = self.view.height;
    self.dock.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:self.dock];
    
    [self.dock rotateIfLandscape:islandscape];
}

-(void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator{
    BOOL islandscape = size.width == kLandscapeWidth;
    CGFloat duration = [coordinator transitionDuration];
    [UIView animateWithDuration:duration animations:^{
        [self.dock rotateIfLandscape:islandscape];
    }];
    
}
@end
