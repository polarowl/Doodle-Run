//
//  WorldView.h
//  DoodleJump
//
//  Created by Dmitry Ivanov on 8/20/11.
//  Copyright 2011 Sigma Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "World.h"
#import "HeroView.h"
#import "LevelView.h"
#import "EnemyView.h"
#import "SpikeView.h"
#import "BulletView.h"

@interface WorldView : CCNode <WorldDelegate> {
    
    World *world;
    
    HeroView *heroView;
    LevelView *levelView;
    EnemyView *enemyView;
    BulletView *bulletView;
    SpikeView *spikeView;
    
    CCSprite *background;
    CCSprite *backgroundNext;
    
    
    
}

- (id)initWithWorld:(World *)world;


@end
