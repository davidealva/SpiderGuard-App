//
//  FirstViewController.h
//  MBDVideoTemplate
//
//  Created by David Alvarado on 2/15/12.
//  Copyright (c) 2012 __MadeByDiesel__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MPMoviePlayerController.h>
#import "Landscape.h"


@interface FirstViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
{
    MPMoviePlayerController  *MoviePlayerController;
    Landscape  *MoviePlayerViewCtrler;
}

@property (strong, nonatomic) MPMoviePlayerController *MoviePlayerController;
@property (strong, nonatomic) NSMutableArray *listData;
@property (weak, nonatomic) IBOutlet UITableView *movieTable;

@end
