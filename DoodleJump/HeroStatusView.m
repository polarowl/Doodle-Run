//
//  HeroStatusView.m
//  DoodleJump
//
//  Created by Dmitry Ivanov on 9/17/11.
//  Copyright 2011 Sigma Ltd. All rights reserved.
//

#import "HeroStatusView.h"
#import "Config.h"

@interface HeroStatusView() 

- (void)heroHealthChanged:(id)sender;
- (void)gamePointsHaveChanged:(id)sender;

@end

@implementation HeroStatusView

@synthesize hero, healthSpriteList, oldHeroHealth;

- (id)initWithHero:(Hero *)aHero {
    self = [super init];
    if (self) {
        
        self.healthSpriteList = [NSMutableArray array];
        
        self.hero = aHero;        
        self.oldHeroHealth = self.hero.healthPoints;
        
        self.anchorPoint = ccp(1,1);
        
        for (int i=0; i < HERO_BASE_HEALTH; i++) {
            
            CCSprite *healthSprite = [CCSprite spriteWithFile:@"heart.png"];
            
            if (i >= self.hero.healthPoints)
            {
                healthSprite.color = ccc3(0, 0, 0);
            }
                            
            healthSprite.scale = 0.04;
            healthSprite.anchorPoint = ccp(0.5, 0.5);
            healthSprite.position = ccp(-INDENT_BASE - i*23,-INDENT_BASE);
            
            [self addChild:healthSprite];
            [self.healthSpriteList addObject:healthSprite];
        }
    
        
        // Draw a game points view        
        NSString *gamePointsString = [NSString stringWithFormat:@"%d", self.hero.gamePoints];
        gamePointsIndicator = [CCLabelTTF labelWithString:gamePointsString dimensions:CGSizeMake(150, 50) alignment:UITextAlignmentCenter fontName:@"Courier" fontSize:20];
        gamePointsIndicator.tag = GAME_POINTS_INDICATOR_TAG;
        gamePointsIndicator.anchorPoint = ccp(0,1);
        gamePointsIndicator.position = ccp(-150, 0);
        gamePointsIndicator.color = ccc3(0, 0, 0);
        [self addChild:gamePointsIndicator];        
        // end game points view
        
        

        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(heroHealthChanged:) 
                                                     name:@"HeroIsHurt"
                                                   object:nil];
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(heroHealthChanged:) 
                                                     name:@"HeroHealthIsIncreased"
                                                   object:nil];
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(gamePointsHaveChanged:) 
                                                     name:@"GamePointsHaveChanged"
                                                   object:nil];
        
        
    }
    return self;
}

- (void)heroHealthChanged:(id)sender
{
    
    for (CCSprite *healthSprite in self.healthSpriteList) {
        [self removeChild:healthSprite cleanup:YES];                
    }
    
    [self.healthSpriteList removeAllObjects];
    
    
    for (int i=0; i < HERO_BASE_HEALTH; i++) {
        
        CCSprite *healthSprite = [CCSprite spriteWithFile:@"heart.png"];
        
        healthSprite.scale = 0.04;
        
        if (i >= self.hero.healthPoints)
        {
            if (i == (oldHeroHealth-1) && oldHeroHealth > 1)
            {
                CCAction *scaling = [CCScaleTo actionWithDuration:0.3 scale:0];
                [healthSprite runAction:scaling];
                
                CCSprite *blackHealthSprite = [CCSprite spriteWithFile:@"heart.png"];
                blackHealthSprite.anchorPoint = ccp(0.5, 0.5);
                blackHealthSprite.scale = 0.04;
                blackHealthSprite.position = ccp(-INDENT_BASE - i*23,-INDENT_BASE);                
                blackHealthSprite.color = ccc3(0, 0, 0);
                [self addChild:blackHealthSprite z:0 tag:1];
                [self.healthSpriteList addObject:blackHealthSprite];
                
            }
            else healthSprite.color = ccc3(0, 0, 0);
        }
            
        healthSprite.anchorPoint = ccp(0.5, 0.5);
        healthSprite.position = ccp(-INDENT_BASE - i*23,-INDENT_BASE);
        
        [self addChild:healthSprite z:0 tag:1];
        [self.healthSpriteList addObject:healthSprite];
    }
    self.oldHeroHealth = self.hero.healthPoints;
    
}

- (void)gamePointsHaveChanged:(id)sender
{
    [self removeChildByTag:GAME_POINTS_INDICATOR_TAG cleanup:YES];

    int points = self.hero.gamePoints - (self.hero.gamePoints % GAME_POINTS_PRECISION); 
    
    // Draw a game points view        
    NSString *gamePointsString = [NSString stringWithFormat:@"%d", points];
    gamePointsIndicator = [CCLabelTTF labelWithString:gamePointsString dimensions:CGSizeMake(150, 50) alignment:UITextAlignmentCenter fontName:@"Courier" fontSize:20];
    gamePointsIndicator.tag = GAME_POINTS_INDICATOR_TAG;
    gamePointsIndicator.anchorPoint = ccp(0,1);
    gamePointsIndicator.position = ccp(-250, 0);
    gamePointsIndicator.color = ccc3(0, 0, 0);
    [self addChild:gamePointsIndicator];        
    // end game points view
    
}

@end
