//
//  Hero.m
//  DoodleJump
//
//  Created by Dmitry Ivanov on 8/18/11.
//  Copyright 2011 Sigma Ltd. All rights reserved.
//

#import "Hero.h"
#import "Config.h"

@implementation Hero

@synthesize position, yAcceleration,xVelocity, yVelocity;
@synthesize delegate;
@synthesize healthPoints,level, world, isHurt;

- (id)init {
    self = [super init];
    if (self) {  
        self.gamePoints = 0;
        self.healthPoints = HERO_BASE_HEALTH;
    }
    return self;
}

- (void)dealloc {
    [level release];
    [super dealloc];
}

- (NSUInteger)gamePoints
{
    return gamePoints;
}

- (void)setGamePoints:(NSUInteger)aGamePoints
{
    if (gamePoints != aGamePoints)
    {        
        [[NSNotificationCenter defaultCenter] postNotificationName:@"GamePointsHaveChanged" object:self];
    }
    gamePoints = aGamePoints;
}


- (void)hurt
{
    self.healthPoints -= 1;
    isHurt = YES;
    hurtTimer = 3;
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"HeroIsHurt" object:self];
    
    if (self.healthPoints <= 0)
    {   
        [[NSNotificationCenter defaultCenter] postNotificationName:@"HeroIsDead" object:self];
    }
    
}

- (void)jumpWithStrength:(double)strength;
{
    strength *= 2.5;
    
    if(yVelocity == 0) {
        if (strength > 1)
        {
            yVelocity += JUMP_VELOCITY;    
        }
        else if (strength < 0.5)
        {
            yVelocity += JUMP_VELOCITY * 0.5;    
        }
        else yVelocity += JUMP_VELOCITY * strength;    
    }
    
        
    
    CGPoint aPosition = position;
    aPosition.y += 1;
    position = aPosition;
}

- (void)shoot
{
    Bullet *newBullet = [[Bullet alloc] initWithIndex:world.currentBulletIndex];
    world.currentBulletIndex +=1 ;
    CGPoint bulletPosition = CGPointMake(self.position.x+15, self.position.y + 25);
    newBullet.position = bulletPosition;
    newBullet.xVelocity = 400;
    
    [world addBullet:newBullet];
    
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
    
    if (hurtTimer > 0) hurtTimer -= dt;
    else isHurt = NO;
    
    yVelocity = yVelocity + yAcceleration * dt;
    position.x += xVelocity * dt;
    position.y = position.y + yVelocity * dt;
    
    [delegate heroModelDidChange];
    
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
    
    if (self.position.y <= 0)
    {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"HeroIsDead" object:self];
    }
    /* end post update */
    
}

@end
