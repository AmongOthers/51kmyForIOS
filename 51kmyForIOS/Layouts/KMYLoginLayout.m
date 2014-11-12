//
//  KMYLoginLayout.m
//  51kmyForIOS
//
//  Created by 钟建明 on 14/11/11.
//  Copyright (c) 2014年 Abner Zhong. All rights reserved.
//

#import "KMYLoginLayout.h"
#import <UIView+EasyFrame.h>
#import <TKRoundedView.h>

@interface KMYLoginLayout ()

@property(nonatomic, strong) UIView *rootView;
@property(nonatomic, strong) UITextField *usernameField;
@property(nonatomic, strong) UITextField *passwordField;
@property(nonatomic, strong) UIActivityIndicatorView *indicator;
@property(nonatomic, strong) UIButton *loginBtn;

@end

@implementation KMYLoginLayout

- (instancetype)initWithRootView:(UIView *)rootView {
  self = [super init];
  if (self) {
    _rootView = rootView;
    [self layout];
  }
  return self;
}

- (void)layout {
  UIView *rootView = self.rootView;
  rootView.backgroundColor = [UIColor whiteColor];

  TKRoundedView *usernameBg = [[TKRoundedView alloc] init];
  usernameBg.ef_width = 300;
  usernameBg.ef_height = 40;
  usernameBg.roundedCorners = TKRoundedCornerTopLeft | TKRoundedCornerTopRight;
  usernameBg.cornerRadius = 5;
  usernameBg.ef_top = 100;
  usernameBg.backgroundColor = [UIColor whiteColor];
  usernameBg.borderColor = [UIColor lightGrayColor];
  usernameBg.borderWidth = 0.5;
  [usernameBg ef_horizontalCenterIn:rootView];
  [rootView addSubview:usernameBg];

  UITextField *usernameField = [[UITextField alloc] init];
  [usernameBg addSubview:usernameField];
  usernameField.backgroundColor = [UIColor whiteColor];
  usernameField.placeholder = @"账号";
  usernameField.ef_width = 280;
  usernameField.ef_height = 30;
  usernameField.clearButtonMode = UITextFieldViewModeWhileEditing;
  usernameField.returnKeyType = UIReturnKeyNext;
  usernameField.delegate = self;
  usernameField.autocapitalizationType = UITextAutocapitalizationTypeNone;
  [usernameField ef_centerIn:usernameBg];
  self.usernameField = usernameField;

  TKRoundedView *passBg = [[TKRoundedView alloc] init];
  passBg.ef_width = 300;
  passBg.ef_height = 40;
  passBg.roundedCorners =
      TKRoundedCornerBottomLeft | TKRoundedCornerBottomRight;
  passBg.backgroundColor = [UIColor whiteColor];
  passBg.cornerRadius = 5;
  passBg.borderColor = [UIColor lightGrayColor];
  passBg.borderWidth = 0.5;
  [passBg ef_below:usernameBg withMargin:-0.5];
  [passBg ef_horizontalCenterIn:rootView];
  [rootView addSubview:passBg];

  UITextField *passwordField = [[UITextField alloc] init];
  passwordField.backgroundColor = [UIColor whiteColor];
  passwordField.ef_width = 280;
  passwordField.ef_height = 30;
  [passwordField ef_centerIn:passBg];
  passwordField.placeholder = @"密码";
  passwordField.secureTextEntry = YES;
  passwordField.returnKeyType = UIReturnKeyGo;
  passwordField.clearButtonMode = UITextFieldViewModeWhileEditing;
  passwordField.delegate = self;
  [passBg addSubview:passwordField];
  self.passwordField = passwordField;

  UIActivityIndicatorView *indicator = [[UIActivityIndicatorView alloc] init];
  indicator.ef_width = 15;
  indicator.ef_height = 15;
  indicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
  [indicator ef_verticalCenterIn:passBg];
  indicator.ef_right = passBg.ef_width - 10;
  [passBg addSubview:indicator];
  self.indicator = indicator;

  UIButton *loginBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
  loginBtn.frame = passBg.frame;
  [loginBtn ef_below:passBg withMargin:30];
  loginBtn.layer.borderColor = [[UIColor lightGrayColor] CGColor];
  loginBtn.layer.borderWidth = 0.5;
  loginBtn.layer.cornerRadius = 5;
  loginBtn.titleLabel.font = [UIFont systemFontOfSize:16];
  [loginBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
  [loginBtn setTitleColor:[UIColor grayColor] forState:UIControlStateDisabled];
  [loginBtn setTitle:@"登录" forState:UIControlStateNormal];
  [rootView addSubview:loginBtn];
  self.loginBtn = loginBtn;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
  if (textField == self.usernameField) {
    [self.passwordField becomeFirstResponder];
  } else {
    [self startLoging];
  }
  return [textField resignFirstResponder];
}

- (void)startLoging {
  self.usernameField.enabled = NO;
  self.passwordField.enabled = NO;
  self.loginBtn.enabled = NO;
  [self.indicator startAnimating];

  // delay 2 seconds
  dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)),
                 dispatch_get_main_queue(), ^{
      self.usernameField.enabled = YES;
      self.passwordField.enabled = YES;
      self.loginBtn.enabled = YES;
      [self.indicator stopAnimating];
  });
}

@end
