//
//  MASOuterSpaceVableViewController.h
//  Out of This World
//
//  Created by Mark Stuver on 10/19/13.
//  Copyright (c) 2013 Halo International Corp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MASAddObjectViewController.h"

/// Conform to AddSpaceVC protocol
@interface MASOuterSpaceVableViewController : UITableViewController <MASAddSpaceViewControllerDelegate>

@property (strong, nonatomic) NSMutableArray *planets;
@property (strong, nonatomic) NSMutableArray *addedSpaceObjects;

@end
