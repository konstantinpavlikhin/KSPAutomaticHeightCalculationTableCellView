//
//  AHCUser.m
//  KSPAutomaticHeightCalculationTableCellView
//
//  Created by Konstantin Pavlikhin on 01.09.16.
//  Copyright © 2016 Konstantin Pavlikhin. All rights reserved.
//

#import "AHCUser+Private.h"

#import <AppKit/AppKit.h>

NS_ASSUME_NONNULL_BEGIN

@implementation AHCUser

#pragma mark - Initialization

- (instancetype) init
{
  return [self initWithName: @"" avatar: [NSImage imageNamed: NSImageNameUser] status: nil];
}

- (instancetype) initWithName: (NSString*) name avatar: (NSImage*) avatar status: (nullable NSString*) statusOrNil
{
  self = [super init];

  if(!self) return nil;

  _name = name;

  _avatar = avatar;

  _status = statusOrNil;

  return self;
}

@end

NS_ASSUME_NONNULL_END
