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
    @State var metaData: SliderLocationInfo
    @State var currentValue: SliderPointLocation
    
    var totalWidth = UIScreen.main.bounds.width - 60
    
    var body: some View {
        
        VStack {
            ZStack(alignment: .leading) {
                //SliderLine(minValue: self.metaData.currentPoint.minValue, maxValue: self.metaData.currentPoint.maxValue)
                Rectangle()
                    .fill(Color.gray.opacity(0.5))
                    .frame(height: 3)
                //.offset(x: 15)
                Rectangle()
                    .fill(Color.blue)
                    .frame(width: self.currentValue.maxValue - self.currentValue.minValue, height: 3)
                    
                    .offset(x: self.currentValue.minValue)
                HStack(alignment: .center, spacing: 10) {
                    //CircleWithLabel(value: self.intValue(from: self.metaData.currentPoint.minValue), location: self.metaData.currentPoint.minValue)
                        Text(SliderLabel.chooseText(for: self.intValue(from: self.currentValue.minValue))).font(.system(size: 16))
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
                        //.padding(.bottom, 27.0)
                        .gesture(
                            DragGesture()
                                .onChanged({ (value) in
                                    if value.location.x >= 0 && value.location.x <= self.currentValue.maxValue && value.location.x <= self.totalWidth {
                                        self.currentValue.minValue = value.location.x
                                    }
                                }))
                    //CircleWithLabel(value: self.intValue(from: self.metaData.currentPoint.maxValue), location: self.metaData.currentPoint.maxValue)
                    SliderCircle()
                        .offset(x: self.currentValue.maxValue - 65)
                        //.padding(.bottom, 27.0)
                        .gesture(
                            DragGesture()
                                .onChanged({ (value) in
                                    if value.location.x <= self.totalWidth && value.location.x >= self.currentValue.minValue {
                                        self.currentValue.maxValue = value.location.x
                                    }
                                }))
                }
                .padding(.trailing, 5.0)
                .frame(width: 100.0)
                .allowsTightening(false)
                
                
            }
        }
        .onAppear(perform: pr)
        .padding()
        .frame(height: 94.0)
    }
    
    func pr() {
        print(totalWidth)
    }
    
    private func intValue(from value: CGFloat) -> Int {
        return Int(value * 31 / (UIScreen.main.bounds.width - 60))
    }
    
    private func floatValue<T>(from value: T) -> CGFloat {
        return CGFloat(value as! CGFloat * ((UIScreen.main.bounds.width - 60) / 31))
    }
}

struct RangeSlider_Previews: PreviewProvider {
    static var previews: some View {
        RangeSlider(metaData: SliderLocationInfo(
            rangePoint: SliderPointLocation(minValue: 0, maxValue: 31), currentPoint: SliderPointLocation(minValue: 0, maxValue: 31), step: 1), currentValue: SliderPointLocation(minValue: 0, maxValue: 31))
    }
}

