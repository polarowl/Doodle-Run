//
//  GameScene.h
//  DoodleJump
//
//  Created by Dmitry Ivanov on 8/18/11.
//  Copyright 2011 Sigma Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "WorldView.h"
#import "ControlsView.h"
#import "World.h"

@interface GameScene : CCLayer {

    WorldView *worldView;
    World *world;
    ControlsView *controlsView;
    
}

+ (id)scene;


@end
