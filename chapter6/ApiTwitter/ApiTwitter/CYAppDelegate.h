//
//  CYAppDelegate.h
//  ApiTwitter
//
//  Created by tikitikipoo on 11/11/08.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SA_OAuthTwitterEngine.h"

extern SA_OAuthTwitterEngine	*sa_OAuthTwitterEngine;

@class MainViewController;
@interface CYAppDelegate : UIResponder <UIApplicationDelegate, SA_OAuthTwitterEngineDelegate, MGTwitterEngineDelegate>
{
    UIWindow *_window;
	MainViewController *mainViewController;

}

@end
