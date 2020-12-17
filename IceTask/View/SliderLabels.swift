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
        
    let converter = PointConverter()
    var width = UIScreen.main.bounds.width - 60 - 15
    
    var body: some View {
        HStack(alignment: .center, spacing: 10) {
            Text(labelText(from: point.minValue)).font(.system(size: 16))
                    .foregroundColor(Color.blue)
                    .multilineTextAlignment(.leading)
            Spacer()
            Text(labelText(from: point.maxValue)).font(.system(size: 16))
                    .foregroundColor(Color.blue)
                    .multilineTextAlignment(.trailing)
        }
    }
    
    private func labelText(from value: CGFloat) -> String {
        return SliderLabel.chooseText(for: self.converter.intValue(from: value, step: point.step, width: width))
    }
}

