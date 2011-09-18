//
//  LevelView.m
//  DoodleJump
//
//  Created by Dmitry Ivanov on 8/18/11.
//  Copyright 2011 Sigma Ltd. All rights reserved.
//

#import "LevelView.h"


@implementation LevelView

@synthesize level;

- (void)setLevel:(Level *)aLevel 
{
    [level release];
    
    level = [aLevel retain];
    
    for(Ground *ground in level.groundList)
    {
        CCSprite *groundSprite = [CCSprite spriteWithFile:@"ground.png"];
        groundSprite.position = CGPointMake(ground.xstart,ground.height);
        groundSprite.scaleX = (ground.xend - ground.xstart)/groundSprite.contentSize.width;
        groundSprite.anchorPoint = ccp(0,1);
        
        [self addChild:groundSprite z:0];
    }
}

- (id)initWithLevel:(Level *)aLevel
{
    self = [super init];
    
    if(self){
        self.level = aLevel;
        
        for(Ground *ground in level.groundList)
        {
            CCSprite *groundSprite = [CCSprite spriteWithFile:@"ground.png"];
            groundSprite.position = CGPointMake(ground.xstart,ground.height);
            groundSprite.scaleX = (ground.xend - ground.xstart)/groundSprite.contentSize.width;
            groundSprite.anchorPoint = ccp(0,1);
            
            [self addChild:groundSprite z:0];
        }
    }
    return self;
    
}


@end
