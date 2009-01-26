//
//  SASMSObserver.m
//  SMSAlert
//
//  Created by takayama on 08/12/20.
//  Copyright 2008-2009 Kyosuke Takayama.
//  It is released under the MIT LICENSE.
//

#import "SASMSObserver.h"

@implementation SASMSObserver

static void SASMSNotification(CFNotificationCenterRef center,
      void *observer, CFStringRef name, const void *object, CFDictionaryRef userInfo) {

   if([name isEqualToString: @"kCTSMSDatabaseFullNotification"]) {
      // SBS & i.sb
      NSLog(@"kCTSMSDatabaseFullNotification\n");
      [[SASMSObserver sharedInstance] callbackSMS];
   } else if([name isEqualToString: @"kCTSMSClass0StringReceivedNotification"]) {
      // i.sb
      NSLog(@"kCTSMSClass0StringReceivedNotification\n");
      [[SASMSObserver sharedInstance] callbackSBank];
   }

   return;
}

@synthesize delegate;

+ (id) sharedInstance {
   static id _instance = nil;

   @synchronized(self) {
      if(!_instance) {
         _instance = [[self alloc] init];
      }
   }
   return _instance;
}

- (void) attachEvent {
   CTTelephonyCenterAddObserver(
         CTTelephonyCenterGetDefault(), NULL,
         SASMSNotification, NULL, NULL,
         CFNotificationSuspensionBehaviorHold
         );
}

- (void) callbackSMS {
   if(!is_sbank)
      [self.delegate SASMSObserverDidSMS:self];
   is_sbank = NO;
}

- (void) callbackSBank {
   is_sbank = YES;
   [self.delegate SASMSObserverDidSBank:self];
}

- (void) dealloc {
   delegate = nil;
   [super dealloc];
}

@end
