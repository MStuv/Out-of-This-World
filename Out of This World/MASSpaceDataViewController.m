//
//  MASSpaceDataViewController.m
//  Out of This World
//
//  Created by Mark Stuver on 10/28/13.
//  Copyright (c) 2013 Halo International Corp. All rights reserved.
//

#import "MASSpaceDataViewController.h"

@interface MASSpaceDataViewController ()

@end

@implementation MASSpaceDataViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor blackColor];
    self.tableview.backgroundColor = [UIColor clearColor];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    /// This mean the variable will used for the entire life cycle of the application
    /// CellIndentifier is linked to the TableViewCell designated in the storyboard
    static NSString *CellIndentifier = @"DataCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIndentifier forIndexPath:indexPath];
    
    
    /// Use a switch statement when a integer is used instead of an IF statement
    /// Switch statments are not used often
    switch (indexPath.row)
    {
            /// if the agrument, which in this case is indexPath.row, is equal to the case integer, 0, then run this code.
            /// when a break; is reached, the program jumps completely out of the switch statement and continues to the next method.
        case 0:
            cell.textLabel.text = @"Nickname:";
            cell.detailTextLabel.text = self.spaceObject.nickname;
            break;
            
        case 1:
            cell.textLabel.text = @"Diameter (km):";
            cell.detailTextLabel.text = [NSString stringWithFormat:@"%f", self.spaceObject.diameter];
            break;
            
        case 2:
            cell.textLabel.text = @"Gravitational Force:";
            cell.detailTextLabel.text = [NSString stringWithFormat:@"%f", self.spaceObject.gravitationalForce];
            break;
            
        case 3:
            cell.textLabel.text = @"Length of a Year (days):";
            cell.detailTextLabel.text = [NSString stringWithFormat:@"%f", self.spaceObject.yearLength];
            break;
            
        case 4:
            cell.textLabel.text = @"Length of a Day (hours):";
            cell.detailTextLabel.text = [NSString stringWithFormat:@"%f", self.spaceObject.dayLength];
            break;
            
        case 5:
            cell.textLabel.text = @"Temperature (celsius):";
            cell.detailTextLabel.text = [NSString stringWithFormat:@"%f", self.spaceObject.temperature];
            break;
            
        case 6:
            cell.textLabel.text = @"Number of Moons:";
            cell.detailTextLabel.text = [NSString stringWithFormat:@"%i", self.spaceObject.numberOfMoons];
            break;
            
        case 7:
            cell.textLabel.text = @"Interesting Fact:";
            cell.detailTextLabel.text = self.spaceObject.interestFact;
            break;
   
        default:
            break;
    }
    
    return cell;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 8;
}

@end
