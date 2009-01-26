//
//  MainViewController.m
//  SMSAlert
//
//  Created by takayama on 08/12/20.
//  Copyright 2008-2009 Kyosuke Takayama.
//  It is released under the MIT LICENSE.
//

#import "MainViewController.h"
#import "SAVibration.h"
#import "SAWebViewController.h"
#import "SAConfigViewController.h"
#import "PFSound.h"

@implementation MainViewController

@synthesize infoButton, tableView;

- (id) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
       // Custom initialization
    }
    return self;
}

- (void) viewWillAppear:(BOOL)animated {
   [super viewWillAppear:animated];
   /* #141 */ // infoButton.hidden = NO;
   [sound release];
   sound = [[SASound alloc] initWithSound:[PFSound sound]];
}

- (void) viewDidLoad {
   [super viewDidLoad];

   prefs = [[NSUserDefaults standardUserDefaults] retain];

   SASMSObserver *observer = [SASMSObserver sharedInstance];
   observer.delegate = self;
   [observer attachEvent];

   shortcuts = [[NSArray alloc] initWithObjects:@"SMS", @"Mail", @"Web", @"Settings", nil];
#ifdef _DEBUG_
   // デバッグ用シミュレーションボタン
   UIButton *onsms  = [[UIButton alloc] initWithFrame:CGRectMake(30,200,60,60)];
   UIButton *onsbnk = [[UIButton alloc] initWithFrame:CGRectMake(100,200,60,60)];
   [onsms addTarget:self action:@selector(SASMSObserverDidSMS:) forControlEvents:UIControlEventTouchUpInside];
   [onsbnk addTarget:self action:@selector(SASMSObserverDidSBank:) forControlEvents:UIControlEventTouchUpInside];
   onsms.backgroundColor = [UIColor greenColor];
   onsbnk.backgroundColor = [UIColor blueColor];
   [self.view addSubview:onsms];
   [self.view addSubview:onsbnk];
   [onsms release];
   [onsbnk release];
#endif
}

- (void) SASMSObserverDidSMS:(SASMSObserver *)sender {
   NSString *is_sms = [prefs stringForKey:@"is_sms"];
   if(is_sms && [is_sms isEqualToString:@"0"]) return;

   [sound play];
   NSInteger count = [[prefs stringForKey:@"vibrate_count"] intValue];
   if(count == nil) count = 4;
   if(count > 0) [SAVibration vibrate:count];
}

- (void) SASMSObserverDidSBank:(SASMSObserver *)sender {
   [sound play];
   NSInteger count = [[prefs stringForKey:@"vibrate_count"] intValue];
   if(count == nil) count = 4;
   if(count > 0) [SAVibration vibrate:count];
}

- (IBAction) openSMS {
   [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"sms:"]];
}

- (IBAction) openMail {
   [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"mailto:"]];
}

- (IBAction) openSafari {
   // [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http:"]];
   SAWebViewController *modal = [[[SAWebViewController alloc]
      initWithNibName:@"WebViewController" bundle:nil] autorelease];
   [self presentModalViewController:modal animated:YES];
   /* #141 */ // infoButton.hidden = YES;
}

- (IBAction) openPrefs {
   SAConfigViewController *modal = [[[SAConfigViewController alloc]
      initWithNibName:@"ConfigViewController" bundle:nil] autorelease];
   [self presentModalViewController:modal animated:YES];
   /* #141 */ // infoButton.hidden = YES;
}

// table view
- (NSInteger)tableView:(UITableView *)aTableView numberOfRowsInSection:(NSInteger)section {
   return [shortcuts count];
}

- (UITableViewCell *) tableView:(UITableView *)aTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   static NSString *identifier = @"SMSMain";

   UITableViewCell *cell = [aTableView dequeueReusableCellWithIdentifier:identifier];
   if(cell == nil) {
      cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:identifier] autorelease];
   }

   [cell setText:[shortcuts objectAtIndex:indexPath.row]];

   return cell;
}

- (void) tableView:(UITableView *)aTableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
   NSString *app = [shortcuts objectAtIndex:indexPath.row];
   if([app isEqualToString:@"SMS"]) {
      [self openSMS];
   } else if([app isEqualToString:@"Mail"]) {
      [self openMail];
   } else if([app isEqualToString:@"Web"]) {
      [self openSafari];
   } else {
      [self openPrefs];
   }
   [aTableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void) dealloc {
   [sound release];
   [prefs release];
   [shortcuts release];
   [infoButton release];
   [tableView release];
   [super dealloc];
}

@end
