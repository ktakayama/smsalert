//
//  SAWebViewController.h
//  SMSAlert
//
//  Created by takayama on 08/12/21.
//  Copyright 2008-2009 Kyosuke Takayama.
//  It is released under the MIT LICENSE.
//

#import <UIKit/UIKit.h>

@interface SAWebViewController : UIViewController <UITextFieldDelegate, UIWebViewDelegate> {
   IBOutlet UIWebView *webView;
   IBOutlet UITextField *textField;
   IBOutlet UIBarButtonItem *stopButton;
   IBOutlet UIBarButtonItem *reloadButton;
   IBOutlet UIBarButtonItem *backButton;
   IBOutlet UIBarButtonItem *forwardButton;
}


@property (nonatomic, retain) UIWebView *webView;
@property (nonatomic, retain) UITextField *textField;
@property (nonatomic, retain) UIBarButtonItem *stopButton;
@property (nonatomic, retain) UIBarButtonItem *reloadButton;
@property (nonatomic, retain) UIBarButtonItem *backButton;
@property (nonatomic, retain) UIBarButtonItem *forwardButton;

- (IBAction) close;

@end
