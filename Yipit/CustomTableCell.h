//
//  CustomTableCell.h
//  Yipit
//
//  Created by Vivian Aranha on 5/11/11.
//  Copyright 2011 Self. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface CustomTableCell : UITableViewCell {
    UILabel *lblTitle;
    UIImageView *imageSmallView;
    UILabel *businessName;
    UILabel *location;
    UILabel *sourceName;
    
}

@property (nonatomic, retain) UILabel *lblTitle;
@property (nonatomic, retain) UIImageView *imageSmallView;
@property (nonatomic, retain) UILabel *businessName;
@property (nonatomic, retain) UILabel *location;
@property (nonatomic, retain) UILabel *sourceName;


-(UILabel *)newLabelWithPrimaryColor:(UIColor *)primaryColor selectedColor:(UIColor *)selectedColor fontSize:(CGFloat)fontSize bold:(BOOL)bold;

-(void)layoutSubviews ;
-(void)setData:(NSDictionary *)dict;
-(void)downloadImage:(id)path;

@end
