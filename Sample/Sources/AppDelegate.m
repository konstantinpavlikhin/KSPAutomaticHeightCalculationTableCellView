//
//  AppDelegate.m
//  Sample
//
//  Created by Konstantin Pavlikhin on 01.09.16.
//  Copyright © 2016 Konstantin Pavlikhin. All rights reserved.
//

#import "AppDelegate.h"

#import "AHCUsersViewController.h"

#import "AHCMessagesViewController.h"

@interface AppDelegate ()

@property(weak) IBOutlet NSWindow* window;

@end

@implementation AppDelegate
{
  AHCUsersViewController* _usersViewController;

  AHCMessagesViewController* _messagesViewController;
}

- (void) applicationDidFinishLaunching: (NSNotification*) aNotification
{
  {{
    _usersViewController = [[AHCUsersViewController alloc] initWithNibName: @"AHCUsersView" bundle: nil];

    _usersViewController.view.translatesAutoresizingMaskIntoConstraints = NO;

    [self.window.contentView addSubview: _usersViewController.view];

    // * * *.

    _messagesViewController = [[AHCMessagesViewController alloc] initWithNibName: @"AHCMessagesView" bundle: nil];

    _messagesViewController.view.translatesAutoresizingMaskIntoConstraints = NO;

    [self.window.contentView addSubview: _messagesViewController.view];

    // * * *.

    NSDictionary* const views = @{@"usersView": _usersViewController.view,

                                  @"messagesView": _messagesViewController.view};

    [self.window.contentView addConstraints: [NSLayoutConstraint constraintsWithVisualFormat: @"H:|[usersView(>=200@1000)][messagesView(>=200@1000)]|" options: 0 metrics: nil views: views]];

    [self.window.contentView addConstraints: [NSLayoutConstraint constraintsWithVisualFormat: @"V:|[usersView]|" options: 0 metrics: nil views: views]];

    [self.window.contentView addConstraints: [NSLayoutConstraint constraintsWithVisualFormat: @"V:|[messagesView]|" options: 0 metrics: nil views: views]];
  }}
}

@end
