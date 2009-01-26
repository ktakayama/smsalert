//
//  SAWebViewController.m
//  SMSAlert
//
//  Created by takayama on 08/12/21.
//  Copyright 2008-2009 Kyosuke Takayama.
//  It is released under the MIT LICENSE.
//

#import "SAWebViewController.h"
#import "PFURL.h"

@implementation SAWebViewController

@synthesize webView, textField;
@synthesize stopButton, reloadButton, backButton, forwardButton;

// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
   [super loadView];
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
   [super viewDidLoad];
   NSString *url = [PFURL URL];
   if(url)
      [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:url]]];
}

- (BOOL) textFieldShouldReturn:(UITextField *)aTextField {
   NSString *url;

   NSRange range = [aTextField.text rangeOfString:@":"];
   if(range.length > 0 && range.location < 10) {
      url = aTextField.text;
   } else {
      url = [@"http://" stringByAppendingString:aTextField.text];
   }

   aTextField.text = url;
   [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:url]]];
   [aTextField resignFirstResponder];
   return YES;
}

- (void) webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
   // NSLog(@"error with webview: %@", error);
   stopButton.enabled = NO;
   reloadButton.enabled = YES;
}

- (void) webViewDidStartLoad:(UIWebView *)aWebView {
   textField.text = [aWebView.request.URL absoluteString];
   stopButton.enabled = YES;
   reloadButton.enabled = NO;
}

- (void) webViewDidFinishLoad:(UIWebView *)aWebView {
   textField.text = [aWebView.request.URL absoluteString];
   stopButton.enabled = NO;
   reloadButton.enabled = YES;
   backButton.enabled = aWebView.canGoBack;
   forwardButton.enabled = aWebView.canGoForward;
   [PFURL setURL:textField.text];
}

/*
- (void)textFieldDidBeginEditing:(UITextField *)aTextField {
   NSLog(@"DidBeginEditing");
}

- (void) textFieldDidEndEditing:(UITextField *)aTextField {
   NSLog(@"go");
}
*/

- (IBAction) close {
   [self dismissModalViewControllerAnimated:YES];
}

- (void)dealloc {
   [webView release];
   [textField release];
   [stopButton release];
   [reloadButton release];
   [backButton release];
   [forwardButton release];
   [super dealloc];
}


@end
