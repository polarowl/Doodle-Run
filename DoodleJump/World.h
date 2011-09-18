//
//  World.h
//  DoodleJump
//
//  Created by Dmitry Ivanov on 8/20/11.
//  Copyright 2011 Sigma Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Hero.h"
#import "Level.h"
#import "Enemy.h"
#import "Bullet.h"
#import "LevelGenerator.h"
#import "EnemyFactory.h"
#import "SpikeFactory.h"

#define G_ACCELERATION 9.8
#define SCENE_LENGTH 560
#define GAME_POINTS_FOR_ENEMY 100

@protocol WorldDelegate;

@class Hero;

@interface World : NSObject {
    
    Hero *hero;
    Level *level;
    LevelGenerator *levelGenerator;
    EnemyFactory *enemyFactory;
    SpikeFactory *spikeFactory;
    
    NSMutableArray *enemies;        
    NSMutableArray *spikes;
    NSMutableArray *bullets;
    
    NSUInteger currentBulletIndex;
    
    BOOL isGameOver;
    
    float viewPointX;
    float slidingVelocityX;
        
    id <WorldDelegate> delegate;    
    
}

@property (assign) id<WorldDelegate> delegate;

@property (retain) Level *level;
@property (retain) Hero *hero;
@property (retain) NSMutableArray *enemies;
@property (retain) NSMutableArray *spikes;
@property (retain) NSMutableArray *bullets;

@property (assign) NSUInteger currentBulletIndex;

@property (assign) float viewPointX;
@property (assign) float slidingVelocityX;

- (void)tick:(float)dt;

- (void)generateLevel;
- (void)generateEnemiesAtX:(float)x;
- (void)generateSpikesAtX:(float)x;

- (void)addBullet:(Bullet *)newBullet;

- (void)updateLevelGroundsFromX:(float)x;

- (void)jump;
- (void)shoot;

@end


@protocol WorldDelegate

- (void)viewPointChanged;

- (void)enemiesAdded:(NSMutableArray *)newEnemies;
- (void)enemyDeleted:(Enemy *)enemy;

- (void)spikesAdded:(NSMutableArray *)newSpikes;
- (void)spikeDeleted:(Spike *)spike;

- (void)bulletAdded:(Bullet *)newBullet;
- (void)bulletDeleted:(Bullet *)bullet;




@end
