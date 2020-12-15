//
//  RangeSlider.swift
//  IceTask
//
//  Created by Mac Developer on 14.12.2020.
//  Copyright © 2020 Viktoria. All rights reserved.
//

import SwiftUI

struct RangeSlider: View {
    @State var metaData: SliderInfo
    
    var totalWidth = UIScreen.main.bounds.width - 60
    
    var body: some View {
        
        VStack {
            ZStack(alignment: .leading) {
                SliderLine(minValue: CGFloat(self.metaData.currentPoint.minValue), maxValue: CGFloat(self.metaData.currentPoint.maxValue))
                HStack(spacing: 0) {
                    CircleWithLabel(value: self.intValue(from: self.metaData.currentPoint.minValue), location: CGFloat(self.metaData.currentPoint.minValue))
                    .gesture(
                    DragGesture()
                        .onChanged({ (value) in
                            if value.location.x >= 0 && value.location.x <= self.metaData.currentPoint.maxValue {
                                self.metaData.currentPoint.minValue = value.location.x
                            }
                        }))
                    CircleWithLabel(value: self.intValue(from: self.metaData.currentPoint.maxValue), location: CGFloat(self.metaData.currentPoint.maxValue))
                    .gesture(
                    DragGesture()
                        .onChanged({ (value) in
                            if value.location.x <= self.totalWidth && value.location.x >= self.metaData.currentPoint.minValue {
                            self.metaData.currentPoint.maxValue = value.location.x
                            }
                        }))
                }
            }
        }
        .padding()
        .frame(height: 94.0)
    }
    
    private func intValue(from value: CGFloat) -> Int {
        return Int(CGFloat(value) * (UIScreen.main.bounds.width - 60) / 31)
    }
}

struct RangeSlider_Previews: PreviewProvider {
    static var previews: some View {
        RangeSlider(metaData: SliderInfo(rangePoint: SliderPoint(minValue: 1, maxValue: 31), currentPoint: SliderPoint(minValue: 1, maxValue: 31), step: 1))
    }
}

/*.gesture(
DragGesture()
    .onChanged({ (value) in
        if value.location.x >= 0 && value.location.x <= self.metaData.currentPoint.maxValue {
        self.metaData.currentPoint.minValue = value.location.x
        }
    }))*/

/*.gesture(
DragGesture()
    .onChanged({ (value) in
        if value.location.x <= self.totalWidth && value.location.x >= self.metaData.currentPoint.minValue {
        self.metaData.currentPoint.maxValue = value.location.x
        }
    }))*/
