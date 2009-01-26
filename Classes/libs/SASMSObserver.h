//
//  SASMSObserver.h
//  SMSAlert
//
//  Created by takayama on 08/12/20.
//  Copyright 2008-2009 Kyosuke Takayama.
//  It is released under the MIT LICENSE.
//

#import <Foundation/Foundation.h>

@class SASMSObserver;

@protocol SASMSObserverDelegate
- (void) SASMSObserverDidSMS:(SASMSObserver *)sender;
- (void) SASMSObserverDidSBank:(SASMSObserver *)sender;
@end

@interface SASMSObserver : NSObject {
   NSObject <SASMSObserverDelegate> *delegate;
   BOOL is_sbank;
}

@property(readwrite, assign) NSObject<SASMSObserverDelegate> *delegate;

+ (id) sharedInstance;
- (void) attachEvent;
- (void) callbackSMS;
- (void) callbackSBank;

@end
