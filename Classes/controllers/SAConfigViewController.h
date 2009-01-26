//
//  SAConfigViewController.h
//  SMSAlert
//
//  Created by takayama on 08/12/21.
//  Copyright 2008-2009 Kyosuke Takayama.
//  It is released under the MIT LICENSE.
//

#import <UIKit/UIKit.h>
#import "SASounds.h"
#import "SASound.h"

@interface SAConfigViewController : UIViewController <UITableViewDataSource, UITableViewDelegate> {
   SASounds *sounds;
   SASound *sound;
}

- (IBAction) close;
- (void) _deselectTableRow:(NSTimer *)info;

@end
