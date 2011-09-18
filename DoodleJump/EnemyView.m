//
//  EnemyView.m
//  DoodleJump
//
//  Created by Dmitry Ivanov on 9/1/11.
//  Copyright 2011 Sigma Ltd. All rights reserved.
//

#import "EnemyView.h"


@implementation EnemyView

@synthesize enemyViewDict;
@synthesize world;

- (id)initWithWorld:(World *)aWord
{    
    self = [super init];
    if (self) {
                
        //self.enemyList = aEnemyList;
        self.world = aWord;
        
        self.enemyViewDict = [[NSMutableDictionary alloc] init];
        
        for(Enemy *enemy in self.world.enemies)
        {
            NSString *imageName;
            
            if (enemy.xVelocity >= 0) imageName = @"enemy_right.png";
            else imageName = @"enemy_left.png";
            
            CCSprite *enemySprite = [CCSprite spriteWithFile:imageName];
            
            enemySprite.position = CGPointMake(enemy.position.x,enemy.position.y);
            enemySprite.scale = 0.3;
            enemySprite.anchorPoint = ccp(0.5,0.1);
                        
            [self.enemyViewDict setValue:enemySprite forKey:[NSString stringWithFormat:@"%d",enemy.index]];
            [self addChild:enemySprite z:100];
            
            enemy.delegate = self;
        }
        
        
    }
    return self;
    
}

- (void)dealloc {
    [enemyViewDict release];
    [super dealloc];
}

- (void)addEnemies:(NSMutableArray *)newEnemies
{
    //[enemyList addObjectsFromArray:newEnemies];    
    
    for(Enemy *enemy in newEnemies)
    {
        NSString *imageName;
        
        if (enemy.xVelocity >= 0) imageName = @"enemy_right.png";
        else imageName = @"enemy_left.png";
        
        CCSprite *enemySprite = [CCSprite spriteWithFile:imageName];
        
        enemySprite.position = CGPointMake(enemy.position.x,enemy.position.y);
        enemySprite.scale = 0.3;
        enemySprite.anchorPoint = ccp(0.5,0.1);
        
        [self.enemyViewDict setValue:enemySprite forKey:[NSString stringWithFormat:@"%d",enemy.index]];    
        [self addChild:enemySprite z:100];
        
        enemy.delegate = self;
    }
    
}

- (void)enemyUpdated:(Enemy *)enemy
{
    CCSprite *enemySprite = [enemyViewDict objectForKey:[NSString stringWithFormat:@"%d",enemy.index]];
    enemySprite.position = enemy.position;

}

- (void)removeDeadEnemiesSprites
{
    for (CCSprite *enemySprite in [self.enemyViewDict allValues]) {
        if ([enemySprite scale]==0)
            [self removeChild:enemySprite cleanup:YES];
    }
}

- (void)deleteEnemy:(Enemy *)enemy
{
    [self removeDeadEnemiesSprites];
    
    CCSprite *enemySprite = [enemyViewDict objectForKey:[NSString stringWithFormat:@"%d",enemy.index]];
    CCAction *scaling = [CCScaleTo actionWithDuration:0.5 scale:0];
    [enemySprite runAction:scaling];
    
    CCAction *rotateAction = [CCRotateTo actionWithDuration:0.5 angle:-270];
    [enemySprite runAction:rotateAction];
    
    //[self removeChild:enemySprite cleanup:YES];    
}

@end
