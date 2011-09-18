//
//  GameScene.m
//  DoodleJump
//
//  Created by Dmitry Ivanov on 8/18/11.
//  Copyright 2011 Sigma Ltd. All rights reserved.
//

#import "GameScene.h"
#import "LevelGenerator.h"
#import "Ground.h"
#import "LevelView.h"

@implementation GameScene

+(id) scene {

    return [GameScene node];
    
}

-(id) init {
    
    if ((self = [super init])) {
        
        CCLOG(@"%@: %@", NSStringFromSelector(_cmd), self);
        world = [[World alloc] init];
        worldView = [[WorldView alloc] initWithWorld:world];

        [self addChild:worldView];
        
        controlsView = [[ControlsView alloc] initWithWorld:world];  
        
        [self addChild:controlsView];
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(receiveGameOverNotification:) 
                                                     name:@"Game is over"
                                                   object:nil];
        
    } 
    return self;
}

- (void)receiveGameOverNotification:(NSNotification *)notification
{
    // [notification name] should always be @"TestNotification"
    // unless you use this method for observation of other notifications
    // as well.
    
    if ([[notification name] isEqualToString:@"Game is over"])
    {
        [controlsView showGameOverMenu]; 
    }
        
}

- (id)retain
{
    return [super retain];
}

- (void)release
{
    [super release];
}

-(void) dealloc {
    CCLOG(@"%@: %@", NSStringFromSelector(_cmd), self);
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
    [controlsView release];
    [worldView release];
    [world release];
        
    // never forget to call [super dealloc]
    [super dealloc];
}

@end
