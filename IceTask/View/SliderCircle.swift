//
//  SliderCircle.swift
//  IceTask
//
//  Created by Mac Developer on 14.12.2020.
//  Copyright © 2020 Viktoria. All rights reserved.
//

import SwiftUI

struct SliderCircle: View {
    
    var body: some View {
        let gradient = LinearGradient(gradient: Gradient(colors: [Constants.circleGradientFrom, Constants.circleGradientTo]), startPoint: .top, endPoint: .bottom)

        return Circle()
            .fill(gradient).opacity(1)
            .frame(width: Constants.circleWidth, height: Constants.circleHeight)
            .aspectRatio(contentMode: .fill)
            .shadow(color: Constants.circleShadow, radius: 7, x: 0, y: 3)
    }
}
