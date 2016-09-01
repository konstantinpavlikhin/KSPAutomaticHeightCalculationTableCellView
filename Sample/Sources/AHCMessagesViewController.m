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
}

- (void) registerCells
{
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
