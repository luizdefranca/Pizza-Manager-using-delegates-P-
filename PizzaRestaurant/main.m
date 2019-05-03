//
//  main.m
//  PizzaRestaurant
//
//  Created by Steven Masuch on 2014-07-19.
//  Copyright (c) 2014 Lighthouse Labs. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Kitchen.h"
#import "InputOutputController.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        NSLog(@"Please pick your pizza size and toppings:");
        
        Kitchen *restaurantKitchen = [Kitchen new];
        
        while (TRUE) {
            // Loop forever
            
            NSLog(@"> ");
            char str[100];
            fgets (str, 100, stdin);
            
            NSString *inputString = [[NSString alloc] initWithUTF8String:str];
            inputString = [inputString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
            
            NSLog(@"Input was %@", inputString);
            
            // Take the first word of the command as the size, and the rest as the toppings
            NSArray *commandWords = [inputString componentsSeparatedByString:@" "];
            
            
            // And then send some message to the kitchen...
            if(commandWords.count > 0){
            
                if(commandWords.count == 1){
                    if([commandWords[0] isEqualToString:@"pepperoni"]){
                        [Kitchen largePepperoni];
                  //      NSLog(@"largepepperoni");
                    }
                } else if(commandWords.count == 2){
                    if ([commandWords[0] isEqualToString: @"meatlovers"]) {
                        PizzaSize size = [InputOutputController convertStringToPizzaSize: commandWords[1]];
                        [Kitchen meatLoversWithSize: size];
                 //       NSLog(@"meatLoversWith");
                    }
                } else {
                
            
              NSString * sizeString = [[NSString alloc]initWithString:commandWords[0]];
                PizzaSize size = [InputOutputController convertStringToPizzaSize:sizeString];
               NSArray<NSString*>* toppings = [commandWords subarrayWithRange: NSMakeRange(1, commandWords.count  - 1)];
               [restaurantKitchen makePizzaWithSize: size toppings:toppings];
               //     NSLog(@"others");
                }
            }
            
        }

    }
    return 0;
}

