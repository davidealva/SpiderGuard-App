//
//  WebViewController.h
//  MBDVideoTemplate
//
//  Created by David Alvarado on 2/15/12.
//  Copyright (c) 2012 __MadeByDiesel__.  All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebViewController: UIViewController <UIWebViewDelegate>
{
    
    IBOutlet UIWebView *outWebView;
   
}

@property (nonatomic, retain) UIWebView *outWebView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activity;
@property (strong, nonatomic) NSString *urlPass;

@end
