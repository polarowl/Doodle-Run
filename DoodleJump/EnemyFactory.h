//
//  EnemyFactory.h
//  DoodleJump
//
//  Created by Dmitry Ivanov on 9/1/11.
//  Copyright 2011 Sigma Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Enemy.h"

@interface EnemyFactory :  NSObject {
    
    NSUInteger currentEnemyIndex;
    
}

@property (assign) NSUInteger currentEnemyIndex;

- (NSMutableArray *)generateEnemiesForLevel:(Level *)level fromX:(float)x;
- (int)getRandWithMin:(int)min andMax:(int)max;

@end
