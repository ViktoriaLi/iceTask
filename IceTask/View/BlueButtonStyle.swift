//
//  BlueButtonStyle.swift
//  IceTask
//
//  Created by Mac Developer on 16.12.2020.
//  Copyright © 2020 Viktoria. All rights reserved.
//

import SwiftUI

struct BlueButtonStyle: ButtonStyle {

  func makeBody(configuration: Self.Configuration) -> some View {
    configuration.label
        .frame(width: UIScreen.main.bounds.width - 60 - 15, alignment: .center)
        .padding()
        .background(Color.blue)
        .foregroundColor(Color.white)
        .cornerRadius(10)
        .shadow(color: Color("buttonShadow"), radius: 10, x: 0, y: 0)
  }
}
