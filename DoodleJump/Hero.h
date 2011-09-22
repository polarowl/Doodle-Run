//
//  Hero.h
//  DoodleJump
//
//  Created by Dmitry Ivanov on 8/18/11.
//  Copyright 2011 Sigma Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Level.h"
#import "World.h"
#import "Bullet.h"

#define JUMP_VELOCITY 400
#define G_ACCELERATION 9.8

@protocol HeroDelegate;

@class World;

@interface Hero : NSObject {
    
    NSUInteger healthPoints;
    NSUInteger gamePoints;
    
    BOOL isHurt;
    float hurtTimer;
    
    CGPoint position;
    float xVelocity;
    float yVelocity;    
    float yAcceleration;
    
    BOOL isJumping;
    BOOL isShooting;
    
    id<HeroDelegate> delegate;
    
    // TODO timestamp of last shot
    
    Level *level;
    World *world;
    
}

@property (assign) BOOL isHurt;
@property (retain) Level *level;
@property (assign) NSUInteger healthPoints;
@property (assign) NSUInteger gamePoints;
@property (assign) CGPoint position;
@property (assign) float yAcceleration;
@property (assign) float xVelocity;
@property (assign) float yVelocity;
@property (assign) id<HeroDelegate> delegate;

@property (retain) World *world;

- (void)jumpWithStrength:(double)strength;
- (void)shoot;
- (void)hurt;

- (void)update:(float)dt;

@end

@protocol HeroDelegate <NSObject>

- (void)heroModelDidChange;

@end