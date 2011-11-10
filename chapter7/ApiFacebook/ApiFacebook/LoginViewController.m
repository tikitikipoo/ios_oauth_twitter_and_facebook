//
//  LoginViewController.m
//  ApiFacebook
//
//  Created by tikitikipoo on 11/11/10.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "LoginViewController.h"
#import "FBLoginButton.h"
#import "CYAppDelegate.h"

@implementation LoginViewController

@synthesize fbLoginButton;

- (id)init {
	self = [super init];
	if (self != nil) {
		self.tabBarItem = [[[UITabBarItem alloc] initWithTitle:@"Login" image:nil tag:0] autorelease];
	}
	return self;
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self setToolbarItems:nil];
    
    self.fbLoginButton = [[FBLoginButton alloc] initWithFrame:CGRectMake(127.0f, 68.0f, 72.0f, 37.0f)];
    self.fbLoginButton.backgroundColor = [UIColor clearColor];
    [self.fbLoginButton addTarget:self action:@selector(fbButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.fbLoginButton];
    [self.fbLoginButton release];
    
    self.fbLoginButton.isLoggedIn = NO;
    if (YES == [facebook isSessionValid]) {
        self.fbLoginButton.isLoggedIn = YES;
    }
    [self.fbLoginButton updateImage];
    
}

/**
 * Show the authorization dialog.
 */
- (void)login {
    NSLog(@"before login");
    [facebook setSessionDelegate:self];
    [facebook authorize:[NSArray arrayWithObjects:@"read_stream", @"offline_access",nil]];
}

/**
 * Invalidate the access token and clear the cookie.
 */
- (void)logout {
	[facebook logout:self];
}

///////////////////////////////////////////////////////////////////////////////////////////////////
// IBAction

/**
 * Called on a login/logout button click.
 */
- (void)fbButtonClick:(UIButton*)sender {
	if (self.fbLoginButton.isLoggedIn) {
		[self logout];
	} else {
		[self login];
	}
}

#pragma mark -
#pragma mark FBSessionDelegate

//Called when the user successfully logged in.
- (void)fbDidLogin {
	NSLog(@"did login");
	
	self.fbLoginButton.isLoggedIn = YES;
	[self.fbLoginButton updateImage];
}

//Called when the user dismissed the dialog without logging in.
- (void)fbDidNotLogin:(BOOL)cancelled {
	NSLog(@"did not login");
}

//Called when the user logged out.
- (void)fbDidLogout {
	NSLog(@"did logout");
	
	self.fbLoginButton.isLoggedIn = NO;
	[self.fbLoginButton updateImage];
}

#pragma mark - memory control

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)dealloc {
    [super dealloc];
}

@end
