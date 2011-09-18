//
//  MainMenuScene.m
//  DoodleJump
//
//  Created by Dmitry Ivanov on 9/15/11.
//  Copyright 2011 Sigma Ltd. All rights reserved.
//

#import "MainMenuScene.h"
#import "GameScene.h"


@implementation MainMenuScene

+(id) scene {
    
    return [MainMenuScene node];
    
}

-(id) init {
    
    if ((self = [super init])) {
        
        CCLOG(@"%@: %@", NSStringFromSelector(_cmd), self);
        
        CCLabelTTF *title = [CCLabelTTF labelWithString:@"Main Menu" fontName:@"Courier" fontSize:40];        
        title.position =  ccp(240, 240);
        [self addChild: title];
        
        CCMenuItemImage *startButton = [CCMenuItemImage
                                        itemFromNormalImage:@"startButton.png"
                                        selectedImage:@"startButtonSelected.png"
                                        target:self
                                        selector:@selector(startGame:)];
        
        CCMenuItemImage *settingsButton = [CCMenuItemImage
                                        itemFromNormalImage:@"settingsButton.png"
                                        selectedImage:@"settingsButton.png"
                                        target:self
                                        selector:@selector(showSettings:)];
      
        CCLabelTTF* settingsIconLabel = [CCLabelTTF labelWithString:@"Settings" dimensions:CGSizeMake(150, 50) alignment:UITextAlignmentCenter lineBreakMode:UILineBreakModeCharacterWrap fontName:@"Courier" fontSize:24];
        
        settingsIconLabel.color = ccc3(255,255,255);
        settingsIconLabel.position = ccp(75,25);
        settingsIconLabel.tag = 1;
        [settingsButton addChild:settingsIconLabel];
        
        settingsButton.position = ccp(-100, -100);
        
        CCMenu *menu = [CCMenu menuWithItems: startButton,settingsButton, nil];
        menu.position = ccp(240, 160);
        [self addChild: menu];
        
    } 
    return self;
}

- (void)showSettings:(id)sender
{
    
}

- (void)startGame:(id)sender
{
    [[CCDirector sharedDirector] replaceScene:[GameScene scene]];
}


@end
