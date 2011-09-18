//
//  EnemyView.h
//  DoodleJump
//
//  Created by Dmitry Ivanov on 9/1/11.
//  Copyright 2011 Sigma Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Enemy.h"
#import "World.h"


@interface EnemyView : CCNode <EnemyDelegate> {

    World *world; 
    NSMutableArray *enemyList;
    NSMutableDictionary *enemyViewDict;
    
}
@property (retain) World *world;
@property (retain) NSMutableArray *enemyList;
@property (retain) NSMutableDictionary *enemyViewDict;

- (id)initWithWorld:(World *)aWorld;
- (void)addEnemies:(NSMutableArray *)newEnemies;


@end
