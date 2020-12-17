//
//  SliderSettings.swift
//  IceTask
//
//  Created by Mac Developer on 15.12.2020.
//  Copyright © 2020 Viktoria. All rights reserved.
//

import Foundation

class SliderSettings {
    
    private let converter = PointConverter()
    
    var defaultValues: [SliderPoint] = [
                SliderPoint(id: 0, minValue: 0, maxValue: 32, step: 1),
                SliderPoint(id: 1, minValue: 0, maxValue: 32, step: 2),
                SliderPoint(id: 2, minValue: 17, maxValue: 19, step: 1),
                SliderPoint(id: 3, minValue: 6, maxValue: 13, step: 1)]
    
    var defaultValuesCoordinates: [SliderPointLocation] {
        return coordinatesArray(values: defaultValues)
    }
    
    func coordinatesArray(values: [SliderPoint]) -> [SliderPointLocation] {
        var result = [SliderPointLocation]()
        for value in values {
            let newPoint = convertToCoordinate(point: value)
            result.append(newPoint)
        }
        return result
    }
    
    func convertToCoordinate(point: SliderPoint) -> SliderPointLocation {
        return SliderPointLocation(id: point.id, minValue: converter.floatValue(from: point.minValue, step: point.step, width: WidthGetter.width), maxValue: converter.floatValue(from: point.maxValue, step: point.step, width: WidthGetter.width), step: point.step)
    }
    
    func currentIntValues(values: [SliderPointLocation]) -> [SliderPoint] {
        var result = [SliderPoint]()
        for value in values {
            let newPoint = convertToInt(from: value)
            result.append(newPoint)
        }
        return result
    }
    
    func convertToInt(from value: SliderPointLocation) -> SliderPoint {
        return SliderPoint(id: value.id, minValue: converter.intValue(from: value.minValue, step: value.step, width: WidthGetter.width), maxValue: converter.intValue(from: value.maxValue, step: value.step, width: WidthGetter.width), step: value.step)
    }
}
