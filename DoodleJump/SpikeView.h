//
//  SpikeView.h
//  DoodleJump
//
//  Created by Dmitry Ivanov on 9/11/11.
//  Copyright 2011 Sigma Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Spike.h"

@interface SpikeView : CCNode <SpikeDelegate> {
    
    NSMutableArray *spikeList;
    NSMutableDictionary *spikeViewDict;
    
}
@property (retain) NSMutableArray *spikeList;
@property (retain) NSMutableDictionary *spikeViewDict;

- (id)initWithSpikeList:(NSMutableArray *)aSpikeList;
- (void)addSpikes:(NSMutableArray *)newSpikes;
- (void)deleteSpike:(Spike *)spike;


@end
