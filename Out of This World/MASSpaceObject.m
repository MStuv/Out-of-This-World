//
//  MASSpaceObject.m
//  Out of This World
//
//  Created by Mark Stuver on 10/22/13.
//  Copyright (c) 2013 Halo International Corp. All rights reserved.
//

#import "MASSpaceObject.h"
#import "AstronomicalData.h"

@implementation MASSpaceObject

/** Each class has (1) Designated Initializer and all other initializers are custom initializers and they funnel threw the designated initializers
        • The Designated Initializer always starts by calls the init from its super class.
            ie: self = [super init];
        • The Designated Initializer can be over-rided to create a new designated initializer.

/// Over-riding the initializer **/
-(id)init
{
    /// self is being passed off to the new designated initializer, initWithData:andImage:
    self = [self initWithData:nil andImage:nil];
    return self;
}

/// This is now the Designated Initializer
-(id)initWithData:(NSDictionary *)data andImage:(UIImage *)image
{
    /// This statement is always called first in the Designated Initializer. It is calling the Designated Initializer from the Super class first.
    self = [super init];
    
    /// Setting properties from the header file with the data from the NSDictionaries in AstronomicalData Class. Using Literal to return the key value from the NSDictionary
    self.name = data[PLANET_NAME];
    
    /// calling floatValue method because PLANET_GRAVITY is a NSNumber object and our property is a float instance
    self.gravitationalForce = [data[PLANET_GRAVITY] floatValue];
    self.diameter = [data[PLANET_DIAMETER] floatValue];
    self.yearLength = [data[PLANET_YEAR_LENGTH] floatValue];
    self.dayLength = [data[PLANET_DAY_LENGTH] floatValue];
    self.temperature = [data[PLANET_TEMPERATURE] floatValue];
    self.numberOfMoons = [data[PLANET_NUMBER_OF_MOONS] intValue];
    self.nickname = data[PLANET_NICKNAME];
    self.interestFact = data[PLANET_INTERESTING_FACT];
    
    self.spaceImage = image;
    
    return self;
    
}

@end
