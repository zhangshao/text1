//
//  WebViewViewController.m
//  protect6
//
//  Created by 林小露 on 14-3-23.
//  Copyright (c) 2014年 林小露. All rights reserved.
//

#import "WebViewViewController.h"

@interface WebViewViewController ()

@end

@implementation WebViewViewController
@synthesize webViews;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    NSString *abc = @"http://m.qidian.com";
    NSURL *url = [NSURL URLWithString:abc];
    NSURLRequest *requesturl = [NSURLRequest requestWithURL:url];
    [self.webViews loadRequest:requesturl];
    

    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
