//
//  PFURL.m
//  SMSAlert
//
//  Created by takayama on 08/12/21.
//  Copyright 2008-2009 Kyosuke Takayama.
//  It is released under the MIT LICENSE.
//

#import "PFURL.h"

@implementation PFURL

#define PF_URL_KEY_OF_URL @"pf_url_of_url"

// setter
+ (void) setURL:(NSString *)url {
   [[NSUserDefaults standardUserDefaults] setObject:url forKey:PF_URL_KEY_OF_URL];
   [[NSUserDefaults standardUserDefaults] synchronize];
}

// getter
+ (NSString *) URL {
   return [[NSUserDefaults standardUserDefaults] stringForKey:PF_URL_KEY_OF_URL];
}

@end
