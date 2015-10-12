//
//  KSPAutomaticHeightCalculationTableCellView+Private.h
//  KSPAutomaticHeightCalculationTableCellView
//
//  Created by Konstantin Pavlikhin on 13.10.14.
//  Copyright (c) 2015 Konstantin Pavlikhin. All rights reserved.
//

#import "KSPAutomaticHeightCalculationTableCellView.h"

@interface KSPAutomaticHeightCalculationTableCellView ()

/// A bundle to look for a corresponding nib file. Default implementation returns the main bundle.
+ (nonnull NSBundle*) correspondingBundle;

/// Subclasses should override this method and return YES if they have a fixed height. By default returns NO.
+ (BOOL) hasFixedHeight;

/// Specifies if a cell instance is used as a prototype.
@property(readwrite, assign, nonatomic, getter=isPrototype) BOOL prototype;

@end
