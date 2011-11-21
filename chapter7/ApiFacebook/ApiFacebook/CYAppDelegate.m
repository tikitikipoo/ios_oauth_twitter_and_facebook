//
//  CYAppDelegate.m
//  ApiFacebook
//
//  Created by tikitikipoo on 11/11/10.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "CYAppDelegate.h"

// タブ
#import "MainViewController.h"

// ログイン
#import "LoginViewController.h"

// 友人
#import "FriendsViewController.h"

// ダイアログ
#import "DialogViewController.h"

// Facebook
Facebook	*facebook;
NSString	*appID	= @"";


@implementation CYAppDelegate

@synthesize window = _window;

- (void)dealloc
{
    [_window release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    
    MainViewController* tabViewController = [[MainViewController alloc] init];
    [tabViewController setToolbarItems:nil];
    
    NSMutableArray *viewControllers = [[NSMutableArray alloc] init];
    
    [viewControllers addObject:[[LoginViewController alloc] init]];
    [viewControllers addObject:[[FriendsViewController alloc] init]];
	[viewControllers addObject:[[DialogViewController alloc] init]];
    tabViewController.viewControllers = viewControllers;
    
    if ([self.window respondsToSelector:@selector(setRootViewController:)]) {
		[self.window setRootViewController:tabViewController];
	} else {
		[self.window addSubview:tabViewController.view];
	}
    
    // Initialize Facebook
    facebook = [[Facebook alloc] initWithAppId:appID andDelegate:self];
    
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}

#pragma mark -
#pragma mark Facebook handleOpenURL
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    NSLog(@"openURL");
	return [facebook handleOpenURL:url];
}

- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url {
    NSLog(@"handleOpenURL");
    return [facebook handleOpenURL:url];
}

@end
