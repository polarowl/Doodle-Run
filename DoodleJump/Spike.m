//
//  Spike.m
//  DoodleJump
//
//  Created by Dmitry Ivanov on 9/11/11.
//  Copyright 2011 Sigma Ltd. All rights reserved.
//

#import "Spike.h"


@implementation Spike

@synthesize xstart,xend,y,level,delegate, index;

- (id)initWithIndex:(NSUInteger)aIndex 
{
    self = [super init];
    if (self) {
        index = aIndex;
    }
    return self;
}

- (void)dealloc {
    
    [level release];
    [super dealloc];
}

- (void)tick:(float)dt
{
    
}

@end
