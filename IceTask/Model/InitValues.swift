//
//  InitValues.swift
//  IceTask
//
//  Created by Mac Developer on 16.12.2020.
//  Copyright © 2020 Viktoria. All rights reserved.
//

import Foundation
import SwiftUI

class InitValues: ObservableObject {
    
    let sliderManager = SliderSettings()
    
    @Published var values: [SliderPoint]
    @Published var valuesCoordinates = [SliderPointLocation]()
    @Published var changeableValues: [SliderPoint]
    
    init() {
        self.values = sliderManager.defaultValues
        self.valuesCoordinates = sliderManager.defaultValuesCoordinates
        self.changeableValues = sliderManager.defaultValues
    }
}
