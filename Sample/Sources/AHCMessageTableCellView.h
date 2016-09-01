//
//  AHCMessageTableCellView.h
//  KSPAutomaticHeightCalculationTableCellView
//
//  Created by Konstantin Pavlikhin on 01.09.16.
//  Copyright © 2016 Konstantin Pavlikhin. All rights reserved.
//

#import <KSPAutomaticHeightCalculationTableCellView/KSPAutomaticHeightCalculationTableCellView+Private.h>

@interface AHCMessageTableCellView : KSPAutomaticHeightCalculationTableCellView

@property(readwrite, strong, atomic, nullable) NSString* objectValue;

@end
