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
#import "Pizza.h"
#import "ManagerThatHateAnchovies.h"
#import "SecondManager.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        NSLog(@"Please pick your pizza size and toppings:");
        NSString *choseManagerMessage = @"Please, chose your manager:\n \"first\" or \"second\" or anything to no manager";
        
        Kitchen *restaurantKitchen = [Kitchen new];
        
        
        while (TRUE) {
            // Loop forever
            
            NSString *managerOption = [InputOutputController inputForPrompt: choseManagerMessage];
            
            if ([managerOption isEqualToString: @"first"]) {
                ManagerThatHateAnchovies *noAnch = [ManagerThatHateAnchovies new];
                restaurantKitchen.delegate = noAnch;
            }else if ( [managerOption isEqualToString: @"second"]) {
                SecondManager *second = [SecondManager new];
                restaurantKitchen.delegate = second;
            }
            
            NSLog(@"> ");
            char str[100];
            fgets (str, 100, stdin);
            
            NSString *inputString = [[NSString alloc] initWithUTF8String:str];
            inputString = [inputString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
            
            NSLog(@"Input was %@", inputString);
            
            // Take the first word of the command as the size, and the rest as the toppings
            NSArray *commandWords = [inputString componentsSeparatedByString:@" "];
            
            Pizza *pizza = [Pizza new];
            // And then send some message to the kitchen...
            if(commandWords.count > 0){
            
                if(commandWords.count == 1){
                    if([commandWords[0] isEqualToString:@"pepperoni"]){
                        pizza = [Kitchen largePepperoni];
                  //      NSLog(@"largepepperoni");
                    }
                } else if(commandWords.count == 2){
                    if ([commandWords[0] isEqualToString: @"meatlovers"]) {
                        PizzaSize size = [InputOutputController convertStringToPizzaSize: commandWords[1]];
                        pizza = [Kitchen meatLoversWithSize: size];
                 //       NSLog(@"meatLoversWith");
                    }
                } else {
                
            
              NSString * sizeString = [[NSString alloc]initWithString:commandWords[0]];
                PizzaSize size = [InputOutputController convertStringToPizzaSize:sizeString];
               NSArray<NSString*>* toppings = [commandWords subarrayWithRange: NSMakeRange(1, commandWords.count  - 1)];
               pizza = [restaurantKitchen makePizzaWithSize: size toppings:toppings];
               //     NSLog(@"others");
                }
            }
          
            NSLog(@"%@", pizza);
        }

    }
    return 0;
}

