//
//  SASounds.h
//  SMSAlert
//
//  Created by takayama on 08/12/21.
//  Copyright 2008-2009 Kyosuke Takayama.
//  It is released under the MIT LICENSE.
//

#import <Foundation/Foundation.h>

@interface SASounds : NSObject {
   NSString *pref;
   NSArray *lists;
}

- (id) init;
- (void) selectAtIndex:(NSInteger)num;
- (NSString *) objectAtIndex:(NSInteger)num;
- (BOOL) enableAtIndex:(NSInteger)num;
- (NSInteger) count;

@end
