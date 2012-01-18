//
//  LocationController.m
//  ApiFacebook
//
//  Created by tikitikipoo on 12/01/16.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "LocationController.h"
#import "FTLocationSimulator.h"

@implementation LocationController

@synthesize locationManager;
@synthesize location;
@synthesize heading;
@synthesize inPowerSavingMode;

-(void)startWithPowerSaving:(BOOL)savingPower
{
    [self stop];
    
    if (nil == self.locationManager) {
        
#ifdef FAKE_CORE_LOCATION
        self.locationManager = [[[FTLocationSimulator alloc] init] autorelease];;
        NSLog(@"debug.fake true");
#else
        self.locationManager = [[[CLLocationManager alloc] init] autorelease];
        NSLog(@"debug.fake false");
#endif
    }
    
    self.locationManager.delegate = self;
    
    //Available in 3.2 and later
    self.locationManager.purpose = @"Big Brother is watching.";
    
    BOOL locationServicesEnabled = NO;
    
    if ([CLLocationManager respondsToSelector:@selector(locationServicesEnabled)]) {
        
        locationServicesEnabled = [CLLocationManager locationServicesEnabled];
        
    } else {
        
        locationServicesEnabled = self.locationManager.locationServicesEnabled;
    }
    
    if (locationServicesEnabled) {
        
        self.inPowerSavingMode = NO;
        
        if (savingPower
            && [CLLocationManager respondsToSelector:@selector(significantLocationChangeMonitoringAvailable)]) 
        {
            
            if ([self.locationManager respondsToSelector:@selector(startMonitoringSignificantLocationChanges)]) {
                
                [self.locationManager startMonitoringSignificantLocationChanges];
                self.inPowerSavingMode = YES;
                
            }
            
        } else {
            
            self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
            self.locationManager.distanceFilter  = kCLDistanceFilterNone;
            [self.locationManager startUpdatingLocation];
        }
    }
    
}

-(void)stop
{
    
    if (self.inPowerSavingMode
        && [CLLocationManager respondsToSelector:@selector(significantLocationChangeMonitoringAvailable)]) {
        
        if ([self.locationManager respondsToSelector:@selector(stopMonitoringSignificantLocationChanges)]) {
            
            [self.locationManager stopMonitoringSignificantLocationChanges];
            
        } else {
            
            [self.locationManager stopUpdatingLocation];
        }
    }
}

-(BOOL)registerRegion:(CLLocationCoordinate2D)center
{
    if (! [CLLocationManager regionMonitoringAvailable]
        || 
        ! [CLLocationManager regionMonitoringEnabled]) {
        
        return NO;
    }
    
    CLLocationDegrees radius = self.locationManager.maximumRegionMonitoringDistance;
    
    CLRegion *region = [[CLRegion alloc] initCircularRegionWithCenter:center
                                                               radius:radius 
                                                           identifier:@"test"];
    
    [self.locationManager startMonitoringForRegion:region 
                                   desiredAccuracy:kCLLocationAccuracyNearestTenMeters];
    
    [region release];
    
    return YES;
}

-(void)dealloc
{
    [self stop];
    [locationManager release];
    
    [super dealloc];
    
}



#pragma mark CLLocationManagerDelegate

-(void)locationManager:(CLLocationManager *)manager 
   didUpdateToLocation:(CLLocation *)newLocation 
          fromLocation:(CLLocation *)oldLocation
{
    self.location = newLocation;
    //    NSLog(@"location:%@", self.location);
    //    NSLog(@"self.location.coordinate.latitude:%f", self.location.coordinate.latitude);
    //    NSLog(@"self.location.coordinate.longitude:%f", self.location.coordinate.longitude);
}

-(BOOL)locationManagerShouldDisplayHeadingCalibration:(CLLocationManager *)manager
{
    return YES;
}

-(void)locationManager:(CLLocationManager *)manager 
        didEnterRegion:(CLRegion *)region
{
    NSLog(@"didEnterRegion");
}

-(void)locationManager:(CLLocationManager *)manager 
         didExitRegion:(CLRegion *)region
{
    NSLog(@"didExitRegion");
}

-(void)locationManager:(CLLocationManager *)manager 
monitoringDidFailForRegion:(CLRegion *)region 
             withError:(NSError *)error
{
    NSLog(@"monitoringDidFailForRegion");
}

-(void)locationManager:(CLLocationManager *)manager 
didChangeAuthorizationStatus:(CLAuthorizationStatus)status
{
    NSLog(@"didChangeAuthorizationStatus");    
}

@end
