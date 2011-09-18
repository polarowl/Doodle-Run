//
//  WorldView.m
//  DoodleJump
//
//  Created by Dmitry Ivanov on 8/20/11.
//  Copyright 2011 Sigma Ltd. All rights reserved.
//

#import "WorldView.h"


@implementation WorldView

- (id)initWithWorld:(World *)aWorld
{
    self = [super init];
    
    if(self)
    {
        world = aWorld; // ?
        
        //CGSize screenSize = [[CCDirector sharedDirector] winSize]; 
        
        background = [CCSprite spriteWithFile:@"background.png"];        
        background.anchorPoint = ccp(0,0);
        background.position = ccp(0,-50);
        background.scale = 1.2;
        
        backgroundNext = [CCSprite spriteWithFile:@"background.png"];        
        backgroundNext.anchorPoint = ccp(0,0);
        backgroundNext.position = ccp(background.contentSize.width,-50);
        backgroundNext.scale = 1.2;
  
        [self addChild:background];
        [self addChild:backgroundNext];
        
        heroView = [[HeroView alloc] initWithHero:world.hero];
        levelView = [[LevelView alloc] initWithLevel:world.level];
        enemyView = [[EnemyView alloc] initWithWorld:world];
        spikeView = [[SpikeView alloc] initWithSpikeList:world.spikes];
        bulletView = [[BulletView alloc] initWithBulletList:world.bullets];
        
        [self addChild:heroView];        
        [self addChild:levelView];
        [self addChild:enemyView];
        [self addChild:spikeView];
        [self addChild:bulletView];
       
        world.delegate = self;
        
        [self scheduleUpdate];
                        
    }
    return self;
}

- (void)update:(ccTime)dt
{
    [world tick:dt];        
}

- (void)viewPointChanged
{
    CGPoint aPosition = self.position;
    aPosition.x = -world.viewPointX;
    self.position = aPosition;
         
    if (background.position.x < backgroundNext.position.x)
    {
        if (world.viewPointX >= backgroundNext.position.x)
        {
            CGPoint aPosition = background.position;
            aPosition.x += background.contentSize.width;
            background.position = aPosition;
        }
            
    }
    else
    {
        if (world.viewPointX >= background.position.x)
        {
            CGPoint aPosition = backgroundNext.position;
            aPosition.x += backgroundNext.contentSize.width;
            backgroundNext.position = aPosition;
        }
    }

    Ground *lastGround = (Ground *)[world.level.groundList lastObject];
    
    CGSize screenSize = [[CCDirector sharedDirector] winSize]; 
    
    if (lastGround.xend < (world.viewPointX + screenSize.width))
    {
        [world updateLevelGroundsFromX:lastGround.xend];
        levelView.level = world.level;
        
        [world generateEnemiesAtX:lastGround.xend];
        [world generateSpikesAtX:lastGround.xend];

        NSLog(@"The end level");
    }
    
    
    
}

- (void)enemiesAdded:(NSMutableArray *)newEnemies
{
    [enemyView addEnemies:newEnemies];
}

- (void)enemyDeleted:(Enemy *)enemy
{
    [enemyView deleteEnemy:enemy];
}

- (void)spikesAdded:(NSMutableArray *)newSpikes
{
    [spikeView addSpikes:newSpikes];
}

- (void)spikeDeleted:(Spike *)spike
{
    [spikeView deleteSpike:spike];
}

- (void)bulletAdded:(Bullet *)newBullet
{
    [bulletView addBullet:newBullet];
}

- (void)bulletDeleted:(Bullet *)bullet
{
    [bulletView deleteBullet:bullet];    
}



@end
