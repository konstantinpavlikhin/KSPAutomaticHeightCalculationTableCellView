//
//  KSPAutomaticHeightCalculationTableCellView+Private.h
//  KSPAutomaticHeightCalculationTableCellView
//
//  Created by Konstantin Pavlikhin on 13.10.14.
//  Copyright (c) 2014 Konstantin Pavlikhin. All rights reserved.
//

#import "KSPAutomaticHeightCalculationTableCellView.h"

@interface KSPAutomaticHeightCalculationTableCellView ()

/// Subclasses should override this method and return YES if they have a fixed height. By default returns NO.
+ (BOOL) hasFixedHeight;

@end
