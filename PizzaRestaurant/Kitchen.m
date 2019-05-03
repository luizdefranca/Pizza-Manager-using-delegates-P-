//
//  Kitchen.m
//  PizzaRestaurant
//
//  Created by Steven Masuch on 2014-07-19.
//  Copyright (c) 2014 Lighthouse Labs. All rights reserved.
//

#import "Kitchen.h"

@implementation Kitchen


- (Pizza *)makePizzaWithSize:(PizzaSize)size toppings:(NSArray *)toppings {
    Pizza *pizza = [[Pizza alloc] initWithSize:size andToppings:toppings];
    
    return pizza;
}
+(Pizza *)largePepperoni{
    
    Pizza *pizza = [[Pizza alloc]initWithSize: large andToppings: @[@"cheese", @"pepperoni"]];
    
    return pizza;
}

+(Pizza *)meatLoversWithSize:(PizzaSize)size{
    Pizza *pizza = [[Pizza alloc] initWithSize: size andToppings: @[@"cheese", @"meat"]];
    return pizza;
}
@end
