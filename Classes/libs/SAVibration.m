//
//  SAVibration.m
//  SMSAlert
//
//  Created by takayama on 08/12/20.
//  Copyright 2008-2009 Kyosuke Takayama.
//  It is released under the MIT LICENSE.
//

#import "SAVibration.h"

@implementation SAVibration

+ (void) vibrate {
   AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
}

+ (void) vibrate:(NSInteger) count {
   [self vibrate];

   count --;
   if(count > 0) {
      [NSTimer scheduledTimerWithTimeInterval:1.0 target:self
         selector:@selector(vibrateWithTimer:) userInfo:[NSNumber numberWithInt:count] repeats:NO];
   }
}

+ (void) vibrateWithTimer:(NSTimer *) aTimer {
   [self vibrate:[[aTimer userInfo] intValue]];
}

@end
