//
//  Bullet.h
//  DoodleJump
//
//  Created by Dmitry Ivanov on 9/15/11.
//  Copyright 2011 Sigma Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol BulletDelegate;

@interface Bullet : NSObject {
    
    CGPoint position;
    
    float xVelocity;
    float yVelocity;    
    float yAcceleration;
    
    NSUInteger index;    
    
    id<BulletDelegate> delegate;
    
}

@property (assign) NSUInteger index;
@property (assign) CGPoint position;
@property (assign) float xVelocity;
@property (assign) id<BulletDelegate> delegate;


- (id)initWithIndex:(NSUInteger)aIndex;

- (void)update:(float)dt;

- (void)explode;

@end

@protocol BulletDelegate <NSObject>

- (void)bulletUpdated:(Bullet *)bullet;
- (void)deleteBullet:(Bullet *)bullet;


@end
