//
//  MainVC.m
//  QQ控件
//
//  Created by 润朴科技 on 16/9/27.
//  Copyright © 2016年 惠清川. All rights reserved.
//

#import "MainVC.h"
#import "DockView.h"
#import "BottomMenuView.h"
#import "tabBarView.h"
#import "IconButtom.h"
#import "MoodVC.h"
#import "AllStatusViewController.h"

@interface MainVC ()<BottomMenuViewDelegate,tabBarViewDelegate>
    @property (nonatomic, strong) DockView *dock;
    /* 内容的View */
    @property (nonatomic, weak) UIView *contentView;

    /** 当前控制器的下标 */
    @property (nonatomic, assign) NSInteger currentIndex;

@end

@implementation MainVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //设置背景色
    self.view.backgroundColor = [UIColor colorWithRed:55.0/255 green:55.0/255 blue:55.0/255 alpha:1.0];
    //添加dockView
    [self setupDockView];
    
    // 3.初始化控制器
    [self setupControllers];
    
    // 4.初始化内容的View
    [self setupContentView];
    
    // 5.默认选中的控制器
    [self iconButtonClick];
    
}
/**
 *  初始化内容的View
 */
- (void)setupContentView
{
    UIView *contentView = [[UIView alloc] init];
    contentView.width = kContentViewWidth;
    contentView.height = self.view.height - 20;
    contentView.x = self.dock.width;
    contentView.y = 20;
    contentView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:contentView];
    self.contentView = contentView;
}

/**
 *  初始化六个控制器
 */
- (void)setupControllers
{
    AllStatusViewController *vc1 = [[AllStatusViewController alloc] init];
    [self packNav:vc1];
    
    UIViewController *vc2 = [[UIViewController alloc] init];
    vc2.view.backgroundColor = [UIColor blackColor];
    [self packNav:vc2];
    
    UIViewController *vc3 = [[UIViewController alloc] init];
    vc3.view.backgroundColor = [UIColor purpleColor];
    [self packNav:vc3];
    
    UIViewController *vc4 = [[UIViewController alloc] init];
    vc4.view.backgroundColor = [UIColor orangeColor];
    [self packNav:vc4];
    
    UIViewController *vc5 = [[UIViewController alloc] init];
    vc5.view.backgroundColor = [UIColor yellowColor];
    [self packNav:vc5];
    
    UIViewController *vc6 = [[UIViewController alloc] init];
    vc6.view.backgroundColor = [UIColor greenColor];
    [self packNav:vc6];
    
    UIViewController *vc7 = [[UIViewController alloc] init];
    vc7.title = @"个人中心";
    vc7.view.backgroundColor = [UIColor lightGrayColor];
    [self packNav:vc7];
}

/**
 *  抽出一个包装导航控制器的方法,并且将他加入到我们的ChildViewControllers里面
 */
- (void)packNav:(UIViewController *)vc
{
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    [self addChildViewController:nav];
}

#pragma mark - 初始化dock界面
-(void)setupDockView{
    //初始化dock
    self.dock = [[DockView alloc]init];
    //设置dock的frame
    BOOL islandscape = self.view.width == kLandscapeWidth;
    self.dock.height = self.view.height;
    self.dock.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:self.dock];
    //传递横竖屏
    [self.dock rotateIfLandscape:islandscape];
    //遵循底部控件的协议
    self.dock.bottomMenu.delegate = self;
    //遵循tabbarView的协议
    self.dock.tabBar.delegate = self;
    // 5.监听IconButton的点击
    [self.dock.iconButtom addTarget:self action:@selector(iconButtonClick) forControlEvents:UIControlEventTouchUpInside];
}
#pragma mark - 屏幕尺寸将要改变调用的方法
-(void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator{
    BOOL islandscape = size.width == kLandscapeWidth;
    CGFloat duration = [coordinator transitionDuration];
    [UIView animateWithDuration:duration animations:^{
        [self.dock rotateIfLandscape:islandscape];
    }];
    
}
#pragma mark - 实现底部按钮的协议方法
-(void)bottomItemClick:(BottomMenuView *)item type:(ItemType)type{
    if (type == kbottomItemMood) {
        NSLog(@"点击了发表心情的方法");
        MoodVC *mood = [[MoodVC alloc]init];
        UINavigationController *moodNav = [[UINavigationController alloc]initWithRootViewController:mood];
        //modal出的样式
        moodNav.modalPresentationStyle = UIModalPresentationFormSheet;
        //modal的效果
        moodNav.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
        [self presentViewController:moodNav animated:YES completion:nil];
    }else if (type == kbottomItemPhoto){
        NSLog(@"点击了发表照片的方法");
    }else if (type == kbottomItemBlog){
        NSLog(@"点击了发表日志的方法");
    }
}
#pragma mark - 实现tabbar的协议方法
-(void)tabBar:(tabBarView *)tabBar fromeIndex:(NSInteger)frome toIndex:(NSInteger)to{
    NSLog(@"frome->%ld to->%ld",frome,to);
    // 1.取出旧控制器的View,移除掉
    UIViewController *oldVc = self.childViewControllers[frome];
    [oldVc.view removeFromSuperview];
    
    // 2.取出新的控制器的View,添加到self.view(控制器的View的autoresizing属性,默认情况是宽度和高度随着父控件拉伸而拉伸)
    UIViewController *newVc = self.childViewControllers[to];
    newVc.view.frame = self.contentView.bounds;
    [self.contentView addSubview:newVc.view];
    
    // 3.记录当前下标
    self.currentIndex = to;
}

#pragma mark - 监听IconButton的点击
- (void)iconButtonClick
{
    [self tabBar:nil fromeIndex:self.currentIndex toIndex:self.childViewControllers.count - 1];
    [self.dock.tabBar unSelected];
}

@end
