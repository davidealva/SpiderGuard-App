//
//  VideoInfo.h
//  MBDVideoTemplate
//
//  Created by David Alvarado on 2/15/12.
//  Copyright (c) 2012 __MadeByDiesel__.  All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VideoInfo : NSObject
{
	NSString *strFileName;
	NSString *strTitle;
}

@property (nonatomic, retain) NSString *strFileName;
@property (nonatomic, retain) NSString *strTitle;

@end
