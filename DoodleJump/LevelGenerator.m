//
//  LevelGenerator.m
//  DoodleJump
//
//  Created by Dmitry Ivanov on 8/18/11.
//  Copyright 2011 Sigma Ltd. All rights reserved.
//

#import "LevelGenerator.h"
#import "Ground.h"


@implementation LevelGenerator

@synthesize pregenerateLevelLength;

- (id)init {
    self = [super init];
    if (self) {
        pregenerateLevelLength = 1000;
    }
    return self;
}

- (Level *)updateLevel:(Level *)level fromX:(float)aX
{
    level.groundList = [self generateGroundsForGroundList:level.groundList fromX:aX];
    return level;
}

- (NSMutableArray *)generateGroundsForGroundList:(NSMutableArray *)aGroundList fromX:(float)aX
{
    
    if (aX != 0) aX += 30;
    float x = aX;
    
    while(x < self.pregenerateLevelLength + aX){
        
        Ground *ground = [[Ground alloc] init];
        ground.xstart = x;
        ground.xend = x + [self getRandWithMin:100 andMax:400];
        ground.height = [self getRandWithMin:80 andMax:150];
        
        x = ground.xend + 30;
        [aGroundList addObject:ground];
        [ground release];
        
    }
    return aGroundList;
}

- (Level *)generateLevel
{
        
    Level *level = [[[Level alloc] init] autorelease];
    
    NSMutableArray *groundList = [NSMutableArray array];
    
    level.groundList = [self generateGroundsForGroundList:groundList fromX:0];
    
    return level;
    
}

- (int)getRandWithMin:(int)min andMax:(int)max
{
    int range = (max - min);
    int rand = (arc4random() % (range + 1)) + min;
    return rand;
}

@end
