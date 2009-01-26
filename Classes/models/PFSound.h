//
//  PFSound.h
//  SMSAlert
//
//  Created by takayama on 08/12/21.
//  Copyright 2008-2009 Kyosuke Takayama.
//  It is released under the MIT LICENSE.
//

#import <Foundation/Foundation.h>

@interface PFSound : NSObject {

}

// setter
+ (void) setSound:(NSString *)name;

// getter
+ (NSString *) sound;

@end
