//
//  SMSAlertAppDelegate.m
//  SMSAlert
//
//  Created by takayama on 08/12/20.
//  Copyright __MyCompanyName__ 2008. All rights reserved.
//

#import "SMSAlertAppDelegate.h"
#import "RootViewController.h"

@implementation SMSAlertAppDelegate


@synthesize window;
@synthesize rootViewController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {
    
    [window addSubview:[rootViewController view]];
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [rootViewController release];
    [window release];
    [super dealloc];
}

@end
