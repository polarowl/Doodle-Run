//
//  Level.m
//  DoodleJump
//
//  Created by Dmitry Ivanov on 8/18/11.
//  Copyright 2011 Sigma Ltd. All rights reserved.
//

#import "Level.h"


@implementation Level


@synthesize groundList;

-(float)heightAtX:(float)x
{
    for (Ground *ground in self.groundList)
    {
        if (x > ground.xstart && x <= ground.xend)
        {
            return ground.height;
        }
    }
    return -100;
}
//todo level delegate
@end
