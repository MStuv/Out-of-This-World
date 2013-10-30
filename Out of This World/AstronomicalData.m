//
//  AstronomicalData.m
//  Out Of This World
//
//  Created by Teddy Wyly on 9/16/13.
//  Copyright (c) 2013 Teddy Wyly. All rights reserved.
//

#import "AstronomicalData.h"

@implementation AstronomicalData


+ (NSArray *)allKnownPlanets
{
    NSMutableArray *planetInformation = [@[] mutableCopy];
    
    /**PLANET_NAME is a #define directive that when processed by Xcode all instance of
        PLANET_NAME will be switched with what it was defined with in the header...
        in this case it is @"Planet Name" 
        ** prevents the duplication of code by defining a variable once **/
    
    /// @4879 is literal for NSNumber or @(4879)
    /// @{PLANET_NAME : @"Mercury"} is a literal for NSDictionary
    /// @"Mercury" is literal for NSString
    /// @[firstString, secondString] is literal for NSArray
    
    
    NSDictionary *mercuryDictionary = @{PLANET_NAME : @"Mercury", PLANET_GRAVITY : @3.7, PLANET_DIAMETER : @4879, PLANET_YEAR_LENGTH : @88.0, PLANET_DAY_LENGTH : @4222.6, PLANET_TEMPERATURE : @167, PLANET_NUMBER_OF_MOONS : @0, PLANET_NICKNAME : @"Hermes", PLANET_INTERESTING_FACT : @"Mercury is only about one-third the size of the Earth"};
    [planetInformation addObject:mercuryDictionary];
    
    NSDictionary *venusDictionary = @{PLANET_NAME : @"Venus", PLANET_GRAVITY : @8.9, PLANET_DIAMETER : @12104, PLANET_YEAR_LENGTH : @224.7, PLANET_DAY_LENGTH : @2802.0, PLANET_TEMPERATURE : @464, PLANET_NUMBER_OF_MOONS : @0, PLANET_NICKNAME : @"Aphrodite", PLANET_INTERESTING_FACT : @"Venus is the hottest planet in the solar system"};
    [planetInformation addObject:venusDictionary];
    
    NSDictionary *earthDictionary = @{PLANET_NAME : @"Earth", PLANET_GRAVITY : @9.8, PLANET_DIAMETER : @12756, PLANET_YEAR_LENGTH : @365.2, PLANET_DAY_LENGTH : @24.0, PLANET_TEMPERATURE : @15, PLANET_NUMBER_OF_MOONS : @1, PLANET_NICKNAME : @"Gaea", PLANET_INTERESTING_FACT : @"Three quarters of the Earth is covered by water"};
    [planetInformation addObject:earthDictionary];
    
    NSDictionary *marsDictionary = @{PLANET_NAME : @"Mars", PLANET_GRAVITY : @3.7, PLANET_DIAMETER : @6792, PLANET_YEAR_LENGTH : @687, PLANET_DAY_LENGTH : @24.7, PLANET_TEMPERATURE : @-65, PLANET_NUMBER_OF_MOONS : @2, PLANET_NICKNAME : @"Ares", PLANET_INTERESTING_FACT : @"Mars is the home of Olympus Mons, the largest volcano found in the solar system"};
    [planetInformation addObject:marsDictionary];
    
    NSDictionary *jupiterDictionary = @{PLANET_NAME : @"Jupiter", PLANET_GRAVITY : @23.1, PLANET_DIAMETER : @142984, PLANET_YEAR_LENGTH : @4331, PLANET_DAY_LENGTH : @9.9, PLANET_TEMPERATURE : @-110, PLANET_NUMBER_OF_MOONS : @67, PLANET_NICKNAME : @"Zeus", PLANET_INTERESTING_FACT : @"The Great Red Spot is a hurricane-like storm that has been seen in Jupiter's southern hemisphere since Jupiter was first discovered"};
    [planetInformation addObject:jupiterDictionary];
    
    NSDictionary *saturnDictionary = @{PLANET_NAME : @"Saturn", PLANET_GRAVITY : @9.0, PLANET_DIAMETER : @120536, PLANET_YEAR_LENGTH : @10747, PLANET_DAY_LENGTH : @10.7, PLANET_TEMPERATURE : @-140, PLANET_NUMBER_OF_MOONS : @62, PLANET_NICKNAME : @"Cronus", PLANET_INTERESTING_FACT : @"Saturn is the second biggest planet, but it’s also the lightest planet"};
    [planetInformation addObject:saturnDictionary];
    
    NSDictionary *uranusDictionary = @{PLANET_NAME : @"Uranus", PLANET_GRAVITY : @8.7, PLANET_DIAMETER : @51118, PLANET_YEAR_LENGTH : @30589, PLANET_DAY_LENGTH : @17.2, PLANET_TEMPERATURE : @-195, PLANET_NUMBER_OF_MOONS : @27, PLANET_NICKNAME : @"Ouranos", PLANET_INTERESTING_FACT : @"Uranus’ axis is at a 97 degree angle, meaning that it orbits lying on its side"};
    [planetInformation addObject:uranusDictionary];
    
    NSDictionary *neptuneDictionary = @{PLANET_NAME : @"Neptune", PLANET_GRAVITY : @11.0, PLANET_DIAMETER : @49528, PLANET_YEAR_LENGTH : @59800, PLANET_DAY_LENGTH : @16.1, PLANET_TEMPERATURE : @-100, PLANET_NUMBER_OF_MOONS : @14, PLANET_NICKNAME : @"Poseidon", PLANET_INTERESTING_FACT : @"Neptune was discovered in 1846"};
    [planetInformation addObject:neptuneDictionary];
    
    return [planetInformation copy];
}

//+ (NSArray *)otherAstronomicalBodies
//{
//    NSMutableArray *astronomicalBodyInformation = [@[] mutableCopy];
//    
//    NSDictionary *sunDictionary = @{PLANET_NAME : @"Sun", PLANET_GRAVITY : @274, PLANET_DIAMETER : @1391000, PLANET_TEMPERATURE : @5505, PLANET_NICKNAME : @"Helios"};
//    [astronomicalBodyInformation addObject:sunDictionary];
//    
//    NSDictionary *moonDictionary = @{PLANET_NAME : @"Moon", PLANET_GRAVITY : @1.6, PLANET_DIAMETER : @3475, PLANET_YEAR_LENGTH : @27.3, PLANET_TEMPERATURE : @-20, PLANET_NUMBER_OF_MOONS : @0, PLANET_NICKNAME : @"Selene"};
//    [astronomicalBodyInformation addObject:moonDictionary];
//    
//    NSDictionary *internationalSpaceStation = @{PLANET_NAME : @"International Space Station", PLANET_NICKNAME : @"No Nickname"};
//    [astronomicalBodyInformation addObject:internationalSpaceStation];
//    
//    
//    return astronomicalBodyInformation;
//}

@end
