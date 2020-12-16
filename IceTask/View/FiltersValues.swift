//
//  FiltersValues.swift
//  IceTask
//
//  Created by Mac Developer on 15.12.2020.
//  Copyright © 2020 Viktoria. All rights reserved.
//

import SwiftUI

struct FiltersValues: View {
    
    var values = [SliderPoint(id: 0, minValue: 0, maxValue: 31, step: 1), SliderPoint(id: 1, minValue: 0, maxValue: 31, step: 2), SliderPoint(id: 2, minValue: 18, maxValue: 20, step: 1), SliderPoint(id: 3, minValue: 7, maxValue: 14, step: 1)]
    @State var valuesCoordinates: [SliderPointLocation]
    
    let sliderManager = SliderSettings(width: UIScreen.main.bounds.width - 60)
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 20) {
                ForEach(0..<values.count) { index in
                    Text("\(self.values[index].minValue) - \( SliderLabel.chooseText(for: self.values[index].maxValue) )")
                    Divider()
                }
                NavigationLink(destination: FiltersEditorView(sliders: sliderManager.slidersLocation(), choosenSliders: valuesCoordinates)) {
                    Text("Изменить")
                        .foregroundColor(.blue)
                    }.buttonStyle(PlainButtonStyle())
                
                //.navigationBarHidden(true)
                    //.alignmentGuide(.center)
                
                Spacer()
            }
            .padding([.top, .leading], 20.0)
            .navigationBarTitle("Выбрано", displayMode: .inline)
            .onAppear(perform: loadCoordinates)
        }
        
        
    }
    
     func loadCoordinates() {
        valuesCoordinates = sliderManager.currentCoordinates(values: values)
    }
    
}

struct FiltersValues_Previews: PreviewProvider {
    static var previews: some View {
        FiltersValues( valuesCoordinates: [])
    }
}
