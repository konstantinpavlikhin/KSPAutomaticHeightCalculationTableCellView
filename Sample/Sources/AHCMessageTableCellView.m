//
//  AHCMessageTableCellView.m
//  KSPAutomaticHeightCalculationTableCellView
//
//  Created by Konstantin Pavlikhin on 01.09.16.
//  Copyright © 2016 Konstantin Pavlikhin. All rights reserved.
//

#import "AHCMessageTableCellView+Private.h"

// * * *.

static void* ObjectValueKVOContext;

// * * *.

@implementation AHCMessageTableCellView

@dynamic objectValue;

#pragma mark - Cleanup

- (void) dealloc
{
  [self removeObserver: self forKeyPath: NSStringFromSelector(@selector(objectValue)) context: &ObjectValueKVOContext];
}

#pragma mark - NSView Overrides

- (void) layout
{
  [super layout];

  // * * *.

  {{
    // NSTextField has issues with a text measurement, it underestimates height of a text for a given maximum width.
    const CGFloat correction = 4;

    self.textLabel.preferredMaxLayoutWidth = (self.textLabel.frame.size.width - correction);
  }}

  // * * *.

  [super layout];
}

#pragma mark -

- (void) awakeFromNib
{
  [super awakeFromNib];

  // * * *.

  [self addObserver: self forKeyPath: NSStringFromSelector(@selector(objectValue)) options: 0 context: &ObjectValueKVOContext];
}

#pragma mark - Key-Value Observation

- (void) observeValueForKeyPath: (NSString*) keyPath ofObject: (id) object change: (NSDictionary<NSString*,id>*) change context: (void*) context
{
  if(context == &ObjectValueKVOContext)
  {
    // Text.
    self.textLabel.objectValue = self.objectValue;
  }
  else
  {
    [super observeValueForKeyPath: keyPath ofObject: object change: change context: context];
  }
}

@end
