//
//  Ground.h
//  DoodleJump
//
//  Created by Dmitry Ivanov on 8/18/11.
//  Copyright 2011 Sigma Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Ground : NSObject {
    float xstart;
    float xend;
    float height;
}

@property (assign) float xstart;
@property (assign) float xend;
@property (assign) float height;

@end
