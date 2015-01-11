//
//  AddViewController.h
//  12.个人通讯录
//
//  Created by YOU on 15/1/10.
//  Copyright (c) 2015年 YOU. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AddViewController;
@class ADYContact;
@protocol AddViewControllerDelegate <NSObject>

@optional
//-(void)addView:(AddViewController *) addData didAddContactWithname:(NSString *)name phone:(NSString *)phone;
-(void)addView:(AddViewController *) addData didAddContactWithContact:(ADYContact *)contact;

@end
@interface AddViewController : UIViewController
@property(nonatomic,weak) id<AddViewControllerDelegate> delegate;
@end
