//
//  TimelineViewController.m
//  ApiTwitter
//
//  Created by tikitikipoo  on 11/11/14.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "TimelineViewController.h"
#import "CYAppDelegate.h"
#import "TwitterDataStore.h"
#import "TweetTableViewCell.h"

@implementation TimelineViewController

- (id)init {
	self = [super init];
	if (self != nil) {
		self.tabBarItem = [[[UITabBarItem alloc] initWithTitle:@"Tweetin" image:nil tag:0] autorelease];
	}
	return self;
}

- (void)refreshUI
{
    NSLog(@"my refreshUI");
    
    [tweets release];
    tweets = [[twitterDataStore tweets] retain];
    
    [self.tableView reloadData];
}

- (void)tweetsDidSynchronize:(NSNotification*)notification 
{
    NSLog(@"my tweetsDidSynchronize");
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
    //update the UI on the main thread
    [self performSelectorOnMainThread:@selector(refreshUI) withObject:nil waitUntilDone:YES];
}

- (void)synchronizeTweets:(NSArray*)newTweets 
{
    NSLog(@"my synchronizeTweets");
    
    //listen for a notification with the name of the identifier
	[[NSNotificationCenter defaultCenter] addObserver:self 
                                             selector:@selector(tweetsDidSynchronize:) 
                                                 name:@"tweetsDidSynchronize" 
                                               object:nil];
    
    [twitterDataStore synchronizeTweets:newTweets];
}

- (void)twitterTimelineRequestDidComplete:(NSNotification*)notification {
	
    NSLog(@"my twitterTimelineRequestDidComplete");
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
    [self performSelectorInBackground:@selector(synchronizeTweets:) withObject:[notification.userInfo objectForKey:@"tweets"]];
}


#pragma mark -
#pragma mark View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    twitterDataStore = [[TwitterDataStore alloc] init];
    tweets = [[twitterDataStore tweets] retain];
    
    NSString *identifier = [sa_OAuthTwitterEngine getHomeTimeline];
    
	//listen for a notification with the name of the identifier
	[[NSNotificationCenter defaultCenter] addObserver:self 
                                             selector:@selector(twitterTimelineRequestDidComplete:) 
                                                 name:identifier 
                                               object:nil];
}

#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
	return [tweets count];
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    TweetTableViewCell *cell = (TweetTableViewCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[TweetTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    // Configure the cell...
	Tweet *tweet = [tweets objectAtIndex:[indexPath row]];
	cell.tweet = tweet;
    
    return cell;
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
    [twitterDataStore release];
    [tweets release];
    [super dealloc];
}


@end
