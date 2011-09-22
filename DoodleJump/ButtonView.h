//
//  Button.h
//  DoodleJump
//
//  Created by Dmitry Ivanov on 8/28/11.
//  Copyright 2011 Sigma Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@protocol ButtonViewDelegate;

@interface ButtonView : CCNode <CCTargetedTouchDelegate> {
    
    CCSprite *buttonSprite;
    id <ButtonViewDelegate> delegate;
    double startTouchTime;
    double endTouchTime;
    
}

@property (assign) id <ButtonViewDelegate> delegate;

- (id)initWithFileName:(NSString *)fileName;

@end

@protocol ButtonViewDelegate <NSObject>

- (void)buttonTouchedUpInside:(id)sender forTime:(double)dt;

@end