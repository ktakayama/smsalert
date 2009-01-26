//
//  RootViewController.m
//  SMSAlert
//
//  Created by takayama on 08/12/20.
//  Copyright 2008-2009 Kyosuke Takayama.
//

#import "RootViewController.h"
#import "MainViewController.h"
#import "SAAboutViewController.h"


@implementation RootViewController

@synthesize infoButton;
@synthesize aboutNavigationBar;
@synthesize mainViewController;
@synthesize aboutViewController;


- (void)viewDidLoad {
    
    [super viewDidLoad];
    MainViewController *viewController = [[MainViewController alloc] initWithNibName:@"MainView" bundle:nil];
    self.mainViewController = viewController;
    viewController.infoButton = infoButton;
    [viewController release];
    
    infoButton.hidden = YES; /* #141 */
    [self.view insertSubview:mainViewController.view belowSubview:infoButton];
}


- (void)loadSAAboutViewController {
    
    SAAboutViewController *viewController = [[SAAboutViewController alloc] initWithNibName:@"AboutView" bundle:nil];
    self.aboutViewController = viewController;
    [viewController release];
    
    // Set up the navigation bar
    UINavigationBar *aNavigationBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0.0, 0.0, 320.0, 44.0)];
    aNavigationBar.barStyle = UIBarStyleBlackOpaque;
    self.aboutNavigationBar = aNavigationBar;
    [aNavigationBar release];
    
    UIBarButtonItem *buttonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(toggleView)];
    UINavigationItem *navigationItem = [[UINavigationItem alloc] initWithTitle:@"SMSAlert"];
    navigationItem.rightBarButtonItem = buttonItem;
    [aboutNavigationBar pushNavigationItem:navigationItem animated:NO];
    [navigationItem release];
    [buttonItem release];
}


- (IBAction)toggleView {    
    /*
     This method is called when the info or Done button is pressed.
     It flips the displayed view from the main view to the about view and vice-versa.
     */
    if (aboutViewController == nil) {
        [self loadSAAboutViewController];
    }
    
    UIView *mainView = mainViewController.view;
    UIView *aboutView = aboutViewController.view;
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1];
    [UIView setAnimationTransition:([mainView superview] ? UIViewAnimationTransitionFlipFromRight : UIViewAnimationTransitionFlipFromLeft) forView:self.view cache:YES];
    
    if ([mainView superview] != nil) {
        [aboutViewController viewWillAppear:YES];
        [mainViewController viewWillDisappear:YES];
        [mainView removeFromSuperview];
        [infoButton removeFromSuperview];
        [self.view addSubview:aboutView];
        [self.view insertSubview:aboutNavigationBar aboveSubview:aboutView];
        [mainViewController viewDidDisappear:YES];
        [aboutViewController viewDidAppear:YES];

    } else {
        [mainViewController viewWillAppear:YES];
        [aboutViewController viewWillDisappear:YES];
        [aboutView removeFromSuperview];
        [aboutNavigationBar removeFromSuperview];
        [self.view addSubview:mainView];
        [self.view insertSubview:infoButton aboveSubview:mainViewController.view];
        [aboutViewController viewDidDisappear:YES];
        [mainViewController viewDidAppear:YES];
    }
    [UIView commitAnimations];
}



/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
    // Release anything that's not essential, such as cached data
}


- (void)dealloc {
    [infoButton release];
    [aboutNavigationBar release];
    [mainViewController release];
    [aboutViewController release];
    [super dealloc];
}


@end
