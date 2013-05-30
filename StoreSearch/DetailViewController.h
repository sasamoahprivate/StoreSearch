//
//  DetailViewControllerViewController.h
//  StoreSearch
//
//  Created by Stephen Asamoah on 13/05/2012.
//  Copyright (c) 2012 CO-267 Jacobs Consultancy Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SearchResult;


@interface DetailViewController : UIViewController

@property (nonatomic, strong) SearchResult *searhResult;

- (void)presentInParentViewController:(UIViewController *)parentViewController;
- (void)dismissFromParentViewController;

@end
