//
//  FiltersValues.swift
//  IceTask
//
//  Created by Mac Developer on 15.12.2020.
//  Copyright © 2020 Viktoria. All rights reserved.
//

import SwiftUI

class InitValues: ObservableObject {
    
    let sliderManager = SliderSettings(width: UIScreen.main.bounds.width - 60)
    
    @Published var values: [SliderPoint]
    @Published var valuesCoordinates = [SliderPointLocation]()
    
    @Published var sliders = [SliderLocationInfo]()
    
    init() {
        self.values = sliderManager.defaultValues
        self.valuesCoordinates = sliderManager.currentCoordinates(values: values)
        self.sliders = sliderManager.slidersLocation()
    }
}

struct FiltersValues: View {
    
    @ObservedObject var scheme = InitValues()
    
    var body: some View {
        return NavigationView {
            
            VStack(alignment: .leading, spacing: 20) {
                ForEach(scheme.values) { value in
                    Text(self.filterSet(minValue: value.minValue, maxValue: value.maxValue))
                    Divider()
                }
                NavigationLink(destination: FiltersEditorView(sliders: $scheme.sliders, choosenSliders: $scheme.valuesCoordinates, choosenSlidersInt: $scheme.values)) {
                    Text("Изменить")
                        .foregroundColor(.blue)
                }.buttonStyle(PlainButtonStyle())
                Spacer()
            }
            .padding([.top, .leading], 20.0)
            .navigationBarTitle("Выбрано", displayMode: .inline)
        }
    }
    
    private func filterSet(minValue: Int, maxValue: Int) -> String {
        let textMinValue = "\(minValue) - "
        let textMaxValue = "\( SliderLabel.chooseText(for: maxValue - 1))"
        return textMinValue + textMaxValue
    }
}

struct FiltersValues_Previews: PreviewProvider {
    static var previews: some View {
        FiltersValues()
    }
}
