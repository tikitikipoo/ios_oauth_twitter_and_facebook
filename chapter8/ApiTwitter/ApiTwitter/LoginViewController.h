//
//  LoginViewController.h
//  ApiTwitter
//
//  Created by tikitikipoo on 11/11/08.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SA_OAuthTwitterController.h"

@class TwitterLoginButton;
@interface LoginViewController : UIViewController <SA_OAuthTwitterControllerDelegate>
{
	TwitterLoginButton *twitterLoginButton;    
}
@end
