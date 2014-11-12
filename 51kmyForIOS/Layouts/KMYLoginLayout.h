//
//  KMYLoginLayout.h
//  51kmyForIOS
//
//  Created by 钟建明 on 14/11/11.
//  Copyright (c) 2014年 Abner Zhong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol KMYLoginLayoutDelegate <NSObject>

- (void)startLogingWithUsername:(NSString *)username
                       password:(NSString *)password;

@end

@interface KMYLoginLayout : NSObject <UITextFieldDelegate>

@property(nonatomic, weak) id<KMYLoginLayoutDelegate> delegate;

- (instancetype)initWithRootView:(UIView *)rootView;
- (void)startLoging;
- (void)loginFinish;

@end
