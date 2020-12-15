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
        case 1, 21:
            return "\(nights) " + self.one.rawValue
        case 5...20, 25...30:
            return "\(nights) " + self.many.rawValue
        case 2...4, 22...24:
            return "\(nights) " + self.howMany.rawValue
        default:
            return self.more.rawValue
        }
    }
}

struct SliderPoint: Equatable {
    var minValue: CGFloat
    var maxValue: CGFloat
}

struct SliderInfo {
    let rangePoint: SliderPoint
    //let defaultPoint: SliderPoint
    var currentPoint: SliderPoint
    let step: UInt
}

struct FiltersView: View {
    @State private var sliders = [SliderInfo(rangePoint: SliderPoint(minValue: 1, maxValue: 31), currentPoint: SliderPoint(minValue: 1, maxValue: 31), step: 1),
        SliderInfo(rangePoint: SliderPoint(minValue: 1, maxValue: 31), currentPoint: SliderPoint(minValue: 1, maxValue: 31), step: 2),
        SliderInfo(rangePoint: SliderPoint(minValue: 1, maxValue: 31), currentPoint: SliderPoint(minValue: 18, maxValue: 20), step: 1),
        SliderInfo(rangePoint: SliderPoint(minValue: 1, maxValue: 31), currentPoint: SliderPoint(minValue: 7, maxValue: 14), step: 1)]
    
    @State var slider1Value: Double = 1
    @State var slider2Value: Double = 1
    
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
        .navigationBarTitle(Text("Фильтры"))
        }
    }
}

struct FiltersView_Previews: PreviewProvider {
    static var previews: some View {
        FiltersView()
    }
}


