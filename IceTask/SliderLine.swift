//
//  SliderLine.swift
//  IceTask
//
//  Created by Mac Developer on 15.12.2020.
//  Copyright © 2020 Viktoria. All rights reserved.
//

import SwiftUI

struct SliderLine: View {

    var minValue: CGFloat
    var maxValue: CGFloat
    
    var body: some View {
        ZStack {
            Rectangle()
            .fill(Color.gray.opacity(0.5))
            .frame(height: 3)
            Rectangle()
            .fill(Color.blue)
            .frame(width: maxValue - minValue, height: 3)
            .offset(x: minValue + 31)
        }
    }
}

struct SliderLine_Previews: PreviewProvider {
    static var previews: some View {
        SliderLine(minValue: 0, maxValue: 0)
    }
}
