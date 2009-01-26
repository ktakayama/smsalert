//
//  PFSound.m
//  SMSAlert
//
//  Created by takayama on 08/12/21.
//  Copyright 2008-2009 Kyosuke Takayama.
//  It is released under the MIT LICENSE.
//

#import "PFSound.h"

@implementation PFSound

#define PF_SOUND_KEY_OF_SOUND @"pf_sound_of_sound"

// setter
+ (void) setSound:(NSString *)name {
   [[NSUserDefaults standardUserDefaults] setObject:name forKey:PF_SOUND_KEY_OF_SOUND];
   [[NSUserDefaults standardUserDefaults] synchronize];
}

// getter
+ (NSString *) sound {
   return [[NSUserDefaults standardUserDefaults] stringForKey:PF_SOUND_KEY_OF_SOUND];
}

@end
