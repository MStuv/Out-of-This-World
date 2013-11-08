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

/// This code is here instead of the header file because this is part of a private API.
/// We are defining a
#define ADDED_SPACE_OBJECTS_KEY @"Added Space Objects Array"


#pragma mark - Lazy Instantiation of Properties
// These methods (planets & addedSpaceObjects) will run every time the planets or addSpaceObjects properties are called.

// override getter of the planets array property to alloc & init if it has not been done yet.
-(NSMutableArray *)planets
{
    if (!_planets) {
        _planets = [[NSMutableArray alloc] init];
    }
    return _planets;
}

// override the getter of the addedSpaceObjects array property to alloc & init if it has not been done yet.
-(NSMutableArray *)addedSpaceObjects
{
    if (!_addedSpaceObjects) {
        _addedSpaceObjects = [[NSMutableArray alloc] init];
    }
    return _addedSpaceObjects;
}

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

    //Removed since the planets array had been created in the Lazy instantiation above
    //self.planets = [[NSMutableArray alloc] init];
    
    // Enumerating through the NSDictionarys using the allKnownPlanets class method in AstromicalData Class
    for (NSMutableDictionary *planetData in [AstronomicalData allKnownPlanets]) {
        
        // Creating a string of the image name for each planet. The images are the name of the planet so we are utilizing the PLANET_NAME key in the current dictionary to create a stringWithFormat and adding .jpg to the string
        NSString *imageName = [NSString stringWithFormat:@"%@.jpg", planetData[PLANET_NAME]];
        
        // Creating an instance of MASSpaceObject and initializing it with the custom Designated Initializer, passing the current dictionary data and the imageNamed based on the NSString above.
        MASSpaceObject *planet = [[MASSpaceObject alloc] initWithData:planetData andImage:[UIImage imageNamed:imageName]];
        
        // loading the instance of MASSpaceObject into the planets array.
        [self.planets addObject:planet];
    }
  
/// Loading data from NSUserDefaults
    
    NSArray *myPlanetsAsPropertyLists = [[NSUserDefaults standardUserDefaults] arrayForKey:ADDED_SPACE_OBJECTS_KEY];
    
    /// iterate through the array
    for (NSDictionary *dictionary in myPlanetsAsPropertyLists) {
        /// pull out a MASSpaceObject object set with the spaceObjectForDictionary: helper method.
        MASSpaceObject *spaceObject = [self spaceObjectForDictionary:dictionary];
        
        /// add the spaceObject to the
        [self.addedSpaceObjects addObject:spaceObject];
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
            
// if section is 0, set selectedObject to the spaceObject that is at the current indexPath.row of the planets array!
            if (path.section == 0) {
                selectedObject = self.planets[path.row];
                
// if section is 1, set selectedObject to the spaceObject that is at the current indexPath.row of the addedSpaceObjects array!
            } else if (path.section ==1){
                selectedObject = self.addedSpaceObjects[path.row];
            }
            
            // Set the object property from the incoming/destination viewController to the value of the current viewController's selectedObject
            // set spaceObject property from the targetVC to the selectedObject

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

// Same change as above:
            
        // if section is 0, set selectedObject to the spaceObject that is at the current indexPath.row of the planets array!
            if (path.section == 0) {
                selectedObject = self.planets[path.row];
                
        // if section is 1, set selectedObject to the spaceObject that is at the current indexPath.row of the addedSpaceObjects array!
            } else if (path.section ==1){
                selectedObject = self.addedSpaceObjects[path.row];
            }
            
        // set spaceObject property from the targetVC to the selectedObject
            targetViewController.spaceObject = selectedObject;
        }
    }
    
    
// This part of prepareForSegue, is setting the protocol property from the AddObjectVC delegate to self.
    if ([segue.destinationViewController isKindOfClass:[MASAddObjectViewController class]]) {
        
        // Creating instance of MASAddObjectVC and setting it to the segue destination
        MASAddObjectViewController *addSpaceObjectVC = segue.destinationViewController;
        // Set as delegate
        addSpaceObjectVC.delegate = self;
        }
    
    }


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// Methods will be called from MASAddObjectViewController
#pragma mark - MASAddObjectViewController Delegate

-(void)didCancel
{
    NSLog(@"didCancel");
    // Dismiss AddObjectVC
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

// Replaced with method that returns spaceObject shown below
//-(void)addSpaceObject
//{
//    /// Dismiss AddObjectVC
//    NSLog(@"addSpaceObject");
//    [self dismissViewControllerAnimated:YES completion:nil];
//}

-(void)addSpaceObject:(MASSpaceObject *)spaceObject
{
    
    //Removed since the addedSpaceObjects array had been created in the Lazy instantiation at the top of the header
//    /// if addedSpaceObjects array does not exsist...
//    if (!self.addedSpaceObjects) {
//        /// ...create it
//        self.addedSpaceObjects = [[NSMutableArray alloc] init];
//    }
    
    // add the spaceObject that is being passed from the delegate method into the array.
    // all new spaceObjects created will be stored in the addedSpaceObjects array
    
    [self.addedSpaceObjects addObject:spaceObject];
    
/// Will save to NSUserDefaults here
    /// Create a mutableArray from the data that is in the NSUserDefaults object.
    NSMutableArray *spaceObjectsAsPropertyLists =
                        /// Returns a NSUserDefaults object using the standardUserDefaults Class method
                        [[[NSUserDefaults standardUserDefaults]
                        /// get the array at this key from the UserDefaults file
                        arrayForKey:ADDED_SPACE_OBJECTS_KEY]
                        /// The above method returns an array of added space objects, but we need it to be mutable so we are calling the mutableCopy method to create a mutableCopy of the array.
                        mutableCopy];
    
/// If spaceObjectsAsPropertyList variable does not have a value (NSUserDefaults is Empty)... create it
    ///(If only a single line of code, no curly braces needed but anymore then one line, it will not work)
    if (!spaceObjectsAsPropertyLists) spaceObjectsAsPropertyLists =
        [[NSMutableArray alloc] init];
    
    /// Uses helper method to create an object of the NSDictionary properties of the addedSpaceObject
    [spaceObjectsAsPropertyLists addObject:[self spaceObjectAsAPropertyList:spaceObject]];
    
    /// Set the mutableArray as an object in the NSUserDefaults
    [[NSUserDefaults standardUserDefaults] setObject:spaceObjectsAsPropertyLists forKey:ADDED_SPACE_OBJECTS_KEY];
    
    /// synchronize will actually save the data that was set
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    
    
    // Dismiss AddObjectVC
    [self dismissViewControllerAnimated:YES completion:nil];
    
    // Reload Data in tableView
    [self.tableView reloadData];
}


#pragma mark - Helper Methods

/// Method that will be called to save data to NSUserDefaults
-(NSDictionary *)spaceObjectAsAPropertyList:(MASSpaceObject *)spaceObject
{
    /// Convert SpaceImage to a NSData file so that it can be saved in NSUserDefaults
    NSData *imageData = UIImagePNGRepresentation(spaceObject.spaceImage);
    
    /// Create a dictionary of the new planet's data properties
    NSDictionary *dictionary = @{PLANET_NAME : spaceObject.name, PLANET_GRAVITY : @(spaceObject.gravitationalForce), PLANET_DIAMETER : @(spaceObject.diameter), PLANET_YEAR_LENGTH : @(spaceObject.yearLength), PLANET_DAY_LENGTH : @(spaceObject.dayLength), PLANET_TEMPERATURE : @(spaceObject.temperature), PLANET_NUMBER_OF_MOONS : @(spaceObject.numberOfMoons), PLANET_NICKNAME : spaceObject.nickname, PLANET_INTERESTING_FACT : spaceObject.interestFact, PLANET_IMAGE : imageData };
    
    return dictionary;
}


/// Method that will be called to load data from NSUserDefaults
-(MASSpaceObject *)spaceObjectForDictionary:(NSDictionary *)dictionary
{
    /// create instance of NSData and set the value to the image data object in the dictionary at key PLANET_IMAGE
    NSData *dataForImage = dictionary[PLANET_IMAGE];
    
    /// create an instance of UIImage and using imageWithData, set the value to the value of the dataForImage object.
    UIImage *spaceObjectImage = [UIImage imageWithData:dataForImage];
    
    /// Using the MASSpaceObject custom initializer, we are initiating an instance MASSpaceObject with the data from the NSUserDefaults dictionary data.
    MASSpaceObject *spaceObject = [[MASSpaceObject alloc] initWithData:dictionary andImage:spaceObjectImage];
    
    return spaceObject;
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
        // Use new space object to customize the cell
    // Create instance of spaceObject and set it to the new object at the current indexPath's row
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

// Override to support custom action when accessoryButton is tapped
-(void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"push to space data" sender:indexPath];
}


// Override to support conditional editing of the table view
-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{

    /// No curly brace because only 1 line of code after 'if' and 1 line of code after 'else'
    if (indexPath.section == 1) return YES;
    else return NO;
}

/// Removing Data from NSUserDefaults when a user deletes a row from the tableView
// Override to support editing the table view
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        
        /// remove data from addedSpaceObject array at the indexPath that the user swiped
        [self.addedSpaceObjects removeObjectAtIndex:indexPath.row];
        
        /// create a new array that will presist or save to the NSUserDefault without the spaceObject that the user just deleted
        NSMutableArray *newSavedSpaceObjectData = [[NSMutableArray alloc] init];
        
        /// enumerate through the spaceObjects in the addedSpaceObjects array
        for (MASSpaceObject *spaceObject in self.addedSpaceObjects) {
            
            /// add the dictionary that is returned from the spaceObjectAsAPropertList method.
            [newSavedSpaceObjectData addObject:[self spaceObjectAsAPropertyList:spaceObject]];
        }
        
        /// Create instance of the UserDefaults and set the newSavedSpaceObjectData at the ADDED_SPACE_OBJECTS_KEY as an object in the UserDefaults
        [[NSUserDefaults standardUserDefaults] setObject:newSavedSpaceObjectData forKey:ADDED_SPACE_OBJECTS_KEY];
        
        /// Save/Synchronize the data to the NSUserDefaults
        [[NSUserDefaults standardUserDefaults] synchronize];
        
        /// row at the indexPath that the user is deleting is removed with fade animation
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
}





@end
