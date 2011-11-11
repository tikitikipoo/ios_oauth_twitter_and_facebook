//
//  FollowersTableViewCell.h
//  ApiTwitter
//
//  Created by tikitikipoo on 11/11/08.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FollowersTableViewCell : UITableViewCell
{
	NSDictionary *data;
}

@property(nonatomic, retain) NSDictionary *data;

@end
