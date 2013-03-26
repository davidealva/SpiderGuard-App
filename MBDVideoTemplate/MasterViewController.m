//
//  MasterViewController.m
//  MasterDetail
//
//  Created by David Alvarado on 2/29/12.
//  Copyright (c) 2012 __MadeByDiesel__. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "VideoInfo.h"
#import "DTCustomColoredAccessory.h"

@interface MasterViewController () {

}
@end

@implementation MasterViewController

@synthesize detailViewController = _detailViewController;
@synthesize MoviePlayerController;
@synthesize listData;
@synthesize movieTable;

- (void)awakeFromNib
{
    self.clearsSelectionOnViewWillAppear = NO;
    self.contentSizeForViewInPopover = CGSizeMake(320.0, 600.0);
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
  
    self.detailViewController = (DetailViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];
   
        [movieTable setBackgroundView:nil];
        [movieTable setBackgroundView:[[UIView alloc] init]];
        [movieTable setBackgroundColor:UIColor.clearColor];
        
        
        MoviePlayerViewCtrler = nil;
        listData = [NSMutableArray array];
        
        NSString *path = [[NSBundle mainBundle] pathForResource:@"video" ofType:@"plist"];
        
        NSMutableArray *array = [[NSMutableArray alloc] initWithContentsOfFile:path];
        
        for (NSDictionary *d in array) {
            VideoInfo* objVideoInfo = [VideoInfo alloc];
            
            NSString *strTemp = [d objectForKey:@"Filename"];
            objVideoInfo.strFileName = [[NSString alloc] initWithString:strTemp];
            
            strTemp = [d objectForKey:@"Title"];
            objVideoInfo.strTitle = [[NSString alloc] initWithString:strTemp];
            [listData addObject:objVideoInfo];
        }
    
}

- (void)viewDidUnload
{
    [self setMoviePlayerController:nil];
    [self setMovieTable:nil];
    [self setListData:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    return UIInterfaceOrientationIsLandscape(toInterfaceOrientation);
}


#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return[listData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    // Configure the cell
    VideoInfo *videoInfo =(VideoInfo*) [listData objectAtIndex:indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"%@", videoInfo.strTitle];
    
    return cell;
}


- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return NO;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    VideoInfo *videoInfo =(VideoInfo*) [listData objectAtIndex:indexPath.row];
	
	NSString *path = [[NSBundle mainBundle] resourcePath];
	
	path = [path stringByAppendingPathComponent:videoInfo.strFileName]; 
	
	NSURL *movieURL = [NSURL fileURLWithPath:path];
    
   	MoviePlayerViewCtrler = [[Landscape alloc] initWithContentURL:movieURL];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(moviePlayBackDidFinish:)
                                                 name:MPMoviePlayerPlaybackDidFinishNotification
                                               object:MoviePlayerViewCtrler];
    
    [MoviePlayerViewCtrler.moviePlayer prepareToPlay];
    [self presentMoviePlayerViewControllerAnimated:MoviePlayerViewCtrler];
    [MoviePlayerViewCtrler.moviePlayer play];	
}

- (void) moviePlayBackDidFinish:(NSNotification*)notification {
    
    MoviePlayerController = [notification object];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self      
                                                    name:MPMoviePlayerPlaybackDidFinishNotification
                                                  object:MoviePlayerController];
    
    if ([MoviePlayerController 
         respondsToSelector:@selector(setFullscreen:animated:)])
    {
        [MoviePlayerController.view removeFromSuperview];
    }
    
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    DTCustomColoredAccessory *accessory = [DTCustomColoredAccessory accessoryWithColor:cell.textLabel.textColor];
    accessory.highlightedColor = [UIColor whiteColor];
    cell.accessoryView =accessory;
    
}

@end















