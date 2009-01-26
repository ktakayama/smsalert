//
//  RootViewController.h
//  SMSAlert
//
//  Created by takayama on 08/12/20.
//  Copyright 2008-2009 Kyosuke Takayama.
//

#import <UIKit/UIKit.h>

@class MainViewController;
@class SAAboutViewController;

@interface RootViewController : UIViewController {

    UIButton *infoButton;
    MainViewController *mainViewController;
    SAAboutViewController *aboutViewController;
    UINavigationBar *aboutNavigationBar;
}

@property (nonatomic, retain) IBOutlet UIButton *infoButton;
@property (nonatomic, retain) MainViewController *mainViewController;
@property (nonatomic, retain) UINavigationBar *aboutNavigationBar;
@property (nonatomic, retain) SAAboutViewController *aboutViewController;

- (IBAction)toggleView;

@end
