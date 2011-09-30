//
//  YipitAppDelegate.h
//  Yipit
//
//  Created by Vivian Aranha on 5/11/11.
//  Copyright 2011 Self. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import "DealsViewController.h"



@interface YipitAppDelegate : NSObject <UIApplicationDelegate, CLLocationManagerDelegate> {
    CLLocationManager *locationManager;
	CLLocation *currentLocation;

}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) CLLocation *currentLocation;


@end
