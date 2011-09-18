//
//  HeroView.h
//  DoodleJump
//
//  Created by Dmitry Ivanov on 8/18/11.
//  Copyright 2011 Sigma Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Hero.h"

#define DJBlinkActionTag 123

@class Hero;

@interface HeroView : CCNode <HeroDelegate> {
    
    CCSprite *player;
    Hero *hero;
    BOOL oldIsHurt;
    
}
- (id)initWithHero:(Hero *)hero;

@end
