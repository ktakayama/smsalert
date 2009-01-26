//
//  SASound.h
//  SMSAlert
//
//  Created by takayama on 08/12/20.
//  Copyright 2008-2009 Kyosuke Takayama.
//  It is released under the MIT LICENSE.
//

#import <Foundation/Foundation.h>
#import <AudioToolbox/AudioServices.h>

@interface SASound : NSObject {
   SystemSoundID soundID;
   BOOL enabled;
}

- (id) initWithSound:(NSString *)name;
- (void) play;

@end
