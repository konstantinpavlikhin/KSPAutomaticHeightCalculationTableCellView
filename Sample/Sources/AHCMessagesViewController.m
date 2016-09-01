//
//  AHCMessagesViewController.m
//  KSPAutomaticHeightCalculationTableCellView
//
//  Created by Konstantin Pavlikhin on 01.09.16.
//  Copyright © 2016 Konstantin Pavlikhin. All rights reserved.
//

#import "AHCMessagesViewController+Private.h"

NS_ASSUME_NONNULL_BEGIN

@implementation AHCMessagesViewController
{
  NSArray<NSString*>* _messages;
}

#pragma mark -

- (void) awakeFromNib
{
  [super awakeFromNib];

  // * * *.

  [self loadMessages];

  [self registerCells];

  // * * *.

  [self.tableView reloadData];
}

#pragma mark - Private Methods

- (void) loadMessages
{
  NSURL* const URL = [[NSBundle mainBundle] URLForResource: @"Messages" withExtension: @"plist"];

  NSData* const data = [NSData dataWithContentsOfURL: URL];

  NSError* error;

  NSArray<NSString*>* const messagesOrNil = [NSPropertyListSerialization propertyListWithData: data options: NSPropertyListImmutable format: nil error: &error];

  if(messagesOrNil)
  {
    _messages = messagesOrNil;
  }
  else
  {
    NSLog(@"%@", error);
  }
}

- (void) registerCells
{
}

#pragma mark - NSTableViewDataSource Protocol Implementation

- (NSInteger) numberOfRowsInTableView: (NSTableView*) tableView
{
  return _messages.count;
}

- (nullable id) tableView: (NSTableView*) tableView objectValueForTableColumn: (nullable NSTableColumn*) tableColumn row: (NSInteger) row
{
  return _messages[row];
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
