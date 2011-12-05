//
//  TweetTableViewCell.h
//  ApiTwitter
//
//  Created by tikitikipoo on 11/12/05.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Tweet;
@interface TweetTableViewCell : UITableViewCell
{
	Tweet *tweet;
}

@property(nonatomic, retain) Tweet *tweet;

@end
