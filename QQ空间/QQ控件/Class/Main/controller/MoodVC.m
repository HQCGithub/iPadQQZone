//
//  MoodVC.m
//  QQ控件
//
//  Created by 润朴科技 on 16/9/28.
//  Copyright © 2016年 惠清川. All rights reserved.
//

#import "MoodVC.h"

@interface MoodVC ()

@end

@implementation MoodVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"发表心情";
    self.view.backgroundColor = [UIColor yellowColor];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"关闭" style:UIBarButtonItemStylePlain target:self action:@selector(exit)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"发表" style:UIBarButtonItemStylePlain target:self action:@selector(exit)];
}
-(void)exit{
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
