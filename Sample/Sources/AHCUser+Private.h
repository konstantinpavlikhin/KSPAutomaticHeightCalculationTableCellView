//
//  AHCUser+Private.h
//  KSPAutomaticHeightCalculationTableCellView
//
//  Created by Konstantin Pavlikhin on 01.09.16.
//  Copyright © 2016 Konstantin Pavlikhin. All rights reserved.
//

#import "AHCUser.h"

NS_ASSUME_NONNULL_BEGIN

@interface AHCUser ()

@property(readwrite, strong, nonatomic) NSString* name;

@property(readwrite, strong, nonatomic) NSImage* avatar;

@property(readwrite, strong, nonatomic, nullable) NSString* status;

@end

NS_ASSUME_NONNULL_END
