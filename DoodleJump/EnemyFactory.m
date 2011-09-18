//
//  EnemyFactory.m
//  DoodleJump
//
//  Created by Dmitry Ivanov on 9/1/11.
//  Copyright 2011 Sigma Ltd. All rights reserved.
//

#import "EnemyFactory.h"

@implementation EnemyFactory

@synthesize currentEnemyIndex;

- (id)init {
    self = [super init];
    if (self) {
        currentEnemyIndex = 0;
    }
    return self;
}

- (NSMutableArray *)generateEnemiesForLevel:(Level *)level fromX:(float)x
{
    NSMutableArray *enemies = [NSMutableArray array];
    
    NSUInteger dencity;
    
    Enemy *currentEnemy;
    
    for (Ground *ground in level.groundList) {
        
        if (ground.xstart >= x)
        {
            dencity = (ground.xend - ground.xstart)/100;
            
            for (int i=0; i < 2; i++) {
                                
                currentEnemy = [[[Enemy alloc] initWithIndex:self.currentEnemyIndex] autorelease];
                currentEnemy.level = level;
                self.currentEnemyIndex += 1;
                                
                currentEnemy.position = CGPointMake([self getRandWithMin:ground.xstart andMax:ground.xend], ground.height);            
                                
                int direction = [self getRandWithMin:0 andMax:1];
                if (direction == 0)
                {
                    currentEnemy.xVelocity = -10;
                }
                else 
                {
                    currentEnemy.xVelocity = 10;
                }
                
                [enemies addObject:currentEnemy];            
            }
        }    
    
    }

    return enemies;
    
}

- (int)getRandWithMin:(int)min andMax:(int)max
{
    int range = (max - min);
    int rand = (arc4random() % (range + 1)) + min;
    return rand;
}


@end
