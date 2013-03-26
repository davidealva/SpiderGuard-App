//
//  DetailViewController.h
//  MasterDetail
//
//  Created by David Alvarado on 2/29/12.
//  Copyright (c) 2012 __MadeByDiesel__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController <UISplitViewControllerDelegate>

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UIWebView *bioView;
@property (strong, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end
