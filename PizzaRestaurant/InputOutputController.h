//
//  InputOutputController.h
//  PizzaRestaurant
//
//  Created by Luiz on 5/2/19.
//  Copyright © 2019 Lighthouse Labs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Pizza.h"
NS_ASSUME_NONNULL_BEGIN

@interface InputOutputController : NSObject
+(PizzaSize) convertStringToPizzaSize: (NSString*) size;
@end

NS_ASSUME_NONNULL_END
