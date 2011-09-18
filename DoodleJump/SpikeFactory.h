//
//  SpikeFactory.h
//  DoodleJump
//
//  Created by Dmitry Ivanov on 9/11/11.
//  Copyright 2011 Sigma Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Spike.h"
#import "Level.h"

#define SpikeLength 40


@interface SpikeFactory : NSObject {
    
    NSUInteger currentSpikeIndex;    
    
}

@property (assign) NSUInteger currentSpikeIndex;

- (NSMutableArray *)generateSpikesForLevel:(Level *)level fromX:(float)x;
- (int)getRandWithMin:(int)min andMax:(int)max;

@end
