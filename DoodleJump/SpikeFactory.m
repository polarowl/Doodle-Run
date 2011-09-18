//
//  SpikeFactory.m
//  DoodleJump
//
//  Created by Dmitry Ivanov on 9/11/11.
//  Copyright 2011 Sigma Ltd. All rights reserved.
//

#import "SpikeFactory.h"


@implementation SpikeFactory

@synthesize currentSpikeIndex;

- (id)init {
    self = [super init];
    if (self) {
        currentSpikeIndex = 0;
    }
    return self;
}

- (void)dealloc {
    
    [super dealloc];
}

- (NSMutableArray *)generateSpikesForLevel:(Level *)level fromX:(float)x
{
    NSMutableArray *spikes = [NSMutableArray array];
    
    NSUInteger dencity;
    
    Spike *currentSpike;
    
    for (Ground *ground in level.groundList) {
        
        if (ground.xstart >= x)
        {
            int probability = [self getRandWithMin:0 andMax:2];
            
            if (probability == 0)
            {
                dencity = (ground.xend - ground.xstart)/200;
                
                for (int i=0; i < dencity; i++)             
                {
                        currentSpike = [[[Spike alloc] initWithIndex:self.currentSpikeIndex] autorelease];
                        currentSpike.level = level;
                        self.currentSpikeIndex += 1;
                        
                        currentSpike.xstart = [self getRandWithMin:ground.xstart andMax:ground.xend-SpikeLength];
                        currentSpike.xend = currentSpike.xstart + SpikeLength;
                        currentSpike.y = ground.height;
                        
                        
                        [spikes addObject:currentSpike];            
                }
            }

        }    
        
    }
    
    return spikes;
    
}

- (int)getRandWithMin:(int)min andMax:(int)max
{
    int range = (max - min);
    int rand = (arc4random() % (range + 1)) + min;
    return rand;
}


@end
