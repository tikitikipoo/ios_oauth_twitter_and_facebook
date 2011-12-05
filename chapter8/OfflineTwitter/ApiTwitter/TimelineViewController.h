//
//  TimelineViewController.h
//  ApiTwitter
//
//  Created by tikitikipoo  on 11/11/14.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TwitterDataStore;
@interface TimelineViewController : UITableViewController
{
    NSArray             *tweets;
    TwitterDataStore    *twitterDataStore;

}
@end
