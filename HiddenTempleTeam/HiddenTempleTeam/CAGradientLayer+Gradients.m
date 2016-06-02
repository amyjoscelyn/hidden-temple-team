//
//  CAGradientLayer+Gradients.m
//  HiddenTempleTeam
//
//  Created by Amy Joscelyn on 6/2/16.
//  Copyright © 2016 Amy Joscelyn. All rights reserved.
//

#import "CAGradientLayer+Gradients.h"
#import <UIKit/UIKit.h>

@implementation CAGradientLayer (Gradients)

+ (instancetype)yellowToBrownGradient
{
    //CAGradientLayer *gradient = [self yellowToBrownGradient];    gradient.frame = frame;    return gradient;
    //I'm not exactly sure where the frame would be coming from... maybe another method, calling this one, with frame as a param?
    
    CAGradientLayer *layer = [CAGradientLayer new];
    if (layer)
    {
        UIColor *firstColor = [UIColor colorWithRed:254/256.0 green:253/256.0 blue:56/256.0 alpha:1.0];
        UIColor *secondColor = [UIColor colorWithRed:176/256.0 green:123/256.0 blue:23/256.0 alpha:1.0];
        UIColor *thirdColor = [UIColor colorWithRed:117/256.0 green:80/256.0 blue:25/256.0 alpha:1.0];
        UIColor *fourthColor = [UIColor colorWithRed:68/256.0 green:49/256.0 blue:16/256.0 alpha:1.0];
        
        NSArray *colorsArray = @[(id)firstColor.CGColor, (id)secondColor.CGColor, (id)thirdColor.CGColor, (id)fourthColor.CGColor];
        NSArray *locationsArray = @[@0.0, @0.3, @0.63, @0.95];
        
        layer.colors = colorsArray;
        layer.locations = locationsArray;
    }
    return layer;
}

+ (instancetype)brownToYellowGradient
{
    CAGradientLayer *layer = [CAGradientLayer new];
    if (layer)
    {
        UIColor *fourthColor = [UIColor colorWithRed:254/256.0 green:253/256.0 blue:56/256.0 alpha:1.0];
        UIColor *thirdColor = [UIColor colorWithRed:176/256.0 green:123/256.0 blue:23/256.0 alpha:1.0];
        UIColor *secondColor = [UIColor colorWithRed:117/256.0 green:80/256.0 blue:25/256.0 alpha:1.0];
        UIColor *firstColor = [UIColor colorWithRed:68/256.0 green:49/256.0 blue:16/256.0 alpha:1.0];
        
        NSArray *colorsArray = @[(id)firstColor.CGColor, (id)secondColor.CGColor, (id)thirdColor.CGColor, (id)fourthColor.CGColor];
        NSArray *locationsArray = @[@0.05, @0.37, @0.7, @1.0];
        
        
        layer.colors = colorsArray;
        layer.locations = locationsArray;
    }
    return layer;
}

@end
