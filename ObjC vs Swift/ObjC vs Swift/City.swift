//
//  City.swift
//  ObjC vs Swift
//
//  Created by Sri Raghu Malireddi on 14/11/15.
//  Copyright © 2015 Sri Raghu Malireddi. All rights reserved.
//

import UIKit

class City {
    
    let name: String
    let population: Int
    
    init(name: String, population: Int){
        self.name = name
        self.population = population
    }

}

class Country {
    let name: String
    let cities: [City]
    
    init(name: String, cities: [City]){
        self.name = name
        self.cities = cities
    }
    
    func findCityWithName(name: String) -> City?{
        for city in cities{
            if city.name == name{
                return city
            }
        }
        return nil
    }
    
    var cityWithLargestPopulation: City {
        var maxPopulation = 0
        var largestCity: City = cities[0]
        for city in cities{
            if city.population > maxPopulation {
                largestCity = city
                maxPopulation = city.population
            }
        }
        return largestCity
    }
}
