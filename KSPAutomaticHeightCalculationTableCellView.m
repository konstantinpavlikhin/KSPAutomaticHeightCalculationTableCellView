//
//  KSPAutomaticHeightCalculationTableCellView.m
//  KSPAutomaticHeightCalculationTableCellView
//
//  Created by Konstantin Pavlikhin on 13.10.14.
//  Copyright (c) 2015 Konstantin Pavlikhin. All rights reserved.
//

#import "KSPAutomaticHeightCalculationTableCellView+Private.h"

#import <objc/runtime.h>

@implementation KSPAutomaticHeightCalculationTableCellView

#pragma mark - NSView Overrides

+ (BOOL) requiresConstraintBasedLayout
{
  return YES;
}

#pragma mark - Prototype Cell View

+ (nullable KSPAutomaticHeightCalculationTableCellView*) prototypeCell
{
  return objc_getAssociatedObject(self, @selector(prototypeCell));
}

+ (void) setPrototypeCell: (nullable KSPAutomaticHeightCalculationTableCellView*) prototypeCell
{
  objc_setAssociatedObject(self, @selector(prototypeCell), prototypeCell, OBJC_ASSOCIATION_RETAIN);
}

#pragma mark - Width Constraint

+ (nullable NSLayoutConstraint*) widthConstraint
{
  return objc_getAssociatedObject(self, @selector(widthConstraint));
}

+ (void) setWidthConstraint: (nullable NSLayoutConstraint*) widthConstraint
{
  objc_setAssociatedObject(self, @selector(widthConstraint), widthConstraint, OBJC_ASSOCIATION_RETAIN);
}

#pragma mark - Cached Height

+ (nullable NSNumber*) cachedHeight
{
  return objc_getAssociatedObject(self, @selector(cachedHeight));
}

+ (void) setCachedheight: (nullable NSNumber*) cachedHeight
{
  objc_setAssociatedObject(self, @selector(cachedHeight), cachedHeight, OBJC_ASSOCIATION_RETAIN);
}

+ (BOOL) hasCachedHeight
{
  return ([self cachedHeight] != nil);
}

#pragma mark -

+ (nonnull NSString*) correspondingNibName
{
  return NSStringFromClass([self class]);
}

+ (nonnull NSBundle*) correspondingBundle
{
  return [NSBundle mainBundle];
}

+ (BOOL) hasFixedHeight
{
  return NO;
}

+ (CGFloat) heightWithRepresentedObject: (nullable id) object width: (CGFloat) width configurationBlock: (nullable KSPTableCellViewConfigurationBlock) blockOrNil
{
  // If we have a fixed-height prototype and height has already been calculated — return the cached value.
  if([self hasFixedHeight] && [self hasCachedHeight]) return [self cachedHeight].doubleValue;
  
  // Give a prototype cell a chance to reset any applied customizations.
  [[self prototypeCell] prepareForReuse];
  
  if(![self prototypeCell])
  {
    // Instantiate a prototype cell.
    NSArray* topLevelObjects = nil;
    
    BOOL result = [[[NSNib alloc] initWithNibNamed: [self correspondingNibName] bundle: [self correspondingBundle]] instantiateWithOwner: nil topLevelObjects: &topLevelObjects];
    
    NSAssert(result, @"Unable to instantiate nib file.");
    
    [self setPrototypeCell: [[topLevelObjects filteredArrayUsingPredicate: [NSPredicate predicateWithFormat: @"self isKindOfClass: %@", self]] firstObject]];

    // Let the cell instance know that it will be used as a prototype.
    [self prototypeCell].prototype = YES;

    // Keep the constraint for performance considerations and vary its 'constant' property.
    [self setWidthConstraint: [NSLayoutConstraint constraintWithItem: [self prototypeCell] attribute: NSLayoutAttributeWidth relatedBy: NSLayoutRelationEqual toItem: nil attribute: NSLayoutAttributeNotAnAttribute multiplier: 1 constant: 0]];
    
    [[self prototypeCell] addConstraint: [self widthConstraint]];
  }
  
  [self widthConstraint].constant = width;
  
  // Fill the cell with information.
  [self prototypeCell].objectValue = object;
  
  // Let the passed block configure the cell.
  if(blockOrNil) blockOrNil([self prototypeCell]);
  
  // Ensure that layout is up to date.
  [[self prototypeCell] layoutSubtreeIfNeeded];
  
  // Calculate and store the minimum possible height.
  [self setCachedheight: @([[self prototypeCell] fittingSize].height)];
  
  // For a fixed-height cells these objects are no longer needed.
  if([self hasFixedHeight])
  {
    // Release the prototype cell.
    [self setPrototypeCell: nil];
    
    // Release the width constraint.
    [self setWidthConstraint: nil];
  }
  
  NSAssert([self cachedHeight].doubleValue > 0, @"Calculated cell height is zero. Table view will complain!");
  
  return [self cachedHeight].doubleValue;
}

+ (CGFloat) heightWithRepresentedObject: (nullable id) object width: (CGFloat) width
{
  return [self heightWithRepresentedObject: object width: width configurationBlock: nil];
}

@end
