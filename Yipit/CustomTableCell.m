//
//  CustomTableCell.m
//  Yipit
//
//  Created by Vivian Aranha on 5/11/11.
//  Copyright 2011 Self. All rights reserved.
//

#import "CustomTableCell.h"


@implementation CustomTableCell

@synthesize lblTitle, imageSmallView, businessName, location, sourceName;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        UIView *myContentView = self.contentView;
        
        self.lblTitle = [self newLabelWithPrimaryColor:[UIColor blackColor] selectedColor:[UIColor blackColor] fontSize:14.0 bold:YES];
        self.lblTitle.textAlignment = UITextAlignmentLeft;
		self.lblTitle.backgroundColor = [UIColor clearColor];
		[myContentView addSubview:self.lblTitle];
		[self.lblTitle release];
        
        self.imageSmallView = [[UIImageView alloc] init];
        self.imageSmallView.contentMode = UIViewContentModeScaleAspectFit;
		[myContentView addSubview:self.imageSmallView];
		[self.imageSmallView release];
        
        self.businessName = [self newLabelWithPrimaryColor:[UIColor blackColor] selectedColor:[UIColor blackColor] fontSize:14.0 bold:YES];
        self.businessName.textAlignment = UITextAlignmentLeft;
		self.businessName.backgroundColor = [UIColor clearColor];
		[myContentView addSubview:self.businessName];
		[self.businessName release];
        
        
        self.location = [self newLabelWithPrimaryColor:[UIColor blackColor] selectedColor:[UIColor blackColor] fontSize:14.0 bold:YES];
        self.location.textAlignment = UITextAlignmentLeft;
		self.location.backgroundColor = [UIColor clearColor];
		[myContentView addSubview:self.location];
		[self.location release];
        
        
        self.sourceName = [self newLabelWithPrimaryColor:[UIColor blackColor] selectedColor:[UIColor blackColor] fontSize:14.0 bold:YES];
        self.sourceName.textAlignment = UITextAlignmentLeft;
		self.sourceName.backgroundColor = [UIColor clearColor];
		[myContentView addSubview:self.sourceName];
		[self.sourceName release];
        
        
    }
    return self;
}
- (void)layoutSubviews {
	
	[super layoutSubviews];
	CGRect contentRect = self.contentView.bounds;
	
	if (!self.editing) {
        CGFloat boundsX = contentRect.origin.x;
		CGRect frame;
        
		frame = CGRectMake(boundsX + 10, 5, 300, 14);
		self.lblTitle.frame = frame;
		
		frame = CGRectMake(boundsX + 10, 20, 100, 100);
		self.imageSmallView.frame = frame;
		
		frame = CGRectMake(boundsX + 120, 22, 190, 14);
		self.businessName.frame = frame;
		
		frame = CGRectMake(boundsX + 120, 50, 190, 14);
		self.location.frame = frame;
		
		frame = CGRectMake(boundsX + 120, 68, 190, 14);
		self.sourceName.frame = frame;
		
		
	}
}

- (UILabel *)newLabelWithPrimaryColor:(UIColor *)primaryColor selectedColor:(UIColor *)selectedColor fontSize:(CGFloat)fontSize bold:(BOOL)bold
{
	UIFont *font;
    if (bold) {
        font = [UIFont boldSystemFontOfSize:fontSize];
    } else {
        font = [UIFont systemFontOfSize:fontSize];
    }
	
	UILabel *newLabel = [[UILabel alloc] initWithFrame:CGRectZero];
	newLabel.backgroundColor = [UIColor whiteColor];
	newLabel.opaque = YES;
	newLabel.textColor = primaryColor;
	newLabel.highlightedTextColor = selectedColor;
	newLabel.font = font;
	
	return newLabel;
}




- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setData:(NSDictionary *)dict{
    self.lblTitle.text = [dict objectForKey:@"yipit_title"];
    
    id path = [[dict objectForKey:@"images"] objectForKey:@"image_small"];
	[self performSelectorInBackground:@selector(downloadImage:) withObject:path];
    
    self.businessName.text = [[dict objectForKey:@"business"] objectForKey:@"name"];
    self.location.text = [[[[dict objectForKey:@"business"] objectForKey:@"locations"] objectAtIndex:0] objectForKey:@"locality"];
    self.sourceName.text = [[dict objectForKey:@"source"] objectForKey:@"name"];
    
}

-(void)downloadImage:(id)path{
	NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init ];
	
	NSURL *url = [NSURL URLWithString:path];
	NSData *data = [NSData dataWithContentsOfURL:url];
	
	UIImage *img = [[UIImage alloc] initWithData:data];
	self.imageSmallView.image = img;
	[img release];
	[pool release];
	
}

- (void)dealloc
{
    [super dealloc];
}

@end
