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
        .frame(width: WidthGetter.width, alignment: .center)
        .padding()
        .background(Constants.actionButtonBackground)
        .foregroundColor(Color.white)
        .cornerRadius(10)
        .shadow(color: Constants.actionButtonShadow, radius: 10, x: 0, y: 0)
  }
}
