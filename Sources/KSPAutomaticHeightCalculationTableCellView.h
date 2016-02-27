//
//  KSPAutomaticHeightCalculationTableCellView.h
//  KSPAutomaticHeightCalculationTableCellView
//
//  Created by Konstantin Pavlikhin on 13.10.14.
//  Copyright (c) 2016 Konstantin Pavlikhin. All rights reserved.
//

#import <Cocoa/Cocoa.h>

// * * *.

@class KSPAutomaticHeightCalculationTableCellView;

// * * *.

typedef void (^KSPTableCellViewConfigurationBlock)(KSPAutomaticHeightCalculationTableCellView* _Nonnull);

// * * *.

/// This class is responsible for instantiation and height measurement of a "dummy" table cell view.
@interface KSPAutomaticHeightCalculationTableCellView : NSTableCellView

/// Override to return a corresponding nib name. Default implementation simply returns the class name.
+ (nonnull NSString*) correspondingNibName;

/// Given a content object, width of a presenting table column and a cell configuration block calculates the minimum possible height of a cell.
+ (CGFloat) heightWithRepresentedObject: (nullable id) object width: (CGFloat) width configurationBlock: (nullable KSPTableCellViewConfigurationBlock) blockOrNil;

+ (CGFloat) heightWithRepresentedObject: (nullable id) object width: (CGFloat) width;

@end
