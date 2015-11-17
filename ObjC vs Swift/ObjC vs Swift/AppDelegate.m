//
//  AppDelegate.m
//  ObjC vs Swift
//
//  Created by Sri Raghu Malireddi on 14/11/15.
//  Copyright © 2015 Sri Raghu Malireddi. All rights reserved.
//

#import "AppDelegate.h"
#import "UTCity.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (void) loadStuff {
    NSArray * cities = @[
                         [[UTCity alloc] initWithName:@"Toronto" population: 3000000],
                         [[UTCity alloc] initWithName:@"Vancouver" population: 5]
                         ];
    UTCountry * canada = [[UTCountry alloc] initWithName:@"Canada" cities: cities];
    UTCity * vancouver = [canada findCityWithName:@"Vancouver"];
    UTCity * largestCity = canada.cityWithLargestPopulation;
    UTCity * largestCity2 = [canada cityWithLargestPopulation];
    
    NSString * a = @"abc";
    NSObject * mystring = a;
    NSString * myString = a;
    NSString Mystring = a;
    NSMutableString * MyString = a;
    
    
//    id object = @"message";
//    NSDictionary * dict = @{@"Age":@23,@"Name":@"John"};
//    NSObject *obj = @"message";
//    NSArray * array = @[23,3,4];
//    NSMutableString * obji = @"message";
}

@end
