//
//  DealsViewController.m
//  Yipit
//
//  Created by Vivian Aranha on 5/11/11.
//  Copyright 2011 Self. All rights reserved.
//

#import "DealsViewController.h"
#import "WebDealViewController.h"
#import "JSON.h"

#define YIPIT_KEY @"ADD YIPIY KEY HERE"
#define radius 1000.0

@implementation DealsViewController

@synthesize dealsArray, myCellArray, currentLocation;

- (void)dealloc
{
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    YipitAppDelegate *appDelegate = (YipitAppDelegate *)[[UIApplication sharedApplication] delegate];
	self.currentLocation = appDelegate.currentLocation;
    CLLocationCoordinate2D coordinate = [self.currentLocation coordinate];
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://api.yipit.com/v1/deals/?lat=%f&lon=%f&radius=%f&key=%@",coordinate.latitude, coordinate.longitude, radius,YIPIT_KEY]];
    
	NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
	NSURLResponse *response = NULL;
	NSError *requestError = NULL;
	NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&requestError];
	NSString *responseString = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
	
    //NSLog(@"%@",responseString);
    
    SBJSON *json = [[SBJSON new] autorelease];
	NSError *jsonError;
	NSDictionary *parsedJSON = [json objectWithString:responseString error:&jsonError];
    
    self.dealsArray = [[parsedJSON objectForKey:@"response"] objectForKey:@"deals"];
    
	[responseString release];
    
    myCellArray = [NSMutableArray new];
	for (int i = 0; i < [dealsArray count]; ++i) {
		NSIndexPath *indexPath = [NSIndexPath indexPathForRow:i inSection:0];
		UITableViewCell *cell = [self tableView:self.tableView cellForRowAtIndexPath:indexPath];
		[myCellArray addObject:cell];
		
	}

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [dealsArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    CustomTableCell *cell = (CustomTableCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    
    if ([myCellArray count] > indexPath.row) {
		return [myCellArray objectAtIndex:indexPath.row];
	} else {
        cell = [[[CustomTableCell alloc] initWithFrame:CGRectZero reuseIdentifier:CellIdentifier] autorelease];
        [cell setData:[dealsArray objectAtIndex:indexPath.row]];
	}	
    
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 130.0;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

     WebDealViewController *detailViewController = [[WebDealViewController alloc] init];
    detailViewController.appURL = [NSURL URLWithString:[[dealsArray objectAtIndex:indexPath.row] objectForKey:@"mobile_url"]];
     [self.navigationController pushViewController:detailViewController animated:YES];
     [detailViewController release];
     
}

@end
