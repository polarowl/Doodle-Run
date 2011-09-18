//
//  BulletView.m
//  DoodleJump
//
//  Created by Dmitry Ivanov on 9/15/11.
//  Copyright 2011 Sigma Ltd. All rights reserved.
//

#import "BulletView.h"

@implementation BulletView

@synthesize bulletList, bulletViewDict;

- (id)initWithBulletList:(NSMutableArray *)aBulletList {
    self = [super init];
    if (self) {
        
        self.bulletList = [NSMutableArray array];
        self.bulletViewDict = [[NSMutableDictionary alloc] init];
        
        for(Bullet *bullet in aBulletList)
        {
            
            CCSprite *bulletSprite = [CCSprite spriteWithFile:@"bullet.png"];
            
            bulletSprite.position = CGPointMake(bullet.position.x,bullet.position.y);
            bulletSprite.scale = 0.1;
            bulletSprite.anchorPoint = ccp(0.5,0.5);
            
            [self.bulletViewDict setValue:bulletSprite forKey:[NSString stringWithFormat:@"%d",bullet.index]];    
            [self addChild:bulletSprite z:100];
            
            bullet.delegate = self;
        }
        
    }
    return self;
}

- (void)addBullet:(Bullet *)newBullet
{       
    [bulletList addObject:newBullet];    
    
    CCSprite *bulletSprite = [CCSprite spriteWithFile:@"bullet.png"];
        
    bulletSprite.position = CGPointMake(newBullet.position.x,newBullet.position.y);
    bulletSprite.scale = 0.1;
    bulletSprite.anchorPoint = ccp(0.5,0.5);
        
    [self.bulletViewDict setValue:bulletSprite forKey:[NSString stringWithFormat:@"%d",newBullet.index]];    
    [self addChild:bulletSprite z:100];
        
    newBullet.delegate = self;
    
}

- (void)deleteBullet:(Bullet *)bullet
{
    CCSprite *bulletSprite = [bulletViewDict objectForKey:[NSString stringWithFormat:@"%d",bullet.index]];
    [self removeChild:bulletSprite cleanup:YES];
    [self.bulletList removeObject:bullet];    
}

- (void)bulletUpdated:(Bullet *)bullet
{
    CCSprite *bulletSprite = [bulletViewDict objectForKey:[NSString stringWithFormat:@"%d",bullet.index]];
    bulletSprite.position = bullet.position;    
}



@end
