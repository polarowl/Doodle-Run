//
//  HeroView.m
//  DoodleJump
//
//  Created by Dmitry Ivanov on 8/18/11.
//  Copyright 2011 Sigma Ltd. All rights reserved.
//

#import "HeroView.h"


@implementation HeroView

- (id)initWithHero:(Hero *)aHero {
    self = [super init];
    if (self) {
                     
        hero = aHero;
        
        hero.delegate = self;
        
        oldIsHurt = hero.isHurt;
        
        self.position = hero.position;
        
        player = [CCSprite spriteWithFile:@"player.png"];
        player.scale = 0.16;
        player.anchorPoint = ccp(0.5, 0.0);
        player.position = ccp(0,-2);
        [self addChild:player z:0 tag:1];
 
    }
    return self;
}

- (void)heroModelDidChange
{
    self.position = hero.position;    
    if (hero.isHurt != oldIsHurt)
    {
        if (hero.isHurt == YES)
        {
            CCAction *blinkAction = [CCBlink actionWithDuration:18000 blinks:90000];
            blinkAction.tag = DJBlinkActionTag;            
            [self runAction:blinkAction];
        }
        else 
        {
            [self stopActionByTag:DJBlinkActionTag];
            self.visible = YES;
        }
        oldIsHurt = hero.isHurt;
    }        
}

@end
