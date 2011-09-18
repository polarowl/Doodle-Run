//
//  Button.m
//  DoodleJump
//
//  Created by Dmitry Ivanov on 8/28/11.
//  Copyright 2011 Sigma Ltd. All rights reserved.
//

#import "ButtonView.h"


@implementation ButtonView

@synthesize delegate;

- (id)initWithFileName:(NSString *)fileName
{
    self = [super init];
    if (self) {
        buttonSprite = [CCSprite spriteWithFile:fileName];
        buttonSprite.scale = 0.7;
        [self addChild:buttonSprite];
    }
    return self;
}

- (id)init {
    return [self initWithFileName:@"button.png"];
}

- (void)onEnter
{
	[[CCTouchDispatcher sharedDispatcher] addTargetedDelegate:self priority:0 swallowsTouches:YES];
	[super onEnter];
}

- (void)onExit
{
	[[CCTouchDispatcher sharedDispatcher] removeDelegate:self];
	[super onExit];
}

- (BOOL)touchInButtonSprite:(UITouch *)touch {
    CGPoint touchPosInButtonViewCoords = [buttonSprite convertTouchToNodeSpace:touch];
    
    CGRect rect = CGRectMake(0, 0, 
                             buttonSprite.contentSize.width, 
                             buttonSprite.contentSize.height);
    
    return CGRectContainsPoint(rect, touchPosInButtonViewCoords);
}

- (BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event
{
    if ([self touchInButtonSprite:touch]) {
        buttonSprite.opacity = 127;
        return YES;
    }
    
    return NO;
}

- (void)ccTouchMoved:(UITouch *)touch withEvent:(UIEvent *)event
{
    if ([self touchInButtonSprite:touch]) {
        buttonSprite.opacity = 127;
    } else {
        buttonSprite.opacity = 255;    
    }
}

- (void)ccTouchEnded:(UITouch *)touch withEvent:(UIEvent *)event
{
    buttonSprite.opacity = 255;

    if ([self touchInButtonSprite:touch]) {
        [delegate buttonTouchedUpInside:self];
    }
}

- (void)ccTouchCancelled:(UITouch *)touch withEvent:(UIEvent *)event
{
    buttonSprite.opacity = 255;
}

@end
