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
        let grayColor = Color(red: 242, green: 247, blue: 249).opacity(1)
        let gradient = LinearGradient(gradient: Gradient(colors: [Color.white, Color.gray), startPoint: .top, endPoint: .bottom)
        //ZStack {
        //let color = Color(red: 68, green: 78, blue: 84).opacity(0.20)
            return Circle()
            .fill(gradient)
            .frame(width: 31, height: 31)
            //.aspectRatio(contentMode: .fit)
            //.shadow(color: color, radius: 7, x: 0, y: 3)
        //}
    }
}

struct SliderCircle_Previews: PreviewProvider {
    static var previews: some View {
        SliderCircle()
    }
}
