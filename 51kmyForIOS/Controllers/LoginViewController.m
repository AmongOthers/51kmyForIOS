//
//  LoginViewController.m
//  51kmyForIOS
//
//  Created by 钟建明 on 14/11/11.
//  Copyright (c) 2014年 Abner Zhong. All rights reserved.
//

#import "LoginViewController.h"
#import "MainViewController.h"

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
  self.layout.delegate = self;
}

#pragma mark KMYLoginLayoutDelegate

- (void)startLogingWithUsername:(NSString *)username
                       password:(NSString *)password {
  // login stuff ...
  dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)),
                 dispatch_get_main_queue(), ^{
      [self.layout loginFinish];
      UIAlertView *alerView = [[UIAlertView alloc] initWithTitle:@"提示"
                                                         message:@"登录成功"
                                                        delegate:self
                                               cancelButtonTitle:@"确定"
                                               otherButtonTitles:nil];
      [alerView show];

  });
}

#pragma mark UIAlertViewDelegate

- (void)alertView:(UIAlertView *)alertView
    clickedButtonAtIndex:(NSInteger)buttonIndex {
  MainViewController *controller = [[MainViewController alloc] init];
  UINavigationController *nav =
      [[UINavigationController alloc] initWithRootViewController:controller];
  [self presentViewController:nav animated:NO completion:nil];
}

@end
