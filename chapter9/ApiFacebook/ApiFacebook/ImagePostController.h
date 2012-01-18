//
//  ImagePostController.h
//  ApiFacebook
//
//  Created by tikitikipoo on 11/11/21.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Facebook.h"

@class FBLoginButton;
@interface ImagePostController : UIViewController
<
UINavigationControllerDelegate,
UIImagePickerControllerDelegate,
FBRequestDelegate
>
@property (nonatomic, retain) FBLoginButton* fbLoginButton;
@property (nonatomic, retain) UIImage*  savedImage;

@end
