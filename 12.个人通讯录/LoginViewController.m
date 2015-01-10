//
//  LoginViewController.m
//  12.个人通讯录
//
//  Created by YOU on 15/1/10.
//  Copyright (c) 2015年 YOU. All rights reserved.
//

#import "LoginViewController.h"
#import "MBProgressHUD+MJ.h"

@interface LoginViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *accoutFiled;
@property (weak, nonatomic) IBOutlet UITextField *pwdFIled;
@property (weak, nonatomic) IBOutlet UIButton *LoginBtn;
@property (weak, nonatomic) IBOutlet UISwitch *remberPwdSwitch;
- (IBAction)remberPwd;
@property (weak, nonatomic) IBOutlet UISwitch *autoLoginSwitch;
- (IBAction)autoLogin;
- (IBAction)Login:(id)sender;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   //监听通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChange) name:UITextFieldTextDidChangeNotification object:self.accoutFiled];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChange) name:UITextFieldTextDidChangeNotification object:self.pwdFIled];
    
}

-(void)textChange{
    self.LoginBtn.enabled=(self.accoutFiled.text.length&&self.pwdFIled.text.length);
}
- (void)dealloc
{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
    
}


- (IBAction)remberPwd {
    if (!self.remberPwdSwitch.isOn) {
        self.autoLoginSwitch.on=NO;
    }
}
- (IBAction)autoLogin {
    if (self.autoLoginSwitch.isOn) {
        self.remberPwdSwitch.on=YES;
    }
}

- (IBAction)Login:(id)sender {
    
    if ([self.pwdFIled.text isEqualToString:@"1"]){
        //跳转
        //延时2秒
        [MBProgressHUD showMessage:@"登录中.."];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [MBProgressHUD hideHUD];
               [self performSegueWithIdentifier:@"logintoContent" sender:nil];
        });
     
         
    }
    else{
        //登录失败
        [MBProgressHUD showError:@"用户名密码错误"];
        
    }
}
@end
