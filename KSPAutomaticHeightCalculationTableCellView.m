//
//  KSPAutomaticHeightCalculationTableCellView.m
//  KSPAutomaticHeightCalculationTableCellView
//
//  Created by Konstantin Pavlikhin on 13.10.14.
//  Copyright (c) 2014 Konstantin Pavlikhin. All rights reserved.
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

+ (NSTableCellView*) prototype
{
  return objc_getAssociatedObject(self, @selector(prototype));
}

+ (void) setPrototype: (NSTableCellView*) prototype
{
  objc_setAssociatedObject(self, @selector(prototype), prototype, OBJC_ASSOCIATION_RETAIN);
}

#pragma mark - Width Constraint

+ (NSLayoutConstraint*) widthConstraint
{
  return objc_getAssociatedObject(self, @selector(widthConstraint));
}

+ (void) setWidthConstraint: (NSLayoutConstraint*) widthConstraint
{
  objc_setAssociatedObject(self, @selector(widthConstraint), widthConstraint, OBJC_ASSOCIATION_RETAIN);
}

#pragma mark - Cached Height

+ (NSNumber*) cachedHeight
{
  return objc_getAssociatedObject(self, @selector(cachedHeight));
}

+ (void) setCachedheight: (NSNumber*) cachedHeight
{
  objc_setAssociatedObject(self, @selector(cachedHeight), cachedHeight, OBJC_ASSOCIATION_RETAIN);
}

+ (BOOL) hasCachedHeight
{
  return ([self cachedHeight] != nil);
}

#pragma mark -

+ (NSString*) correspondingNibName
{
  return NSStringFromClass([self class]);
}

+ (NSBundle*) correspondingBundle
{
  return [NSBundle mainBundle];
}

+ (BOOL) hasFixedHeight
{
  return NO;
}

+ (CGFloat) heightWithRepresentedObject: (id) object width: (CGFloat) width configurationBlock: (KSPTableCellViewConfigurationBlock) blockOrNil
{
  // If we have a fixed-height prototype and height has already been calculated — return the cached value.
  if([self hasFixedHeight] && [self hasCachedHeight]) return [self cachedHeight].doubleValue;
  
  // Give a prototype cell a chance to reset any applied customizations.
  [[self prototype] prepareForReuse];
  
  if(![self prototype])
  {
    // Instantiate a prototype cell.
    NSArray* topLevelObjects = nil;
    
    BOOL result = [[[NSNib alloc] initWithNibNamed: [self correspondingNibName] bundle: [self correspondingBundle]] instantiateWithOwner: nil topLevelObjects: &topLevelObjects];
    
    NSAssert(result, @"Unable to instantiate nib file.");
    
    [self setPrototype: [[topLevelObjects filteredArrayUsingPredicate: [NSPredicate predicateWithFormat: @"self isKindOfClass: %@", self]] firstObject]];
    
    // Keep the constraint for performance considerations and vary its 'constant' property.
    [self setWidthConstraint: [NSLayoutConstraint constraintWithItem: [self prototype] attribute: NSLayoutAttributeWidth relatedBy: NSLayoutRelationEqual toItem: nil attribute: NSLayoutAttributeNotAnAttribute multiplier: 1 constant: 0]];
    
    [[self prototype] addConstraint: [self widthConstraint]];
  }
  
  [self widthConstraint].constant = width;
  
  // Fill the cell with information.
  [self prototype].objectValue = object;
  
  // Let the passed block configure the cell.
  if(blockOrNil) blockOrNil([self prototype]);
  
  // Ensure that layout is up to date.
  [[self prototype] layoutSubtreeIfNeeded];
  
  // Calculate and store the minimum possible height.
  [self setCachedheight: @([[self prototype] fittingSize].height)];
  
  // For a fixed-height cells these objects are no longer needed.
  if([self hasFixedHeight])
  {
    // Release the prototype cell.
    [self setPrototype: nil];
    
    // Release the width constraint.
    [self setWidthConstraint: nil];
  }
  
  NSAssert([self cachedHeight].doubleValue > 0, @"Calculated cell height is zero. Table view will complain!");
  
  return [self cachedHeight].doubleValue;
}

+ (CGFloat) heightWithRepresentedObject: (id) object width: (CGFloat) width
{
  return [self heightWithRepresentedObject: object width: width configurationBlock: nil];
}

@end
