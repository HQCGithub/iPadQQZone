//
//  LoginVC.m
//  QQ控件
//
//  Created by 润朴科技 on 16/9/27.
//  Copyright © 2016年 惠清川. All rights reserved.
//

#import "LoginVC.h"
#import "MainVC.h"

@interface LoginVC () <UITextFieldDelegate>
    @property (weak, nonatomic) IBOutlet UITextField *accountField;
    @property (weak, nonatomic) IBOutlet UITextField *passwordField;
    @property (weak, nonatomic) IBOutlet UIView *loginView;
    @property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activity;
    @property (weak, nonatomic) IBOutlet UIButton *remberPassword;
    @property (weak, nonatomic) IBOutlet UIButton *autoLogin;

@end

@implementation LoginVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
    
- (IBAction)loginBtnClick:(UIButton *)sender {
    [self login];
}
-(void)login{
    //收起键盘
    [self.view endEditing:YES];
    //开始动画
    [self.activity startAnimating];
//1.判断是否有值
    if (self.accountField.text.length == 0 || self.passwordField.text.length == 0) {
        //提示错误
        [self showError:@"请输入帐号或密码!"];
        return;
    }else{
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            if ([self.accountField.text isEqualToString:@"123"] && [self.passwordField.text isEqualToString:@"123"]) {
                
                [self.activity stopAnimating];
                self.view.window.rootViewController = [[MainVC alloc]init];
            }else{
            //提示错误
                [self showError:@"帐号或密码错误❎"];
            }
            
        });
    }
}
#pragma mark - 记住密码和自动登录的点击事件
- (IBAction)remberPasswordClick:(UIButton *)sender {
    if (sender.selected == YES) {
        sender.selected = NO;
        if (self.autoLogin.selected == YES) {
            self.autoLogin.selected = NO;
        }
    }else{
        sender.selected = YES;
    }
    
}
- (IBAction)autoLoginClick:(UIButton *)sender {
    if (sender.selected == NO) {
        sender.selected = YES;
        self.remberPassword.selected = YES;
    }else{
        sender.selected = NO;
    }
    
}
    
#pragma mark - 提示错误信息
-(void)showError:(NSString *)error{
    //弹出弹框
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"登录失败" message:error delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
    [alert show];
    //抖动动画
    CAKeyframeAnimation *shakeAnim = [CAKeyframeAnimation animationWithKeyPath:@"transform.translation.x"];
    shakeAnim.values = @[@-20,@0,@20,@0];
    shakeAnim.repeatCount = 2;
    shakeAnim.duration = 0.3;
    [self.loginView.layer addAnimation:shakeAnim forKey:nil];
    [self.activity stopAnimating];

}
#pragma mark - 键盘return的处理方法
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    if (textField == self.accountField) {
        [self.passwordField becomeFirstResponder];
    }else if (textField == self.passwordField){
        [self login];
    }
    
    return YES;
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}
@end
