//
//  ThirdViewController.m
//  MBDVideoTemplate
//
//  Created by David Alvarado on 2/16/12.
//  Copyright (c) 2012 __MadeByDiesel__. All rights reserved.
//

#import "ThirdViewController.h"
#import "WebViewController.h"
#import "DTCustomColoredAccessory.h"

@implementation ThirdViewController
@synthesize urlList;  
@synthesize pass;
@synthesize smallTable;




- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [smallTable setBackgroundView:nil];
    [smallTable setBackgroundView:[[UIView alloc] init]];
    [smallTable setBackgroundColor:UIColor.clearColor];
    [super viewDidLoad];
    

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    NSDictionary *row1 = [[NSDictionary alloc] initWithObjectsAndKeys:@"Website", @"Name", @"http://www.pennythomasjiujitsu.com", @"Url",@"webicon.png", @"Image", nil];
    NSDictionary *row2 = [[NSDictionary alloc] initWithObjectsAndKeys:@"Facebook", @"Name", @"http://www.facebook.com/pages/Penny-Thomas/185155314851759", @"Url", @"facebook.png", @"Image", nil];
    NSDictionary *row3 = [[NSDictionary alloc] initWithObjectsAndKeys:@"Twitter", @"Name", @"http://twitter.com/pennyfighting", @"Url", @"twitter.png", @"Image", nil];
    NSDictionary *row4 = [[NSDictionary alloc] initWithObjectsAndKeys:@"Email", @"Name", @"mailto:PennyFighting@hotmail.com", @"Url", @"email.png", @"Image", nil];
  
    self.urlList = [[NSArray alloc] initWithObjects:row1,row2, row3, row4, nil];
}

- (void)viewDidUnload
{
    [self setUrlList:nil];
    [self setSmallTable:nil];
    [super viewDidUnload];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
    //return YES;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
    {
        
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
        
    DTCustomColoredAccessory *accessory = [DTCustomColoredAccessory accessoryWithColor:cell.textLabel.textColor];
    accessory.highlightedColor = [UIColor whiteColor];
    cell.accessoryView =accessory;
        
    NSUInteger row = [indexPath row];
    NSDictionary *rowData = [self.urlList objectAtIndex:row];
    
    NSString *imgName = [rowData objectForKey:@"Image"];    
    UIImage *image = [UIImage imageNamed:imgName];
    cell.imageView.image = image;
        
    cell.textLabel.text = [rowData objectForKey:@"Name"];
        
    return cell;
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    WebViewController *webView = [self.storyboard instantiateViewControllerWithIdentifier:@"Web"];
    
    // Pass the selected object to the new view controller.
    
    NSUInteger row = [indexPath row];
    NSDictionary *rowData = [self.urlList objectAtIndex:row];
    //NSString *pass = [[NSString alloc] init];
    pass = [rowData objectForKey:@"Url"];
    
    webView.urlPass = pass;
    [self.navigationController pushViewController:webView animated:YES];    
}

@end
