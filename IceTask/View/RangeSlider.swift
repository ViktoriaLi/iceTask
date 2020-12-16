//
//  RangeSlider.swift
//  IceTask
//
//  Created by Mac Developer on 14.12.2020.
//  Copyright © 2020 Viktoria. All rights reserved.
//

struct Constant {
    
}

enum Value: String {
    case minValue = "minValue"
    case maxValue = "maxValue"
}

import SwiftUI

struct RangeSlider: View {
    @Binding var currentValue: SliderPointLocation
    @Binding var resetAllowed: Bool
    
    var totalWidth = UIScreen.main.bounds.width - 60
    
    let converter = PointConverter()
    let sliderManager = SliderSettings(width: UIScreen.main.bounds.width - 60)

   
    
    var body: some View {
        
        VStack {
            ZStack(alignment: .leading) {
                //SliderLine(minValue: self.metaData.currentPoint.minValue, maxValue: self.metaData.currentPoint.maxValue)
                Rectangle()
                    .fill(Color.gray.opacity(0.5))
                    .frame(width: totalWidth, height: 3)
                Rectangle()
                    .fill(Color.blue)
                    .frame(width: self.currentValue.maxValue - self.currentValue.minValue, height: 3)
                    .offset(x: self.currentValue.minValue)
                HStack(alignment: .center, spacing: 10) {
                    //CircleWithLabel(value: self.intValue(from: self.metaData.currentPoint.minValue), location: self.metaData.currentPoint.minValue)
                    Text(SliderLabel.chooseText(for: self.converter.intValue(from: self.currentValue.minValue, step: currentValue.step, width: totalWidth))).font(.system(size: 16))
                            .foregroundColor(Color.blue)
                            .multilineTextAlignment(.leading)
                    Spacer()
                    Text(SliderLabel.chooseText(for: self.converter.intValue(from: self.currentValue.maxValue, step: currentValue.step, width: totalWidth))).font(.system(size: 16))
                            .foregroundColor(Color.blue)
                            .multilineTextAlignment(.trailing)
                }
                .padding(.bottom, 70.0)
                HStack(alignment: .center, spacing: 10) {
                    SliderCircle()
                        .offset(x: self.currentValue.minValue - 15)
                        .gesture(
                            DragGesture()
                                .onChanged({ (value) in
                                    if value.location.x >= 0 && value.location.x <= self.currentValue.maxValue && value.location.x <= self.totalWidth {
                                        self.currentValue.minValue = value.location.x
                                        self.updateResetState(value: self.currentValue.minValue, step: self.currentValue.step, whichCase: .minValue)
                                    }
                                }))
                    SliderCircle()
                        .offset(x: self.currentValue.maxValue - 46)
                        .gesture(
                            DragGesture()
                                .onChanged({ (value) in
                                    if value.location.x <= self.totalWidth && value.location.x >= self.currentValue.minValue {
                                        self.currentValue.maxValue = value.location.x
                                        self.updateResetState(value: self.currentValue.maxValue, step: self.currentValue.step, whichCase: .maxValue)
                                    }
                                }))
                }

                .allowsTightening(false)
            }
        }
        .background(Color.white).edgesIgnoringSafeArea(.all)
        .padding()
        .frame(height: 94.0)
    }
    
    func updateResetState(value: CGFloat, step: Int, whichCase: Value) {
        let defaultPosition = sliderManager.defaultValues[self.currentValue.id]
        var valueToCompare = defaultPosition.minValue
        if whichCase == .maxValue {
            valueToCompare = defaultPosition.maxValue
        }
        if self.converter.intValue(from: value, step: step, width: self.totalWidth) != valueToCompare {
            self.resetAllowed = true
        } else {
            self.resetAllowed = false
        }
    }
}

/*struct RangeSlider_Previews: PreviewProvider {
    static var previews: some View {
        RangeSlider(metaData: SliderLocationInfo(
            rangePoint: SliderPointLocation(minValue: 0, maxValue: 31), currentPoint: SliderPointLocation(minValue: 0, maxValue: 31), step: 1), currentValue: SliderPointLocation(minValue: 0, maxValue: 31))
    }
}*/

