//
//  HeroStatusView.h
//  DoodleJump
//
//  Created by Dmitry Ivanov on 9/17/11.
//  Copyright 2011 Sigma Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Hero.h"

#define GAME_POINTS_INDICATOR_TAG 666
#define GAME_POINTS_PRECISION 20

#define INDENT_BASE 15

@interface HeroStatusView : CCNode {

    // array of CCSprites
    NSMutableArray *healthSpriteList;
    Hero *hero;
    
    NSUInteger oldHeroHealth;
    
    CCLabelTTF *gamePointsIndicator;
    
}

@property (assign) Hero *hero;
@property (retain) NSMutableArray *healthSpriteList;
@property (assign) NSUInteger oldHeroHealth;

- (id)initWithHero:(Hero *)aHero;


@end
