//
//  Utility.h
//  Curling
//
//  Created by agnes on 11. 1. 19..
//  Copyright 2011 우리집~. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Utility : NSObject {

}
+ (UIImage*)imageWithImage:(UIImage*)image scaledToSize:(CGSize)newSize;
+(UIImage*)imageByCropping:(UIImage *)imageToCrop toRect:(CGRect)rect;
@end
