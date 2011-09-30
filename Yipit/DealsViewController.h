//
//  DealsViewController.h
//  Yipit
//
//  Created by Vivian Aranha on 5/11/11.
//  Copyright 2011 Self. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomTableCell.h"
#import "YipitAppDelegate.h"

@interface DealsViewController : UITableViewController {
    NSArray *dealsArray;
    NSMutableArray *myCellArray;
    CLLocation *currentLocation;

}

@property (nonatomic, retain) NSArray *dealsArray;
@property (nonatomic, retain) NSMutableArray *myCellArray;
@property (nonatomic, retain) CLLocation *currentLocation;


@end
