//
//  DictionaryOperator.swift
//  WeatherApp
//
//  Created by Tim Nanney on 1/25/20.
//  Copyright © 2020 Array North. All rights reserved.
//

import Foundation

public func += <Key, Value> ( left: inout [Key: Value], right: [Key: Value]?) {
    guard let right = right else {
        return
    }

    for (key, value) in right {
        left[key] = value
    }
}

public func + <Key, Value> (left: [Key: Value], right: [Key: Value]?) -> [Key: Value] {
    var sum = left
    sum += right
    return sum
}
