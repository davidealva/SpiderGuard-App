//
//  ThirdViewController.h
//  MBDVideoTemplate
//
//  Created by David Alvarado on 2/16/12.
//  Copyright (c) 2012 __MadeByDiesel__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ThirdViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) NSArray *urlList;
@property (strong, nonatomic) NSString *pass;
@property (weak, nonatomic) IBOutlet UITableView *smallTable;

@end
