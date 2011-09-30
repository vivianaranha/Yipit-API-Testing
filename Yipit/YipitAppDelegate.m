//
//  YipitAppDelegate.m
//  Yipit
//
//  Created by Vivian Aranha on 5/11/11.
//  Copyright 2011 Self. All rights reserved.
//

#import "YipitAppDelegate.h"
#import "JSON.h"




@implementation YipitAppDelegate

@synthesize currentLocation;

@synthesize window=_window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    if ([CLLocationManager locationServicesEnabled]) {
        locationManager = [[CLLocationManager alloc] init];
        [locationManager setDelegate:self];
        [locationManager setDistanceFilter:kCLDistanceFilterNone];
        [locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
        [locationManager startUpdatingLocation];
    } 
    

        
    // Override point for customization after application launch.
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)dealloc
{
    [_window release];
    [super dealloc];
}



- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{ 
	CLLocationCoordinate2D coordinate = [locationManager.location coordinate];
	
	if ((coordinate.latitude !=0 ) && (coordinate.longitude != 0)) {
		self.currentLocation = newLocation;
        [manager stopUpdatingLocation]; 
        
        DealsViewController *dealsViewController = [[DealsViewController alloc] init];
        dealsViewController.title = @"Deals";
        
        UINavigationController *navig = [[UINavigationController alloc] initWithRootViewController:dealsViewController];
        self.window.rootViewController = navig;

	}
	
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{ 
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error getting location" message:@"Location cant be determined. Try again later." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
	[alert show];
	[alert release];
	[manager stopUpdatingLocation];
}


@end
