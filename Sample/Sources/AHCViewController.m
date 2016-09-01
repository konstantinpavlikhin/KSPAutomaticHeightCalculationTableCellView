//
//  AHCViewController.m
//  KSPAutomaticHeightCalculationTableCellView
//
//  Created by Konstantin Pavlikhin on 01.09.16.
//  Copyright © 2016 Konstantin Pavlikhin. All rights reserved.
//

#import "AHCViewController+Private.h"

#import "AHCUser.h"

#import "AHCUserTableCellView.h"

NS_ASSUME_NONNULL_BEGIN

@implementation AHCViewController
{
  NSArray<AHCUser*>* _users;
}

#pragma mark -

- (void) awakeFromNib
{
  [super awakeFromNib];

  // * * *.

  [self loadUsers];

  [self registerCells];
}

#pragma mark - Private Methods

- (void) loadUsers
{
  NSURL* const URL = [[NSBundle mainBundle] URLForResource: @"Users" withExtension: @"plist"];

  NSData* const data = [NSData dataWithContentsOfURL: URL];

  NSError* error;

  NSArray<NSDictionary*>* const userDictionariesOrNil = [NSPropertyListSerialization propertyListWithData: data options: NSPropertyListImmutable format: nil error: &error];

  if(userDictionariesOrNil)
  {
    NSMutableArray<AHCUser*>* const mutableUsers = [NSMutableArray arrayWithCapacity: userDictionariesOrNil.count];

    for(NSDictionary* userDictionary in userDictionariesOrNil)
    {
      NSString* _Nullable const avatarNameOrNil = userDictionary[@"avatarName"];

      NSImage* const avatar = (avatarNameOrNil? [NSImage imageNamed: avatarNameOrNil] : [NSImage imageNamed: NSImageNameUser]);

      AHCUser* const user = [[AHCUser alloc] initWithName: userDictionary[@"name"] avatar: avatar status: userDictionary[@"status"]];

      [mutableUsers addObject: user];
    }

    _users = [mutableUsers copy];
  }
  else
  {
    NSLog(@"%@", error);
  }
}

- (void) registerCells
{
  NSString* const className = NSStringFromClass([AHCUserTableCellView class]);

  [self.tableView registerNib: [[NSNib alloc] initWithNibNamed: className bundle: nil] forIdentifier: className];
}

#pragma mark - NSTableViewDataSource Protocol Implementation

- (NSInteger) numberOfRowsInTableView: (NSTableView*) tableView
{
  return 0;
}

- (nullable id) tableView: (NSTableView*) tableView objectValueForTableColumn: (nullable NSTableColumn*) tableColumn row: (NSInteger) row
{
  return nil;
}

#pragma mark - NSTableViewDelegate Protocol Implementation

- (nullable NSView*) tableView: (NSTableView*) tableView viewForTableColumn: (nullable NSTableColumn*) tableColumn row: (NSInteger) row
{
  return nil;
}

- (CGFloat) tableView: (NSTableView*) tableView heightOfRow: (NSInteger) row
{
  return 0;
}

@end

NS_ASSUME_NONNULL_END
