//
//  SliderSettings.swift
//  IceTask
//
//  Created by Mac Developer on 15.12.2020.
//  Copyright © 2020 Viktoria. All rights reserved.
//

import Foundation
import SwiftUI

class SliderSettings {
    
    let width: CGFloat
    
    init(width: CGFloat) {
        self.width = width - 15
    }
    var slidersMeta: [SliderInfo] = [SliderInfo(rangePoint: SliderPoint(id: 0, minValue: 0, maxValue: 31, step: 1), defaultPoint: SliderPoint(id: 0, minValue: 0, maxValue: 31, step: 1), step: 1),
                                     SliderInfo(rangePoint: SliderPoint(id: 1, minValue: 0, maxValue: 31, step: 2), defaultPoint: SliderPoint(id: 1, minValue: 0, maxValue: 31, step: 2), step: 2),
                                     SliderInfo(rangePoint: SliderPoint(id: 2, minValue: 0, maxValue: 31, step: 1), defaultPoint: SliderPoint(id: 2, minValue: 18, maxValue: 20, step: 1), step: 1),
                                     SliderInfo(rangePoint: SliderPoint(id: 3, minValue: 0, maxValue: 31, step: 1), defaultPoint: SliderPoint(id: 3, minValue: 7, maxValue: 14, step: 1), step: 1)]
    
    func slidersLocation() -> [SliderLocationInfo] {
        var resultArray = [SliderLocationInfo]()
        
        for slider in slidersMeta {
            let newSlider = SliderLocationInfo(
                rangePoint: convertToCoordinate(point: slider.rangePoint), currentPoint: convertToCoordinate(point: slider.defaultPoint), step: slider.step)
            print(newSlider)
            resultArray.append(newSlider)
        }
        return resultArray
    }
    
    func currentCoordinates(values: [SliderPoint]) -> [SliderPointLocation] {
        var result = [SliderPointLocation]()
        for value in values {
            let newPoint = convertToCoordinate(point: value)
            result.append(newPoint)
        }
        return result
    }
    
    func convertToCoordinate(point: SliderPoint) -> SliderPointLocation {
        return SliderPointLocation(minValue: floatValue(from: point.minValue, step: point.step), maxValue: floatValue(from: point.maxValue, step: point.step))
    }
    
    func floatValue(from value: Int, step: Int) -> CGFloat {
        print("sett \(width)")
        var result = CGFloat(value) * ((width / 31.0) * CGFloat(step))
        if result > width {
            result = width
        }
        return result
    }
}
