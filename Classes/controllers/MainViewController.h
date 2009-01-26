//
//  MainViewController.h
//  SMSAlert
//
//  Created by takayama on 08/12/20.
//  Copyright 2008-2009 Kyosuke Takayama.
//  It is released under the MIT LICENSE.
//

#import <UIKit/UIKit.h>
#import "SASMSObserver.h"
#import "SASound.h"

@interface MainViewController : UIViewController
               <SASMSObserverDelegate, UITableViewDelegate, UITableViewDataSource> {
   SASound *sound;
   NSUserDefaults *prefs;
   NSArray *shortcuts;

   UIButton *infoButton;
   UITableView *tableView;
}

@property (nonatomic, retain) UIButton *infoButton;
@property (nonatomic, retain) IBOutlet UITableView *tableView;

- (IBAction) openSMS;
- (IBAction) openMail;
- (IBAction) openSafari;
- (IBAction) openPrefs;

@end
