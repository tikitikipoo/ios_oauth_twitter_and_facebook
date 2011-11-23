//
//  TimelineViewController.m
//  ApiTwitter
//
//  Created by tikitikipoo  on 11/11/14.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "TimelineViewController.h"
#import "CYAppDelegate.h"
#import "TwitterLoginButton.h"

@implementation TimelineViewController

- (id)init {
	self = [super init];
	if (self != nil) {
		self.tabBarItem = [[[UITabBarItem alloc] initWithTitle:@"Tweetin" image:nil tag:0] autorelease];
	}
	return self;
}

- (void) loadView {
	[super loadView];
	
	self.view.backgroundColor = [UIColor whiteColor];
    
	twitterButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	twitterButton.frame = CGRectMake(127.0f, 68.0f, 72.0f, 37.0f);
	[twitterButton setTitle:@"Twitter" forState:UIControlStateNormal];
	[twitterButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
	[twitterButton addTarget:self action:@selector(twitterButtonClick:) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:twitterButton];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
// IBAction

/**
 * Called on a login/logout button click.
 */
- (void)twitterButtonClick:(UIButton*)sender {
	[sa_OAuthTwitterEngine getPublicTimeline];
	//[sa_OAuthTwitterEngine getHomeTimeline];
	//[sa_OAuthTwitterEngine getUserTimeline];
	//[sa_OAuthTwitterEngine getMentions];
	
	//[sa_OAuthTwitterEngine sendUpdate:@"this is a test tweet! tweet tweet!"];
	//[sa_OAuthTwitterEngine sendUpdate:@"this is a test!!" inReplyTo:@"43524663950848000"];
	//[sa_OAuthTwitterEngine retweetUpdate:@"43854807395606528"];
	
	//[sa_OAuthTwitterEngine getUpdate:@"43525805485199360"];
	//[sa_OAuthTwitterEngine deleteUpdate:@"43525805485199360"];
	
	//userInfoReceived delegate
	//[sa_OAuthTwitterEngine getRecentlyUpdatedFriendsFor:@"christhepiss" startingAtPage:0];
	//[sa_OAuthTwitterEngine getUserInformationFor:@"103384600" /*@"christhepiss"*/];
	//[sa_OAuthTwitterEngine getUserInformationForEmail:@"mrchristopher124@gmail.com"]; // users/show
	
	//[sa_OAuthTwitterEngine sendDirectMessage:@"how goes it?" to:@"christhepiss"];
	//[sa_OAuthTwitterEngine deleteDirectMessage:@"2542673717"];
	//2542673717
	
	//[sa_OAuthTwitterEngine getFavoriteUpdatesFor:nil startingAtPage:0];
	
	//userInfoReceived
	//[sa_OAuthTwitterEngine enableNotificationsFor:@"MintYourMoney"];
}


- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end
