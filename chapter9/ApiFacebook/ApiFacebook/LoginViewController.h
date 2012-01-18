//
//  LoginViewController.h
//  ApiFacebook
//
//  Created by tikitikipoo on 11/11/10.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Facebook.h"
#import "FBConnect.h"

@class FBLoginButton;
@interface LoginViewController : UIViewController
<
FBDialogDelegate,
FBSessionDelegate
>

@property (strong, nonatomic)  FBLoginButton *fbLoginButton;

@end
