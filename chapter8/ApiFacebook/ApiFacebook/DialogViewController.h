//
//  DialogViewController.h
//  ApiFacebook
//
//  Created by tikitikipoo on 11/11/10.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Facebook.h"

@class FBLoginButton;

@interface DialogViewController : UIViewController <FBDialogDelegate>

@property (strong, nonatomic) FBLoginButton *fbLoginButton;

@end
