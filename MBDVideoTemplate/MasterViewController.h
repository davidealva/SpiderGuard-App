//
//  MasterViewController.h
//  MasterDetail
//
//  Created by David Alvarado on 2/29/12.
//  Copyright (c) 2012 __MadeByDiesel__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MPMoviePlayerController.h>
#import "Landscape.h"

@class DetailViewController;

@interface MasterViewController : UITableViewController <UITableViewDelegate, UITableViewDataSource>
{
    MPMoviePlayerController  *MoviePlayerController;
    Landscape  *MoviePlayerViewCtrler;

}


@property (strong, nonatomic) DetailViewController *detailViewController;
@property (strong, nonatomic) MPMoviePlayerController *MoviePlayerController;
@property (strong, nonatomic) NSMutableArray *listData;
@property (weak, nonatomic) IBOutlet UITableView *movieTable;


@end
