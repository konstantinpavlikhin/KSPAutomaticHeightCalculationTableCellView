//
//  AHCUserTableCellView.h
//  KSPAutomaticHeightCalculationTableCellView
//
//  Created by Konstantin Pavlikhin on 01.09.16.
//  Copyright © 2016 Konstantin Pavlikhin. All rights reserved.
//

#import <KSPAutomaticHeightCalculationTableCellView/KSPAutomaticHeightCalculationTableCellView+Private.h>

// * * *.

@class AHCUser;

// * * *.

@interface AHCUserTableCellView : KSPAutomaticHeightCalculationTableCellView

@property(readwrite, strong, atomic, nullable) AHCUser* objectValue;

@end
