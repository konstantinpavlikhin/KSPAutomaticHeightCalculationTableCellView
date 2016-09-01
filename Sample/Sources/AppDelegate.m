//
//  AppDelegate.m
//  Sample
//
//  Created by Konstantin Pavlikhin on 01.09.16.
//  Copyright © 2016 Konstantin Pavlikhin. All rights reserved.
//

#import "AppDelegate.h"

#import "AHCUsersViewController.h"

@interface AppDelegate ()

@property(weak) IBOutlet NSWindow* window;

@end

@implementation AppDelegate
{
  AHCUsersViewController* _usersViewController;
}

- (void) applicationDidFinishLaunching: (NSNotification*) aNotification
{
  {{
    _usersViewController = [[AHCUsersViewController alloc] initWithNibName: @"AHCUsersView" bundle: nil];

    _usersViewController.view.translatesAutoresizingMaskIntoConstraints = NO;

    [self.window.contentView addSubview: _usersViewController.view];

    NSDictionary* const views = @{@"usersView": _usersViewController.view};

    [self.window.contentView addConstraints: [NSLayoutConstraint constraintsWithVisualFormat: @"H:|[usersView]|" options: 0 metrics: nil views: views]];

    [self.window.contentView addConstraints: [NSLayoutConstraint constraintsWithVisualFormat: @"V:|[usersView]|" options: 0 metrics: nil views: views]];
  }}
}

@end
