//
//  AddViewController.m
//  12.个人通讯录
//
//  Created by YOU on 15/1/10.
//  Copyright (c) 2015年 YOU. All rights reserved.
//

#import "AddViewController.h"

@interface AddViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIButton *addBtn;
@property (weak, nonatomic) IBOutlet UITextField *nameFiled;
@property (weak, nonatomic) IBOutlet UITextField *phoneFiled;
- (IBAction)add;

@end

@implementation AddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //监听通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChange) name:UITextFieldTextDidChangeNotification object:self.nameFiled];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChange) name:UITextFieldTextDidChangeNotification object:self.phoneFiled];
    
 

}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    //设置姓名文本框成为第一响应者(弹出键盘)
    [self.nameFiled becomeFirstResponder];
}

-(void)textChange{
    self.addBtn.enabled=(self.nameFiled.text.length&&self.phoneFiled.text.length);
}
- (void)dealloc
{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

/**
 *  添加联系人
 */
- (IBAction)add {
    
    //关闭当前界面
    
    [self.view endEditing:YES];
    [self.navigationController popViewControllerAnimated:YES];
}
@end
