//
//  SemiDirector.m
//  Curling
//
//  Created by agnes on 11. 1. 17..
//  Copyright 2011 우리집~. All rights reserved.
//

#import "SemiDirector.h"
#import "cocos2d.h"

@implementation SemiDirector


+(void) startScene: (NSString *)input
{
	Class c = NSClassFromString(input);
	
	CCScene *s = [[CCScene alloc] init];
	[s addChild: [[c alloc] init]];
	[[CCDirector sharedDirector] runWithScene: s];
	[c release];
	[s release];
	
	NSLog(@"%d %d", [c retainCount], [s retainCount]);
	
}

+(void) changeScene: (NSString *)input
{
	Class c = NSClassFromString(input);
	
	CCScene *s = [[CCScene alloc] init];
	[s addChild: [[c alloc] init]];
	[[CCDirector sharedDirector] replaceScene: s];
	[c release];
	[s release];
	
}

+(void) pushScene:(NSString *)input
{
	Class c = NSClassFromString(input);
	
	CCScene *s = [[CCScene alloc] init];
	[s addChild: [[c alloc] init]];
	[[CCDirector sharedDirector] pushScene:s];
	[c release];
	[s release];
}
+(void) popScene
{
	[[CCDirector sharedDirector] popScene];
}

@end
