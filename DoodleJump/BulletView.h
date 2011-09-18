//
//  BulletView.h
//  DoodleJump
//
//  Created by Dmitry Ivanov on 9/15/11.
//  Copyright 2011 Sigma Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Bullet.h"

@interface BulletView : CCNode <BulletDelegate> {
    NSMutableArray *bulletList;
    NSMutableDictionary *bulletViewDict;
    
}
@property (retain) NSMutableArray *bulletList;
@property (retain) NSMutableDictionary *bulletViewDict;

- (id)initWithBulletList:(NSMutableArray *)aBulletList;

- (void)addBullet:(Bullet *)newBullet;

@end
