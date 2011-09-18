//
//  Spike.h
//  DoodleJump
//
//  Created by Dmitry Ivanov on 9/11/11.
//  Copyright 2011 Sigma Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Level.h"

#define G_ACCELERATION 9.8

@protocol SpikeDelegate;


@interface Spike : NSObject {
    
    float xstart;
    float xend;
    float y;
    
    NSUInteger index;    
    Level *level;
    
    id<SpikeDelegate> delegate;
    
}
@property (assign) NSUInteger index;
@property (assign) float xstart;
@property (assign) float xend;
@property (assign) float y;
@property (retain) Level *level;
@property (assign) id<SpikeDelegate> delegate;

- (id)initWithIndex:(NSUInteger)aIndex;

- (void)tick:(float)dt;


@end


@protocol SpikeDelegate <NSObject>

- (void)spikeUpdated:(Spike *)spike;


@end