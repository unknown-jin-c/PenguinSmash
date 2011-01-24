//
//  OptionScene.m
//  Curling
//
//  Created by agnes on 11. 1. 19..
//  Copyright 2011 우리집~. All rights reserved.
//

#import "OptionScene.h"


@implementation OptionScene

// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
	// in case you have something to dealloc, do it in this method
	// in this particular example nothing needs to be released.
	// cocos2d will automatically release all the children (Label)
	
	// don't forget to call "super dealloc"
	[super dealloc];
}

@end
