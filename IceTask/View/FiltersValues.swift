//
//  FiltersValues.swift
//  IceTask
//
//  Created by Mac Developer on 15.12.2020.
//  Copyright © 2020 Viktoria. All rights reserved.
//

import SwiftUI

struct FiltersValues: View {
    
    @ObservedObject var scheme = InitValues()
    
    var body: some View {
        return NavigationView {
            VStack(alignment: .leading, spacing: 20) {
                ForEach(scheme.changeableValues) { value in
                    Text(self.filterSet(minValue: value.minValue, maxValue: value.maxValue))
                    Divider()
                }
                NavigationLink(destination: FiltersEditorView(choosenSliders: $scheme.valuesCoordinates, choosenSlidersInt: $scheme.changeableValues)) {
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
        let textMinValue = "\(minValue + 1) - "
        let textMaxValue = "\(SliderLabel.chooseText(for: maxValue - 1))"
        return textMinValue + textMaxValue
    }
}
