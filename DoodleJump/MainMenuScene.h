//
//  MainMenuScene.h
//  DoodleJump
//
//  Created by Dmitry Ivanov on 9/15/11.
//  Copyright 2011 Sigma Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface MainMenuScene : CCLayer {
    
}

+ (id)scene;

- (void)startGame:(id)sender;
- (void)showSettings:(id)sender;

@end
