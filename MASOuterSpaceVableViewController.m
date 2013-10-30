//
//  MASOuterSpaceVableViewController.m
//  Out of This World
//
//  Created by Mark Stuver on 10/19/13.
//  Copyright (c) 2013 Halo International Corp. All rights reserved.
//

#import "MASOuterSpaceVableViewController.h"
#import "AstronomicalData.h"
#import "MASSpaceObject.h"
#import "MASSpaceImageViewController.h"
#import "MASSpaceDataViewController.h"

@interface MASOuterSpaceVableViewController ()

@end

@implementation MASOuterSpaceVableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.planets = [[NSMutableArray alloc] init];
    
    // Enumerating through the NSDictionarys using the allKnownPlanets class method in AstromicalData Class
    for (NSMutableDictionary *planetData in [AstronomicalData allKnownPlanets]) {
        
        // Creating a string of the image name for each planet. The images are the name of the planet so we are utilizing the PLANET_NAME key in the current dictionary to create a stringWithFormat and adding .jpg to the string
        NSString *imageName = [NSString stringWithFormat:@"%@.jpg", planetData[PLANET_NAME]];
        
        // Creating an instance of MASSpaceObject and initializing it with the custom Designated Initializer, passing the current dictionary data and the imageNamed based on the NSString above.
        MASSpaceObject *planet = [[MASSpaceObject alloc] initWithData:planetData andImage:[UIImage imageNamed:imageName]];
        
        // loading the instance of MASSpaceObject into the planets array.
        [self.planets addObject:planet];
    }
}

// Method used to pass arguments from the current viewController to another viewCotroller through the segue that was connected in Storyboard

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender

// This part of prepareForSegue method is for passing data to the SpaceImageViewController when the row is touched


        /* 'sender' is type (id) which can take any object, in this method, it is equal to the current tableViewCell. Although 'sender' can take any object, it is very important that we know what the object type is so we call its methods or access its properties. To figure out what class type the object has, we use introspection to validate the type of the incoming object */
{
    /* Calling the isKindOfClass method on the sender object will compare the current viewController's Class to the class of the UITableViewCell.
     
     If the sender is of the correct class, the 'if logic' will trigger to the next conditional...*/
    if ([sender isKindOfClass:[UITableViewCell class]]) {
        
    /* Segue has a .destinationViewController property that will access the incoming viewController's class so that it can be checked using the isKindOfClass method
     
     If the segue.destinationViewController (incoming viewController) is of the correct class, the next 'if logic' will trigger and the object properties will be passed to the incoming viewController */
        if ([segue.destinationViewController isKindOfClass:[MASSpaceImageViewController class]]) {
            
            // Create an instance of the incoming viewController and set its value to segue.destinationViewController
            MASSpaceImageViewController *nextViewController = segue.destinationViewController;
            
            // Create an instance of NSIndexPath so that the current indexPath can be obtained to assure we are pasing the proper object properties
            NSIndexPath *path = [self.tableView indexPathForCell:sender];
            
            // Create an instance of the object and set its value from the object array at the previously determined indexPath's row (path.row)
            MASSpaceObject *selectedObject;
            
/// if section is 0, set selectedObject to the spaceObject that is at the current indexPath.row of the planets array!
            if (path.section == 0) {
                selectedObject = self.planets[path.row];
                
/// if section is 1, set selectedObject to the spaceObject that is at the current indexPath.row of the addedSpaceObjects array!
            } else if (path.section ==1){
                selectedObject = self.addedSpaceObjects[path.row];
            }
            
            // Set the object property from the incoming/destination viewController to the value of the current viewController's selectedObject
            /// set spaceObject property from the targetVC to the selectedObject

            nextViewController.spaceObject = selectedObject;
        }
    }
    
    
    
//This part of the prepareForSegue method is for passing the data to the SpaceDataTableViewController when the accessory button is touched.
    
    if  ([sender isKindOfClass:[NSIndexPath class]])
    {
        if ([segue.destinationViewController isKindOfClass:[MASSpaceDataViewController class]])
        {
            MASSpaceDataViewController *targetViewController = segue.destinationViewController;
            
            NSIndexPath *path = sender;
            MASSpaceObject *selectedObject;

/// Same change as above:
            
        /// if section is 0, set selectedObject to the spaceObject that is at the current indexPath.row of the planets array!
            if (path.section == 0) {
                selectedObject = self.planets[path.row];
                
        /// if section is 1, set selectedObject to the spaceObject that is at the current indexPath.row of the addedSpaceObjects array!
            } else if (path.section ==1){
                selectedObject = self.addedSpaceObjects[path.row];
            }
            
        /// set spaceObject property from the targetVC to the selectedObject
            targetViewController.spaceObject = selectedObject;
        }
    }
    
    
/// This part of prepareForSegue, is setting the protocol property from the AddObjectVC delegate to self.
    if ([segue.destinationViewController isKindOfClass:[MASAddObjectViewController class]]) {
        
        /// Creating instance of MASAddObjectVC and setting it to the segue destination
        MASAddObjectViewController *addSpaceObjectVC = segue.destinationViewController;
        /// Set as delegate
        addSpaceObjectVC.delegate = self;
        }
    
    }


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/// Methods will be called from MASAddObjectViewController
#pragma mark - MASAddObjectViewController Delegate

-(void)didCancel
{
    NSLog(@"didCancel");
    /// Dismiss AddObjectVC
    [self dismissViewControllerAnimated:YES completion:nil];
    
}


//-(void)addSpaceObject
//{
//    /// Dismiss AddObjectVC
//    NSLog(@"addSpaceObject");
//    [self dismissViewControllerAnimated:YES completion:nil];
//}

-(void)addSpaceObject:(MASSpaceObject *)spaceObject
{
    /// if addedSpaceObjects array does not exsist...
    if (!self.addedSpaceObjects) {
        /// ...create it
        self.addedSpaceObjects = [[NSMutableArray alloc] init];
    }
    
    /// add the spaceObject that is being passed from the delegate method into the array.
    /// all new spaceObjects created will be stored in the addedSpaceObjects array
    [self.addedSpaceObjects addObject:spaceObject];
    
    
    /// Dismiss AddObjectVC
    NSLog(@"addSpaceObject");
    [self dismissViewControllerAnimated:YES completion:nil];
    
    /// Reload Data in tableView
    [self.tableView reloadData];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    
    // If the user added a spaceObject - Return that there should be 2 sections
    if ([self.addedSpaceObjects count]) {
        return 2;
        // If not, return that there is only 1 section
    } else {
        return 1;
    }
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    
    // If the section is 1, use the count of the added SpaceObjects to figure the amount of rows
    if (section == 1) {
        
        return [self.addedSpaceObjects count];
    } else {
         return [self.planets count];
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
    if (indexPath.section ==1) {
        /// Use new space object to customize the cell
    /// Create instance of spaceObject and set it to the new object at the current indexPath's row
        MASSpaceObject *planet = [self.addedSpaceObjects objectAtIndex:indexPath.row];
        cell.textLabel.text = planet.name;
        cell.detailTextLabel.text = planet.nickname;
        cell.imageView.image = planet.spaceImage;
        
    } else {
    
        // Access the MASSpaceObject from plants array and use its properties to update the cell's properties
        MASSpaceObject *planet = [self.planets objectAtIndex:indexPath.row];
        cell.textLabel.text = planet.name;
        cell.detailTextLabel.text = planet.nickname;
        cell.imageView.image = planet.spaceImage;
    }
    
        // Customize the appearance of the TableViewCells
        // Setting the cell background to clear
        cell.backgroundColor = [UIColor clearColor];
        
        // Setting the textLabel color to white
        cell.textLabel.textColor = [UIColor whiteColor];
        
        // Setting the detailTextLabel color to off white
        cell.detailTextLabel.textColor = [UIColor colorWithWhite:0.5 alpha:1.0];
        
        return cell;
    
}

#pragma mark - UITableViewDelegate

-(void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"push to space data" sender:indexPath];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

@end
