//
//  CYAppDelegate.h
//  ApiTwitter
//
//  Created by tikitikipoo on 11/11/08.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SA_OAuthTwitterEngine.h"

@class LocationController;
@class MainViewController;

extern SA_OAuthTwitterEngine	*sa_OAuthTwitterEngine;
extern LocationController *locationController;


@interface CYAppDelegate : UIResponder <UIApplicationDelegate, SA_OAuthTwitterEngineDelegate, MGTwitterEngineDelegate>
{
    UIWindow *_window;
	MainViewController *mainViewController;

}

@end
