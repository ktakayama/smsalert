//
//  SAConfigViewController.m
//  SMSAlert
//
//  Created by takayama on 08/12/21.
//  Copyright 2008-2009 Kyosuke Takayama.
//  It is released under the MIT LICENSE.
//

#import "SAConfigViewController.h"

@implementation SAConfigViewController

- (void) loadView {
   [super loadView];
   sounds = [[SASounds alloc] init];
   self.navigationItem.title = NSLocalizedString(@"Settings", nil);
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
   return 1;
}

- (NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
   return NSLocalizedString(@"Ringtone", nil);
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
   return NSLocalizedString(@"Other setting is in \"Settings\" application.", nil);
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   static NSString *identifier = @"configCell";

   UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
   if(cell == nil) {
      cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:identifier] autorelease];
   }

   [cell setText:[sounds objectAtIndex:indexPath.row]];

   return cell;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
   //Every cell is going to have two rows.
   return [sounds count];
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
   [NSTimer scheduledTimerWithTimeInterval:0.1
      target:self selector:@selector(_deselectTableRow:) userInfo:tableView repeats:NO];

   [sounds selectAtIndex:indexPath.row];
   [tableView reloadData];

   if(indexPath.row == 0)
      return;

   [sound release];
   sound = [[SASound alloc] initWithSound:[sounds objectAtIndex:indexPath.row]];
   [sound play];
}

- (void) _deselectTableRow:(NSTimer *)info {
   NSIndexPath *tableSelection = [[info userInfo] indexPathForSelectedRow];
   [[info userInfo] deselectRowAtIndexPath:tableSelection animated:YES];
}

- (UITableViewCellAccessoryType) tableView:(UITableView *)tv
          accessoryTypeForRowWithIndexPath:(NSIndexPath *)indexPath {
   BOOL isSelected = [sounds enableAtIndex:indexPath.row];
   return (isSelected ? UITableViewCellAccessoryCheckmark:UITableViewCellAccessoryNone);
}

- (IBAction) close {
   [self dismissModalViewControllerAnimated:YES];
}

- (void)dealloc {
   [sounds release];
   [sound release];
   [super dealloc];
}

@end
