//
//  SASounds.m
//  SMSAlert
//
//  Created by takayama on 08/12/21.
//  Copyright 2008-2009 Kyosuke Takayama.
//  It is released under the MIT LICENSE.
//

#import "SASounds.h"
#import "PFSound.h"

@implementation SASounds

#define SASOUNDS_DIR_FOR_LOCAL @"/var/mobile/Media/Photos/SMSAlert/"

- (id) init {
   if(self = [super init]) {
      pref = [[PFSound sound] retain];

      NSMutableArray *array = [NSMutableArray arrayWithObjects:
         NSLocalizedString(@"None", nil),
         @"alert-1",
         @"alert-2",
         @"alert-3",
         @"mallert-1",
         @"mallert-2",
         @"mallert-3",
         @"mallert-4",
         @"notification-1",
         @"phone-ring-1",
         @"phone-ring-2",
         @"pulse",
         nil];

      NSDirectoryEnumerator *dirEnum = [[NSFileManager defaultManager]
         enumeratorAtPath:SASOUNDS_DIR_FOR_LOCAL];
      NSString *file;
      while(file = [dirEnum nextObject]) {
         if([file hasSuffix:@".caf"])
           [array addObject:file];
      }

      lists = [[NSArray alloc] initWithArray:array];
   }

   return self;
}

- (void) selectAtIndex:(NSInteger)num {
   [pref release];

   if(num == 0) {
      pref = nil;
   } else {
      pref = [self objectAtIndex:num];
   }
   [pref retain];
   [PFSound setSound:pref];
}

- (NSString *) objectAtIndex:(NSInteger)num {
   return [lists objectAtIndex:num];
}

- (BOOL) enableAtIndex:(NSInteger)num {
   if(num == 0) {
      return (pref == nil);
   } else {
      return [[lists objectAtIndex:num] isEqualToString:pref];
   }
}

- (NSInteger) count {
   return [lists count];
}

- (void) dealloc {
   [pref release];
   [lists release];
   [super dealloc];
}

@end
