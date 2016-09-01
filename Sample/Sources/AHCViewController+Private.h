//
//  AHCViewController+Private.h
//  KSPAutomaticHeightCalculationTableCellView
//
//  Created by Konstantin Pavlikhin on 01.09.16.
//  Copyright © 2016 Konstantin Pavlikhin. All rights reserved.
//

#import "AHCViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface AHCViewController () <NSTableViewDataSource, NSTableViewDelegate>

@property(readwrite, strong, nonatomic) IBOutlet NSTableView* tableView;

@property(readwrite, strong, nonatomic) IBOutlet NSTableColumn* mainColumn;

@end

NS_ASSUME_NONNULL_END
