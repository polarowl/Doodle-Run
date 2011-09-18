//
//  World.m
//  DoodleJump
//
//  Created by Dmitry Ivanov on 8/20/11.
//  Copyright 2011 Sigma Ltd. All rights reserved.
//

#import "World.h"

@interface World()

- (void)removeObsoleteEnemies;
- (void)checkHeroToEnemiesCollisions;
- (void)checkEnemiesToBulletsCollisions;
- (void)checkHeroToSpikesCollisions;
- (void)removeObsoleteBullets;

@end

@implementation World

@synthesize delegate,hero,level, viewPointX,slidingVelocityX, enemies, spikes, bullets, currentBulletIndex;

- (id)init {
    self = [super init];
    if (self) {
        
        isGameOver = NO;
        
        self.viewPointX = 0;
        self.slidingVelocityX = 125;        
        levelGenerator = [[LevelGenerator alloc] init];
        enemyFactory = [[EnemyFactory alloc] init];
        spikeFactory = [[SpikeFactory alloc] init];
        
        self.hero = [[Hero alloc] init];    
        self.hero.world = self;
        
        hero.position = CGPointMake(50,160);               
        hero.xVelocity = slidingVelocityX;        
        self.enemies = [NSMutableArray array];
        self.spikes = [NSMutableArray array];
        self.bullets = [NSMutableArray array];
        
        [self generateLevel];
        [self generateEnemiesAtX:0];
        [self generateSpikesAtX:0];
        
        self.hero.level = self.level;
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                selector:@selector(receiveHeroIsDeadNotification:) 
                                                     name:@"HeroIsDead"
                                                   object:nil];
        
    }
    return self;
}

- (void)dealloc {
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
    [hero release];    
    [level release];
    [levelGenerator release];    
    [enemyFactory release];
    [spikeFactory release];
    
    [super dealloc];
}

- (void)receiveHeroIsDeadNotification:(NSNotification *)notification
{
    if ([[notification name] isEqualToString:@"HeroIsDead"])
    {
        isGameOver = YES;
        [[NSNotificationCenter defaultCenter] postNotificationName:@"Game is over" object:self];
    }    
}

- (void)generateEnemiesAtX:(float)x
{
    NSMutableArray *newEnemies = [enemyFactory generateEnemiesForLevel:self.level fromX:x];
    
    [self.delegate enemiesAdded:newEnemies];
    [enemies addObjectsFromArray:newEnemies];
    
}

- (void)generateSpikesAtX:(float)x
{
    NSMutableArray *newSpikes = [spikeFactory generateSpikesForLevel:self.level fromX:x];
    
    [self.delegate spikesAdded:newSpikes];
    [spikes addObjectsFromArray:newSpikes];
    
}

- (void)addBullet:(Bullet *)newBullet
{
    [self.bullets addObject:newBullet];
    [self.delegate bulletAdded:newBullet];
}

- (void)updateLevelGroundsFromX:(float)x
{
    level = [levelGenerator updateLevel:level fromX:x];
}

- (void)generateLevel;
{
    self.level = [levelGenerator generateLevel];
}

- (void)tick:(float)dt
{        
    if (isGameOver) return;
        
    self.viewPointX += slidingVelocityX * dt;
    [self.delegate viewPointChanged];
        
    // Hero is moving
    [self.hero update:dt];   
    self.hero.gamePoints += slidingVelocityX * dt; 
        
    // Enemies are moving         
    for (Enemy *enemy in self.enemies)
    {
        [enemy update:dt];
    }
    
    // Bullets are moving         
    for (Bullet *bullet in self.bullets)
    {
        [bullet update:dt];
    }
            
    [self removeObsoleteEnemies];
        
    // check hero to enemies collision
    [self checkHeroToEnemiesCollisions];
    
    [self checkHeroToSpikesCollisions];
    
    // check enemies to bullets collisions
    [self checkEnemiesToBulletsCollisions];
    
    [self removeObsoleteBullets];
    
}

- (void)checkHeroToSpikesCollisions
{
    for (Spike *spike in self.spikes)
    {
        if ( (spike.xstart < self.hero.position.x) && 
            (spike.xend > self.hero.position.x) && 
            ( abs(spike.y - self.hero.position.y) < 10) && 
            (self.hero.isHurt == NO) )
        {
            [self.hero hurt];            
        }
    }
    
}

- (void)checkHeroToEnemiesCollisions
{
    // if collision => [hero hurt]
    for (Enemy *enemy in self.enemies)
    {
        if ( (abs(enemy.position.x - self.hero.position.x) < 5) && (abs(enemy.position.y - self.hero.position.y) < 5) && (self.hero.isHurt == NO) )
        {
            [self.hero hurt];            
        }
    }
    
}

- (void)checkEnemiesToBulletsCollisions
{
    for (Bullet *bullet in self.bullets)
    {
        for (Enemy *enemy in self.enemies) {
            if ((abs(bullet.position.x - enemy.position.x) < 10) && (abs(bullet.position.y - enemy.position.y)<20) )
            {                                            
                [bullet explode];
                [self.bullets removeObject:bullet];
                
                [enemy getShot];
                [self.enemies removeObject:enemy];                
                
                self.hero.gamePoints += GAME_POINTS_FOR_ENEMY;
            }
        }
    }
}

- (void)removeObsoleteEnemies
{
    for (Enemy *enemy in self.enemies) {
        if ( (self.viewPointX-50 > enemy.position.x) || (enemy.position.y < -50) )
        {            
            [self.delegate enemyDeleted:enemy];
            [self.enemies removeObject:enemy];            
        }
    }
}

- (void)removeObsoleteSpikes
{
    for (Spike *spike in self.spikes) {
        if (self.viewPointX > spike.xend)
        {
            [self.delegate spikeDeleted:spike];
            [self.spikes removeObject:spike];
        }
    }
    
}

- (void)removeObsoleteBullets
{
    for (Bullet *bullet in self.bullets) {
        if ((self.viewPointX > bullet.position.x) || (self.viewPointX + SCENE_LENGTH) < bullet.position.x)
        {
            [self.delegate bulletDeleted:bullet];
            [self.bullets removeObject:bullet];
        }
    }
}

- (void)jump
{
    [self.hero jump];
}

- (void)shoot 
{
    [self.hero shoot];
}


@end
