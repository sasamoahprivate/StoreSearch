//
//  AppDelegate.h
//  StoreSearch
//
//  Created by Stephen Asamoah on 28/04/2012.
//  Copyright (c) 2012 CO-267 Jacobs Consultancy Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SearchViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) SearchViewController *viewController;

@end
