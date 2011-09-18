//
//  Bullet.m
//  DoodleJump
//
//  Created by Dmitry Ivanov on 9/15/11.
//  Copyright 2011 Sigma Ltd. All rights reserved.
//

#import "Bullet.h"


@implementation Bullet

@synthesize index, delegate, xVelocity, position;

- (id)initWithIndex:(NSUInteger)aIndex
{
    self = [super init];
    if (self) {
        self.index = aIndex;
    }
    return self;
}

- (void)dealloc {
    
    [super dealloc];
}

- (void)update:(float)dt
{    
    position.x += xVelocity * dt;

    [delegate bulletUpdated:self];
}

- (void)explode
{
    [self.delegate deleteBullet:self];
}


@end
