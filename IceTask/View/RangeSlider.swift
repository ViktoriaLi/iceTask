//
//  RangeSlider.swift
//  IceTask
//
//  Created by Mac Developer on 14.12.2020.
//  Copyright © 2020 Viktoria. All rights reserved.
//

import SwiftUI

struct RangeSlider: View {
    
    @Binding var currentValue: SliderPointLocation
    @Binding var resetAllowed: Bool
    
    enum Value: String {
        case minValue = "minValue"
        case maxValue = "maxValue"
    }
    
    var width = UIScreen.main.bounds.width - 60
    let converter = PointConverter()
    let sliderManager = SliderSettings(width: UIScreen.main.bounds.width - 60)

    var body: some View {
        
        VStack {
            ZStack(alignment: .leading) {
                Rectangle()
                    .fill(Color.gray.opacity(0.5))
                    .frame(width: width, height: 3)
                Rectangle()
                    .fill(Color.blue)
                    .frame(width: currentValue.maxValue - currentValue.minValue, height: 3)
                    .offset(x: currentValue.minValue)
                SliderLabels(point: $currentValue)
                .padding(.bottom, 70.0)
                HStack(alignment: .center, spacing: 10) {
                    SliderCircle()
                    .offset(x: self.currentValue.minValue - 15)
                    .gesture(
                        DragGesture()
                            .onChanged({ (value) in
                                if value.location.x >= 0 && value.location.x <= self.currentValue.maxValue && value.location.x <= self.width {
                                    self.currentValue.minValue = value.location.x
                                    self.updateResetState(value: self.currentValue.minValue, step: self.currentValue.step, whichCase: .minValue)
                                }}))
                    SliderCircle()
                    .offset(x: self.currentValue.maxValue - 46)
                    .gesture(
                        DragGesture()
                            .onChanged({ (value) in
                                if value.location.x <= self.width && value.location.x >= self.currentValue.minValue {
                                    self.currentValue.maxValue = value.location.x
                                    self.updateResetState(value: self.currentValue.maxValue, step: self.currentValue.step, whichCase: .maxValue)
                                }}))}

                .allowsTightening(false)
            }
        }
        .padding()
        .frame(height: 94.0)
    }
    
    private func updateResetState(value: CGFloat, step: Int, whichCase: Value) {
        let defaultPosition = sliderManager.defaultValues[self.currentValue.id]
        var valueToCompare = defaultPosition.minValue
        if whichCase == .maxValue {
            valueToCompare = defaultPosition.maxValue
        }
        if self.converter.intValue(from: value, step: step, width: self.width) != valueToCompare {
            self.resetAllowed = true
        } else {
            self.resetAllowed = false
        }
    }
}
