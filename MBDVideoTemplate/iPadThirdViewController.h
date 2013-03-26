//
//  iPadThirdViewController.h
//  SpiderGrd
//
//  Created by David Alvarado on 3/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface iPadThirdViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) NSArray *urlList;
@property (strong, nonatomic) NSString *pass;
@property (weak, nonatomic) IBOutlet UITableView *smallTable;


@end
