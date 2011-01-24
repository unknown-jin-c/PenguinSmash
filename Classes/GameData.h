//
//  GameData.h
//  Curling
//
//  Created by agnes on 11. 1. 21..
//  Copyright 2011 우리집~. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface GameData : NSObject {
	
	// for resizing Image
	float fScaleSize;

}
+(GameData *)sharedData;

@property (nonatomic, readwrite) float fScaleSize;

@end
