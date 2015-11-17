//
//  UTCity.h
//  ObjC vs Swift
//
//  Created by Sri Raghu Malireddi on 14/11/15.
//  Copyright © 2015 Sri Raghu Malireddi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UTCity : NSObject

@property (strong, nonatomic) NSString * name;
@property (assign, nonatomic) NSInteger population;

- (instancetype)initWithName: (NSString *)name population:(NSInteger) population;

@end

@interface UTCountry : NSObject

@property (strong, nonatomic) NSString * name;
@property (strong, nonatomic) NSArray * cities;

- (instancetype)initWithName: (NSString *)name cities:(NSArray *) cities;

- (UTCity *) findCityWithName: (NSString *) name;

@property (strong, nonatomic, readonly) UTCity * cityWithLargestPopulation;

@end
