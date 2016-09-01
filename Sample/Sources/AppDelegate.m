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

@property(readwrite, strong, nonatomic) IBOutlet NSView* leftPane;

@property(readwrite, strong, nonatomic) IBOutlet NSView* rightPane;

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

    [self.leftPane addSubview: _usersViewController.view];

    // * * *.

    NSDictionary* const views = @{@"usersView": _usersViewController.view};

    [self.leftPane addConstraints: [NSLayoutConstraint constraintsWithVisualFormat: @"H:|[usersView(>=150@1000)]|" options: 0 metrics: nil views: views]];

    [self.leftPane addConstraints: [NSLayoutConstraint constraintsWithVisualFormat: @"V:|[usersView(>=150@1000)]|" options: 0 metrics: nil views: views]];
  }}

  // * * *.

  {{
    _messagesViewController = [[AHCMessagesViewController alloc] initWithNibName: @"AHCMessagesView" bundle: nil];

    _messagesViewController.view.translatesAutoresizingMaskIntoConstraints = NO;

    [self.rightPane addSubview: _messagesViewController.view];

    // * * *.

    NSDictionary* const views = @{@"messagesView": _messagesViewController.view};

    [self.rightPane addConstraints: [NSLayoutConstraint constraintsWithVisualFormat: @"H:|[messagesView(>=200@1000)]|" options: 0 metrics: nil views: views]];

    [self.rightPane addConstraints: [NSLayoutConstraint constraintsWithVisualFormat: @"V:|[messagesView(>=150@1000)]|" options: 0 metrics: nil views: views]];
  }}
}

@end
