//
//  ControlsView.h
//  DoodleJump
//
//  Created by Dmitry Ivanov on 8/28/11.
//  Copyright 2011 Sigma Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "ButtonView.h"
#import "HeroStatusView.h"
#import "World.h"

@interface ControlsView : CCNode <ButtonViewDelegate> {
    ButtonView *jumpButtonView;
    ButtonView *shootButtonView;
    
    HeroStatusView *heroStatusView;
    
    World *world;
    
    bool _pauseScreenUp;
    bool _deathScreenUp;
    
    CCLayer *pauseLayer;
    CCSprite *_pauseScreen;
    CCMenu *_pauseScreenMenu;
    
    CCLayer *mainMenuLayer;
    CCSprite *_mainMenuScreen;
    CCMenu *_mainMenu;
}

@property (retain) World *world;

- (id)initWithWorld:(World *)aWorld;

- (void)showGameOverMenu;
- (void)showMainMenu;

@end
