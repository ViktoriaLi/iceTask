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
        self.width = width
    }
    var slidersMeta: [SliderInfo] = [SliderInfo(rangePoint: SliderPoint(minValue: 0, maxValue: 30), currentPoint: SliderPoint(minValue: 0, maxValue: 30), step: 1),
    SliderInfo(rangePoint: SliderPoint(minValue: 0, maxValue: 30), currentPoint: SliderPoint(minValue: 0, maxValue: 30), step: 2),
    SliderInfo(rangePoint: SliderPoint(minValue: 0, maxValue: 30), currentPoint: SliderPoint(minValue: 18, maxValue: 20), step: 1),
    SliderInfo(rangePoint: SliderPoint(minValue: 0, maxValue: 30), currentPoint: SliderPoint(minValue: 7, maxValue: 14), step: 1)]
    
    func slidersLocation() -> [SliderLocationInfo] {
        var resultArray = [SliderLocationInfo]()
        
        for slider in slidersMeta {
            let newSlider = SliderLocationInfo(
                rangePoint: SliderPointLocation(minValue: floatValue(from: slider.rangePoint.minValue), maxValue: floatValue(from: slider.rangePoint.maxValue)), currentPoint: SliderPointLocation(minValue: floatValue(from: slider.currentPoint.minValue), maxValue: floatValue(from: slider.currentPoint.maxValue)), step: slider.step)
            resultArray.append(newSlider)
        }
        return resultArray
    }
    
    func floatValue(from value: Int) -> CGFloat {
        return CGFloat(value) * (width / 30.0)
    }
}
