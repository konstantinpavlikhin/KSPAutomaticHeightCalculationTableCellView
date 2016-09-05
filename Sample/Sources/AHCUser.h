//
//  AHCUser.h
//  KSPAutomaticHeightCalculationTableCellView
//
//  Created by Konstantin Pavlikhin on 01.09.16.
//  Copyright © 2016 Konstantin Pavlikhin. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface AHCUser : NSObject

- (instancetype) initWithName: (NSString*) name avatar: (NSImage*) avatar status: (nullable NSString*) statusOrNil NS_DESIGNATED_INITIALIZER;

@property(readonly, strong, nonatomic) NSString* name;

@property(readonly, strong, nonatomic) NSImage* avatar;

@property(readonly, strong, nonatomic, nullable) NSString* status;

@end

NS_ASSUME_NONNULL_END
