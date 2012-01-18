//
//  LocationController.h
//  ApiFacebook
//
//  Created by tikitikipoo on 12/01/16.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

#ifdef FAKE_CORE_LOCATION
@class FTLocationSimulator;
#endif

@interface LocationController : NSObject <CLLocationManagerDelegate>

#ifdef FAKE_CORE_LOCATION
@property(nonatomic, strong)FTLocationSimulator *locationManager;
#else
@property(nonatomic, strong)CLLocationManager   *locationManager;
#endif

@property(nonatomic, strong)CLLocation          *location;
@property(nonatomic, strong)CLHeading           *heading;

@property BOOL                                  inPowerSavingMode;

-(void)startWithPowerSaving:(BOOL)savingPower;
-(void)stop;
-(BOOL)registerRegion:(CLLocationCoordinate2D)center;

@end
