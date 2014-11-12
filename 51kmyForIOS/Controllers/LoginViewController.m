//
//  LoginViewController.m
//  51kmyForIOS
//
//  Created by 钟建明 on 14/11/11.
//  Copyright (c) 2014年 Abner Zhong. All rights reserved.
//

#import "LoginViewController.h"
#import "KMYLoginLayout.h"

@interface LoginViewController ()

@property(nonatomic, strong) KMYLoginLayout *layout;

@end

@implementation LoginViewController

- (void)loadView {
  self.view = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
  self.layout = [[KMYLoginLayout alloc] initWithRootView:self.view];
}

- (void)viewDidLoad {
  [super viewDidLoad];
}

@end
