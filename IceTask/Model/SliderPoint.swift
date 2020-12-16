//
//  SliderPoint.swift
//  IceTask
//
//  Created by Mac Developer on 15.12.2020.
//  Copyright © 2020 Viktoria. All rights reserved.
//

import Foundation

struct SliderPoint: Equatable, Identifiable {
    var id: Int
    var minValue: Int
    var maxValue: Int
    var step: Int
    
    static func ==(lhs: SliderPoint, rhs: SliderPoint) -> Bool {
        return lhs.id == rhs.id && lhs.minValue == rhs.minValue && lhs.maxValue == rhs.maxValue
    }
}
