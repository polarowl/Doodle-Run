//
//  Level.h
//  DoodleJump
//
//  Created by Dmitry Ivanov on 8/18/11.
//  Copyright 2011 Sigma Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Ground.h"

@interface Level : NSObject {

    NSMutableArray *groundList;
    
}
@property (retain) NSMutableArray *groundList;

- (float)heightAtX:(float)x;

- (void)tick:(float)dt;

@end
