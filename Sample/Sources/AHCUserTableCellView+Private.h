//
//  AHCUserTableCellView+Private.h
//  KSPAutomaticHeightCalculationTableCellView
//
//  Created by Konstantin Pavlikhin on 01.09.16.
//  Copyright © 2016 Konstantin Pavlikhin. All rights reserved.
//

#import "AHCUserTableCellView.h"

@interface AHCUserTableCellView ()

@property(readwrite, strong, nonatomic) IBOutlet NSImageView* avatarView;

@property(readwrite, strong, nonatomic) IBOutlet NSView* centeringContainer;

@property(readwrite, strong, nonatomic) IBOutlet NSTextField* nameLabel;

@property(readwrite, strong, nonatomic) IBOutlet NSLayoutConstraint* nameLabelBottomConstraint;

@property(readwrite, strong, nonatomic) IBOutlet NSTextField* statusLabel;

@end
