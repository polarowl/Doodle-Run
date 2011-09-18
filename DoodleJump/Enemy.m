//
//  Enemy.m
//  DoodleJump
//
//  Created by Dmitry Ivanov on 9/1/11.
//  Copyright 2011 Sigma Ltd. All rights reserved.
//

#import "Enemy.h"


@implementation Enemy

@synthesize level;
@synthesize xVelocity, yVelocity,yAcceleration,position, index, delegate;

- (id)initWithIndex:(NSUInteger)aIndex
{
    self = [super init];
    if (self) {
        self.index = aIndex;
    }
    return self;
}

- (void)shoot
{
    // TODO
}

- (void)getShot
{
    [self.delegate deleteEnemy:self];
}

- (void)update:(float)dt
{
    /* pre update */
    BOOL aboveGroundLevelAtT1 = self.position.y >= [self.level heightAtX:self.position.x];
    
    if (self.position.y != [self.level heightAtX:self.position.x]) {
        self.yAcceleration = -G_ACCELERATION * 50; 
    } else {
        self.yVelocity = 0;
        self.yAcceleration = 0;
    }    
    
    float oldGroundLevel = [self.level heightAtX:self.position.x];    
    /* end pre update */
    
    yVelocity = yVelocity + yAcceleration * dt;
    
    position.x += xVelocity * dt;
    position.y = position.y + yVelocity * dt;
    
    [delegate enemyUpdated:self];
    
    /* post update */
    if (self.position.y != [self.level heightAtX:self.position.x]) {
        
        BOOL aboveGroundLevelAtT2 = self.position.y > [self.level heightAtX:self.position.x];
        
        if (aboveGroundLevelAtT1 != aboveGroundLevelAtT2) {
            if (aboveGroundLevelAtT2)
            {
                CGPoint aPosition = self.position;
                aPosition.y = [self.level heightAtX:self.position.x];
                self.position = aPosition;
            }
            else {
                if (oldGroundLevel > 0)
                {
                    CGPoint aPosition = self.position;
                    aPosition.y = [self.level heightAtX:self.position.x];                    
                    self.position = aPosition;
                }                            
            }
        }
    }
    /* end post update */
    
}


@end
