//
//  SAVibration.h
//  SMSAlert
//
//  Created by takayama on 08/12/20.
//  Copyright 2008-2009 Kyosuke Takayama.
//  It is released under the MIT LICENSE.
//

#import <Foundation/Foundation.h>
#import <AudioToolbox/AudioServices.h>

@interface SAVibration : NSObject {

}

+ (void) vibrate;
+ (void) vibrate:(NSInteger) count;
+ (void) vibrateWithTimer:(NSTimer *) aTimer;

@end
