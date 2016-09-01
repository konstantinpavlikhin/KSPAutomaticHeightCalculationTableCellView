//
//  AHCMessagesViewController.m
//  KSPAutomaticHeightCalculationTableCellView
//
//  Created by Konstantin Pavlikhin on 01.09.16.
//  Copyright © 2016 Konstantin Pavlikhin. All rights reserved.
//

#import "AHCMessagesViewController+Private.h"

#import "AHCMessageTableCellView.h"

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
  NSString* const className = NSStringFromClass([AHCMessageTableCellView class]);

  [self.tableView registerNib: [[NSNib alloc] initWithNibNamed: className bundle: nil] forIdentifier: className];
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
  NSString* const className = NSStringFromClass([AHCMessageTableCellView class]);

  return [tableView makeViewWithIdentifier: className owner: nil];
}

- (CGFloat) tableView: (NSTableView*) tableView heightOfRow: (NSInteger) row
{
  return [AHCMessageTableCellView heightWithRepresentedObject: _messages[row] width: self.mainColumn.width];
}

- (void) tableViewColumnDidResize: (NSNotification*) notification
{
  if(notification.userInfo[@"NSTableColumn"] == self.mainColumn)
  {
    [NSAnimationContext runAnimationGroup: ^(NSAnimationContext* _Nonnull const context)
    {
      context.duration = 0;

      [self.tableView noteHeightOfRowsWithIndexesChanged: [NSIndexSet indexSetWithIndexesInRange: NSMakeRange(0, _messages.count)]];
    } completionHandler: nil];
  }
}

@end

NS_ASSUME_NONNULL_END
