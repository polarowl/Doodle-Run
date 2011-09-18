//
//  Enemy.h
//  DoodleJump
//
//  Created by Dmitry Ivanov on 9/1/11.
//  Copyright 2011 Sigma Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Level.h"

#define G_ACCELERATION 9.8

@protocol EnemyDelegate;


@interface Enemy :  NSObject {
 
    CGPoint position;
    
    float xVelocity;
    float yVelocity;    
    float yAcceleration;
     
    NSUInteger index;    
    Level *level;
    
    id<EnemyDelegate> delegate;
    
}
@property (assign) NSUInteger index;
@property (assign) CGPoint position;
@property (assign) float xVelocity;
@property (assign) float yVelocity;
@property (assign) float yAcceleration;
@property (retain) Level *level;
@property (assign) id<EnemyDelegate> delegate;

- (id)initWithIndex:(NSUInteger)aIndex;

- (void)shoot;
- (void)runWith:(float)dt;
- (void)update:(float)dt;
- (void)getShot;


@end


@protocol EnemyDelegate <NSObject>

- (void)enemyUpdated:(Enemy *)enemy;
- (void)deleteEnemy:(Enemy *)enemy;


@end