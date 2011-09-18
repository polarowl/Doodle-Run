//
//  LevelView.h
//  DoodleJump
//
//  Created by Dmitry Ivanov on 8/18/11.
//  Copyright 2011 Sigma Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Level.h"


@interface LevelView : CCNode {
    Level *level;
}

- (id)initWithLevel:(Level *)level;

@property (retain) Level *level;

@end
