//
//  MASSpaceDataViewController.h
//  Out of This World
//
//  Created by Mark Stuver on 10/28/13.
//  Copyright (c) 2013 Halo International Corp. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "MASSpaceObject.h"

/// Conforming to the tableview dataSource & delegate protocols
@interface MASSpaceDataViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *tableview;

@property (strong, nonatomic) MASSpaceObject *spaceObject;
@end
