//
//  RangeSlider.swift
//  IceTask
//
//  Created by Mac Developer on 14.12.2020.
//  Copyright © 2020 Viktoria. All rights reserved.
//

struct Constant {
    
}

import SwiftUI

struct RangeSlider: View {
    @Binding var metaData: SliderLocationInfo
    @Binding var currentValue: SliderPointLocation
    
    @Binding var resetAllowed: Bool
    
    var totalWidth = UIScreen.main.bounds.width - 60
    
    var body: some View {
        
        VStack {
            ZStack(alignment: .leading) {
                //SliderLine(minValue: self.metaData.currentPoint.minValue, maxValue: self.metaData.currentPoint.maxValue)
                Rectangle()
                    .fill(Color.gray.opacity(0.5))
                    .frame(width: totalWidth, height: 3)
                //.offset(x: 15)
                Rectangle()
                    .fill(Color.blue)
                    .frame(width: self.currentValue.maxValue - self.currentValue.minValue, height: 3)
                    .offset(x: self.currentValue.minValue)
                HStack(alignment: .center, spacing: 10) {
                    //CircleWithLabel(value: self.intValue(from: self.metaData.currentPoint.minValue), location: self.metaData.currentPoint.minValue)
                    Text(SliderLabel.chooseText(for: self.intValue(from: self.currentValue.minValue) * metaData.step)).font(.system(size: 16))
                            .foregroundColor(Color.blue)
                            .multilineTextAlignment(.leading)
                    Spacer()
                        Text(SliderLabel.chooseText(for: self.intValue(from: self.currentValue.maxValue))).font(.system(size: 16))
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
                                        if self.intValue(from: self.currentValue.minValue) != self.intValue(from: self.metaData.defaultPoint.minValue) {
                                            self.resetAllowed = true
                                        } else {
                                            self.resetAllowed = false
                                        }
                                    }
                                }))
                    SliderCircle()
                        .offset(x: self.currentValue.maxValue - 46)
                        .gesture(
                            DragGesture()
                                .onChanged({ (value) in
                                    if value.location.x <= self.totalWidth && value.location.x >= self.currentValue.minValue {
                                        print(value.location.x)
                                        self.currentValue.maxValue = value.location.x
                                        if self.intValue(from: self.currentValue.maxValue) != self.intValue(from: self.metaData.defaultPoint.maxValue) {
                                            self.resetAllowed = true
                                        } else {
                                            self.resetAllowed = false
                                        }
                                    }
                                }))
                }

                .allowsTightening(false)
            }
        }
        .padding()
        .frame(height: 94.0)
    }
    
    private func intValue(from value: CGFloat) -> Int {
        let unit: CGFloat = (value / CGFloat(metaData.step)) * 32
        return Int(unit / totalWidth) * metaData.step
    }
}

/*struct RangeSlider_Previews: PreviewProvider {
    static var previews: some View {
        RangeSlider(metaData: SliderLocationInfo(
            rangePoint: SliderPointLocation(minValue: 0, maxValue: 31), currentPoint: SliderPointLocation(minValue: 0, maxValue: 31), step: 1), currentValue: SliderPointLocation(minValue: 0, maxValue: 31))
    }
}*/

