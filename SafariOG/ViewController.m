//
//  ViewController.m
//  SafariOG
//
//  Created by Mingu Chu on 3/15/16.
//  Copyright © 2016 Mingu Chu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIWebViewDelegate, UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UITextField *urlTextField;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *spinner;
@property (weak, nonatomic) IBOutlet UIButton *onBackButton;
@property (weak, nonatomic) IBOutlet UIButton *onFowardButton;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}


-(void)webViewDidStartLoad:(UIWebView *)webView {
    [self.spinner startAnimating];
}

-(void)webViewDidFinishLoad:(UIWebView *)webView {
    [self.spinner stopAnimating];
    
    
    if ([webView canGoBack])  {
        [self.onBackButton setEnabled:YES];
    } else {
        [self.onBackButton setEnabled:NO];
    }
    
    if ([webView canGoForward]) {
        [self.onFowardButton setEnabled:YES];
    } else {
        [self.onFowardButton setEnabled:NO];
    }
}



- (IBAction)onBackButtonPressed:(id)sender {
    [_webView goBack];
}
- (IBAction)onForwardButtonPressed:(id)sender {
    [_webView goForward];
}
- (IBAction)onStopLoadingButtonPressed:(id)sender {
    [_webView stopLoading];
}
- (IBAction)onReloadButtonPressed:(id)sender {
    [_webView reload];
}



- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    NSURL *url = [NSURL URLWithString:textField.text];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
    return YES;
}


@end
