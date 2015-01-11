//
//  EditViewController.m
//  12.个人通讯录
//
//  Created by YOU on 15/1/10.
//  Copyright (c) 2015年 YOU. All rights reserved.
//

#import "EditViewController.h"
#import "ADYContact.h"

@interface EditViewController ()
@property (weak, nonatomic) IBOutlet UIButton *saveBtn;
@property (weak, nonatomic) IBOutlet UITextField *nameFiled;
- (IBAction)edit:(UIBarButtonItem *)item;
@property (weak, nonatomic) IBOutlet UITextField *phoneFiled;
@end

@implementation EditViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.nameFiled.text=self.contact.name;
    self.phoneFiled.text=self.contact.phone;
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

- (IBAction)edit:(UIBarButtonItem *)item {
    if (self.nameFiled.enabled) {
        //点击取消
        self.nameFiled.enabled=self.phoneFiled.enabled=NO;
        self.saveBtn.hidden=YES;
        [self.view endEditing:YES];
          item.title=@"编辑";
        self.nameFiled.text=self.contact.name;
        self.phoneFiled.text=self.contact.phone;
    }else{
        //点击确定
        self.nameFiled.enabled=self.phoneFiled.enabled=YES;
        self.saveBtn.hidden=NO;
        [self.phoneFiled becomeFirstResponder];
        item.title=@"取消";
    }
}
@end
