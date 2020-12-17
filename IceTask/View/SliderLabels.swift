//
//  SliderLine.swift
//  IceTask
//
//  Created by Mac Developer on 15.12.2020.
//  Copyright © 2020 Viktoria. All rights reserved.
//

import SwiftUI

struct SliderLabels: View {

    @Binding var point: SliderPointLocation
        
    private let converter = PointConverter()
    var width = WidthGetter.width
    
    var body: some View {
        HStack(alignment: .center, spacing: 10) {
            Text(labelText(from: point.minValue))
                .font(.system(size: Constants.sliderLabelFontSize))
                .foregroundColor(Constants.sliderLabelColor)
            Spacer()
            Text(labelText(from: point.maxValue))
                .font(.system(size: Constants.sliderLabelFontSize))
                .foregroundColor(Constants.sliderLabelColor)
        }
    }
    
    private func labelText(from value: CGFloat) -> String {
        return SliderLabel.chooseText(for: self.converter.intValue(from: value, step: point.step, width: width))
    }
}

