//
//  WebViewController.m
//  WeekTwoAssessment
//
//  Created by Brent Dady on 5/22/15.
//  Copyright (c) 2015 Brent Dady. All rights reserved.
//

#import "WebViewController.h"
// #import "CityViewController.h"

@interface WebViewController () <UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;


@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Info";

    [self loadReqestWithText:self.city.url];
}

-(void)loadReqestWithText:(NSString *)text{
    NSURL *url = [NSURL URLWithString:text];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
}

- (void)webViewDidStartLoad:(UIWebView *)webView {
    [self.activityIndicator startAnimating];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    [self.activityIndicator stopAnimating];
    self.activityIndicator.hidden = TRUE;
}


@end
