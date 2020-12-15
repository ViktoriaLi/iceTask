//
//  ContentView.swift
//  IceTask
//
//  Created by Mac Developer on 14.12.2020.
//  Copyright © 2020 Viktoria. All rights reserved.
//

import SwiftUI

enum SliderLabel: String {
    case many = "ночей"
    case howMany = "ночи"
    case one = "ночь"
    case more = "Более 30 ночей"
    
    static func chooseText(for nights: Int) -> String {
        switch nights {
        case 0, 20:
            return "\(nights + 1) " + self.one.rawValue
        case 4...19, 24...29:
            return "\(nights + 1) " + self.many.rawValue
        case 1...3, 21...23:
            return "\(nights + 1) " + self.howMany.rawValue
        default:
            return self.more.rawValue
        }
    }
}

struct SliderPoint: Equatable {
    var minValue: Int
    var maxValue: Int
}

struct SliderPointLocation: Equatable {
    var minValue: CGFloat
    var maxValue: CGFloat
}

struct SliderInfo {
    let rangePoint: SliderPoint
    var currentPoint: SliderPoint
    let step: UInt
}

struct SliderLocationInfo {
    let rangePoint: SliderPointLocation
    var currentPoint: SliderPointLocation
    let step: UInt
}

struct FiltersView: View {
    
    let sliderManager = SliderSettings(width: UIScreen.main.bounds.width - 60)
    
    @State var sliders: [SliderLocationInfo]

    
    var body: some View {
        NavigationView {
            Form {
                ForEach(0..<sliders.count) { index in
                    Section(header: Text("\(index + 1)")) {
                        RangeSlider(metaData: self.sliders[index])
                            
                    }
                }
                
            }

            Button(action: {
                //action
            }) {
                Text("Применить")
            }
        }
        .navigationBarTitle(Text("Фильтры"))
        .onAppear(perform: loadSliders)
    }
    
    func loadSliders() {
         sliders = sliderManager.slidersLocation()
    }
}

struct FiltersView_Previews: PreviewProvider {
    static var previews: some View {
        FiltersView(sliders: [])
    }
}


