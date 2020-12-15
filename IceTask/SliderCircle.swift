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
        let gradient = LinearGradient(gradient: Gradient(colors: [Color.white, Color("gradientGray")]), startPoint: .top, endPoint: .bottom)
        //ZStack {
            return Circle()
            .fill(gradient).opacity(1)
            .frame(width: 31, height: 31)
            .aspectRatio(contentMode: .fill)
            .shadow(color: Color("circleShadow"), radius: 7, x: 0, y: 3)
        //}
    }
}

struct SliderCircle_Previews: PreviewProvider {
    static var previews: some View {
        SliderCircle()
    }
}
