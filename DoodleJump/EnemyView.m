//
//  EnemyView.m
//  DoodleJump
//
//  Created by Dmitry Ivanov on 9/1/11.
//  Copyright 2011 Sigma Ltd. All rights reserved.
//

#import "EnemyView.h"


@implementation EnemyView

@synthesize enemyList, enemyViewDict;
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
            CCSprite *enemySprite = [CCSprite spriteWithFile:@"enemy.png"];
            
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
        
        CCSprite *enemySprite = [CCSprite spriteWithFile:@"enemy.png"];
        
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

- (void)deleteEnemy:(Enemy *)enemy
{
    CCSprite *enemySprite = [enemyViewDict objectForKey:[NSString stringWithFormat:@"%d",enemy.index]];
    [self removeChild:enemySprite cleanup:YES];
    //[self.enemyList removeObject:enemy];
}

@end
