//
//  MapViewController.h
//  ApiFacebook
//
//  Created by tikitikipoo on 12/01/16.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "Facebook.h"

@interface MapViewController : UIViewController
<
MKMapViewDelegate,
MKReverseGeocoderDelegate,
FBRequestDelegate
>

@end
