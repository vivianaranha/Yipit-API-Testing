//
//  WebDealViewController.m
//  Yipit
//
//  Created by Vivian Aranha on 5/11/11.
//  Copyright 2011 Self. All rights reserved.
//

#import "WebDealViewController.h"


@implementation WebDealViewController

@synthesize appURL;

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	UIWebView *webView  = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
	webView.scalesPageToFit = YES;
	webView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
	[webView loadRequest:[NSURLRequest 
						  requestWithURL:appURL]];
    [self.view addSubview:webView];
	[webView release];
	
}


- (void)dealloc {
    [super dealloc];
}

@end
