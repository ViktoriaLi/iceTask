//
//  CircleWithLabel.swift
//  IceTask
//
//  Created by Mac Developer on 15.12.2020.
//  Copyright © 2020 Viktoria. All rights reserved.
//

import SwiftUI

struct CircleWithLabel: View {
    var value: Int
    var location: CGFloat
    
    var body: some View {
        VStack(spacing: 8.0) {
            Text(SliderLabel.chooseText(for: value)).font(.system(size: 16))
                .foregroundColor(Color.blue)
                .multilineTextAlignment(.leading)
            SliderCircle()
                .offset(x: location)
        }
        //.padding(.bottom, 27.0)
    }
}

struct CircleWithLabel_Previews: PreviewProvider {
    static var previews: some View {
        CircleWithLabel(value: 0, location: 0.0)
    }
}
