//
//  AHCUserTableCellView.m
//  KSPAutomaticHeightCalculationTableCellView
//
//  Created by Konstantin Pavlikhin on 01.09.16.
//  Copyright © 2016 Konstantin Pavlikhin. All rights reserved.
//

#import "AHCUserTableCellView+Private.h"

#import "AHCUser.h"

// * * *.

static void* ObjectValueKVOContext;

// * * *.

@implementation AHCUserTableCellView

@dynamic objectValue;

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
    // Avatar.
    self.avatarView.image = self.objectValue.avatar;

    // Name.
    self.nameLabel.objectValue = self.objectValue.name;

    // Status.
    const BOOL shouldHaveStatusLabelInTheUI = (self.objectValue.status.length > 0);

    if(shouldHaveStatusLabelInTheUI)
    {
      if(!self.statusLabel.superview)
      {
        [self.centeringContainer removeConstraint: self.nameLabelBottomConstraint];

        self.statusLabel.translatesAutoresizingMaskIntoConstraints = NO;

        [self.centeringContainer addSubview: self.statusLabel];

        NSDictionary* const views = @{@"nameLabel": self.nameLabel, @"statusLabel": self.statusLabel};

        [self.centeringContainer addConstraints: [NSLayoutConstraint constraintsWithVisualFormat: @"H:|[statusLabel]-(>=0)-|" options: 0 metrics: nil views: views]];

        [self.centeringContainer addConstraints: [NSLayoutConstraint constraintsWithVisualFormat: @"V:[nameLabel]-2-[statusLabel]|" options: 0 metrics: nil views: views]];
      }
    }
    else
    {
      if(self.statusLabel.superview)
      {
        [self.statusLabel removeFromSuperview];

        self.nameLabelBottomConstraint = [NSLayoutConstraint constraintWithItem: self.nameLabel attribute: NSLayoutAttributeBottom relatedBy: NSLayoutRelationEqual toItem: self.centeringContainer attribute: NSLayoutAttributeBottom multiplier: 1 constant: 0];

        [self.centeringContainer addConstraint: self.nameLabelBottomConstraint];
      }
    }
  }
  else
  {
    [super observeValueForKeyPath: keyPath ofObject: object change: change context: context];
  }
}

@end
