//
//  MASSpaceObject.h
//  Out of This World
//
//  Created by Mark Stuver on 10/22/13.
//  Copyright (c) 2013 Halo International Corp. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MASSpaceObject : NSObject

@property (strong, nonatomic) NSString *name;
@property (nonatomic) float gravitationalForce;
@property (nonatomic) float diameter;
@property (nonatomic) float yearLength;
@property (nonatomic) float dayLength;
@property (nonatomic) float temperature;
@property (nonatomic) int numberOfMoons;
@property (strong, nonatomic) NSString *nickname;
@property (strong, nonatomic) NSString *interestFact;

@property (strong, nonatomic) UIImage *spaceImage;

// id is pointer to any object
-(id)initWithData:(NSDictionary *)data andImage:(UIImage *)image;

@end
