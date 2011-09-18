//
//  SpikeView.m
//  DoodleJump
//
//  Created by Dmitry Ivanov on 9/11/11.
//  Copyright 2011 Sigma Ltd. All rights reserved.
//

#import "SpikeView.h"


@implementation SpikeView

@synthesize spikeList, spikeViewDict;

- (id)initWithSpikeList:(NSMutableArray *)aSpikeList
{
    self = [super init];
    if (self) {
        self.spikeList = aSpikeList;
        self.spikeViewDict = [[NSMutableDictionary alloc] init];
        
        for(Spike *spike in self.spikeList)
        {
            CCSprite *spikeSprite = [CCSprite spriteWithFile:@"spike.png"];
            
            spikeSprite.position = CGPointMake(spike.xend - (spike.xend - spike.xstart)/2,spike.y);
            spikeSprite.scale = 0.15;
            spikeSprite.scaleY = 0.08;
            spikeSprite.anchorPoint = ccp(0.5,0.0);
            
            [self.spikeViewDict setValue:spikeSprite forKey:[NSString stringWithFormat:@"%d",spike.index]];
            [self addChild:spikeSprite z:100];
            
            spike.delegate = self;
        }
        
    }
    return self;
}

- (void)dealloc {
    [spikeList release];
    [spikeViewDict release];
    [super dealloc];
}

- (void)addSpikes:(NSMutableArray *)newSpikes
{
    [spikeList addObjectsFromArray:newSpikes];    
    
    for(Spike *spike in newSpikes)
    {
        
        CCSprite *spikeSprite = [CCSprite spriteWithFile:@"spike.png"];
        
        spikeSprite.position = CGPointMake(spike.xend - (spike.xend - spike.xstart)/2,spike.y);
        spikeSprite.scale = 0.15;
        spikeSprite.scaleY = 0.1;
        spikeSprite.anchorPoint = ccp(0.5,0.0);
        
        [self.spikeViewDict setValue:spikeSprite forKey:[NSString stringWithFormat:@"%d",spike.index]];
        [self addChild:spikeSprite z:100];
        
        spike.delegate = self;
    }
    
}

- (void)deleteSpike:(Spike *)spike
{
    CCSprite *spikeSprite = [spikeViewDict objectForKey:[NSString stringWithFormat:@"%d",spike.index]];
    [self removeChild:spikeSprite cleanup:YES];
    [self.spikeList removeObject:spike];
    
}

- (void)spikeUpdated:(Spike *)spike
{
    
}

@end
