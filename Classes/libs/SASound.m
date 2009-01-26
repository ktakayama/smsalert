//
//  SASound.m
//  SMSAlert
//
//  Created by takayama on 08/12/20.
//  Copyright 2008-2009 Kyosuke Takayama.
//  It is released under the MIT LICENSE.
//

#import "SASound.h"

@implementation SASound

#define SASOUND_DIR_FOR_LOCAL @"/var/mobile/Media/Photos/SMSAlert/"

- (id) initWithSound:(NSString *)name {
   if(self = [super init]) {
      enabled = NO;
      if(!name) return self;

      NSString *sndpath;
      if([name hasSuffix:@".caf"]) {
         sndpath = [SASOUND_DIR_FOR_LOCAL stringByAppendingPathComponent:name];
      } else {
         sndpath = [[NSBundle mainBundle] pathForResource:name ofType:@"caf"];
      }

      CFURLRef soundURL = (CFURLRef)[[[NSURL alloc] initFileURLWithPath:sndpath] autorelease];
      AudioServicesCreateSystemSoundID(soundURL, &soundID);
      enabled = YES;
   }

   return self;
}

- (void) play {
   if(enabled)
      AudioServicesPlaySystemSound(soundID);
}

- (void) dealloc {
   if(enabled)
      AudioServicesDisposeSystemSoundID(soundID);
   [super dealloc];
}

@end
