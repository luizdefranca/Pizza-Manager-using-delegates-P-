//
//  InputOutputController.m
//  PizzaRestaurant
//
//  Created by Luiz on 5/2/19.
//  Copyright © 2019 Lighthouse Labs. All rights reserved.
//

#import "InputOutputController.h"

@implementation InputOutputController

+ (PizzaSize)convertStringToPizzaSize: (NSString *)size {
    if ([[size uppercaseString] isEqualToString: @"small"]) return small;
    if ([[size uppercaseString] isEqualToString: @"medium"]) return medium;
    if ([[size uppercaseString] isEqualToString: @"large"]) return large;

    return unknown;
}
@end
