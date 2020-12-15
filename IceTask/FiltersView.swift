//
//  ContentView.swift
//  IceTask
//
//  Created by Mac Developer on 14.12.2020.
//  Copyright © 2020 Viktoria. All rights reserved.
//

import SwiftUI

struct SliderInfo {
    let minValue: UInt
    let maxValue: UInt
    var currentValue: UInt
    let step: UInt
}

struct FiltersView: View {
    @State private var sliders = [SliderInfo(minValue: 1, maxValue: 30, currentValue: 1, step: 1)]
    
    @State var slider1Value: Double = 1
    @State var slider2Value: Double = 1
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("1")
                    .foregroundColor(.black)
                ) {
                    Slider(value: $slider1Value, in: 0...30, step: 1)
                    
                    
                }
                Section(header: Text("2")) {
                    RangeSlider(metaData: sliders[0])
                        
                }
            }

            Button(action: {
                //action
            }) {
                Text("Применить")
            }
        .navigationBarTitle(Text("Фильтры"))
        }
    }
}

struct FiltersView_Previews: PreviewProvider {
    static var previews: some View {
        FiltersView()
    }
}


