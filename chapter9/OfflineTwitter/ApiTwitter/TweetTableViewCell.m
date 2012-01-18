//
//  TweetTableViewCell.m
//  ApiTwitter
//
//  Created by tikitikipoo on 11/12/05.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "TweetTableViewCell.h"
#import "Tweet.h"

@implementation TweetTableViewCell

@synthesize tweet;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code.
    }
    return self;
}

- (void)setTweet:(Tweet *)inTweet {
	[tweet release];
	tweet = [inTweet retain];
    
	self.textLabel.text = tweet.text;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state.
}


- (void)dealloc {
	[tweet release];
    [super dealloc];
}

@end
