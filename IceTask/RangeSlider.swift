//
//  RangeSlider.swift
//  IceTask
//
//  Created by Mac Developer on 14.12.2020.
//  Copyright © 2020 Viktoria. All rights reserved.
//

import SwiftUI

struct RangeSlider: View {
    var metaData: SliderInfo
    @State var width: CGFloat = 0
    @State var width1: CGFloat = 60
    
    var totalWidth = UIScreen.main.bounds.width - 60
    var body: some View {
        VStack {
            ZStack(alignment: .leading) {
                Rectangle()
                    .fill(Color.gray.opacity(0.5))
                    .frame(height: 3)
                Rectangle()
                    .fill(Color.blue)
                    .frame(width: self.width1 - self.width, height: 3)
                    .offset(x: self.width)
                HStack(spacing: 0) {
                    VStack(spacing: 8.0) {
                        Text("\(stringvValue(from: self.width)) ночь").font(.system(size: 16))
                            .foregroundColor(Color.blue)
                            .multilineTextAlignment(.leading)
                        SliderCircle()
                        .offset(x: self.width)
                    }
                    .padding(.bottom, 27.0)
                    .gesture(
                    DragGesture()
                        .onChanged({ (value) in
                            if value.location.x >= 0 && value.location.x <= self.width1 {
                            self.width = value.location.x
                            }
                        }))
                    VStack(alignment: .leading, spacing: 8.0) {
                        Text("Более \(stringvValue(from: self.width1)) ночей")
                            .font(.system(size: 16))
                            .foregroundColor(Color.blue)
                            .multilineTextAlignment(.trailing)
                        SliderCircle()
                            .offset(x: self.width1)
                    }
                    .padding(.bottom, 27.0)
                    .gesture(
                    DragGesture()
                        .onChanged({ (value) in
                            if value.location.x <= self.totalWidth && value.location.x >= self.width {
                            self.width1 = value.location.x
                            }
                        }))
                }
            }

        }
        .padding()
        .frame(height: 94.0)

    }
    private func stringvValue(from value: CGFloat) -> String {
        
        return String(Int(value / 31))
    }
}

struct RangeSlider_Previews: PreviewProvider {
    static var previews: some View {
        RangeSlider(metaData: SliderInfo(minValue: 1, maxValue: 30, currentValue: 1, step: 1))
    }
}
