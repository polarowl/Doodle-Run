//
//  LevelGenerator.h
//  DoodleJump
//
//  Created by Dmitry Ivanov on 8/18/11.
//  Copyright 2011 Sigma Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Level.h"

@interface LevelGenerator : NSObject {

    float pregenerateLevelLength;
    
}

@property (assign) float pregenerateLevelLength;

- (NSMutableArray *)generateGroundsForGroundList:(NSMutableArray *)aGroundList fromX:(float)aX;
- (Level *)updateLevel:(Level *)level fromX:(float)aX;
- (Level *)generateLevel;
- (int)getRandWithMin:(int)min andMax:(int)max;


@end
