//
//  DTCustomColoredAccessory.h
//  MBDVideoTemplate
//
//  Created by David Alvarado on 2/16/12.
//  Copyright (c) 2012 __MadeByDiesel__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DTCustomColoredAccessory : UIControl
{
	UIColor *_accessoryColor;
	UIColor *_highlightedColor;
}

@property (nonatomic, retain) UIColor *accessoryColor;
@property (nonatomic, retain) UIColor *highlightedColor;

+ (DTCustomColoredAccessory *)accessoryWithColor:(UIColor *)color;

@end
