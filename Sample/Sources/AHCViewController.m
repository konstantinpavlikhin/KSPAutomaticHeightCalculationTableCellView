//
//  AHCViewController.m
//  KSPAutomaticHeightCalculationTableCellView
//
//  Created by Konstantin Pavlikhin on 01.09.16.
//  Copyright © 2016 Konstantin Pavlikhin. All rights reserved.
//

#import "AHCViewController+Private.h"

#import "AHCUserTableCellView.h"

NS_ASSUME_NONNULL_BEGIN

@implementation AHCViewController

#pragma mark -

- (void) awakeFromNib
{
  [super awakeFromNib];

  // * * *.

  [self registerCells];
}

#pragma mark - Private Methods

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
