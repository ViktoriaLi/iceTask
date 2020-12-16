//
//  ContentView.swift
//  IceTask
//
//  Created by Mac Developer on 14.12.2020.
//  Copyright © 2020 Viktoria. All rights reserved.
//

import SwiftUI

struct FiltersEditorView: View {
        
    @Binding var choosenSliders: [SliderPointLocation] {
        didSet {
            let defaultPoints = sliderManager.defaultValues
            let currentPoints = sliderManager.currentIntValues(values: choosenSliders)
            if defaultPoints == currentPoints {
                resetAllowed.append(false)
            } else {
                resetAllowed.append(true)
            }
        }
    }
    
    @Binding var choosenSlidersInt: [SliderPoint]
    
    @Environment(\.presentationMode) var presentationMode
    
    @State private var resetAllowed = [Bool]()
        
    let sliderManager = SliderSettings(width: UIScreen.main.bounds.width - 60)
    
    var body: some View {
        VStack {
            Form {
                
                ForEach(0..<choosenSliders.count) { index in

                    Section(header: Text("\(index + 1)")
                        //.foregroundColor(.black)
                        //.alignmentGuide(.center)
                        
                        .font(.system(size: 17))) {
                            RangeSlider(currentValue: self.$choosenSliders[index], resetAllowed: self.$resetAllowed[index])
                    }
                }
            }
            Button(action: {
                self.updateValues()
                self.presentationMode.wrappedValue.dismiss()
            }) {
                Text("Применить")
            }
        }
        .onAppear(perform: addResetTrigger)
        .navigationBarBackButtonHidden(true)
        .navigationBarTitle("Фильтры", displayMode: .inline)
        .navigationBarItems(leading:
        Button(action: {
             self.presentationMode.wrappedValue.dismiss()
              })
        {
            Image("close")
            .renderingMode(Image.TemplateRenderingMode?.init(Image.TemplateRenderingMode.original))
        }, trailing:
        Button("Сбросить") {
            self.resetSliders()
        }.disabled(!resetAllowed.contains(true)))
    }
    
    func updateValues() {
        choosenSlidersInt = sliderManager.currentIntValues(values: choosenSliders)
    }
    
    func resetSliders() {
        choosenSliders = sliderManager.defaultValuesCoordinates
    }
    
    func addResetTrigger() {
        for index in 0..<choosenSliders.count {
            let intCurrent = sliderManager.convertToInt(from: choosenSliders[index])
            print(intCurrent)
            print(sliderManager.defaultValues[index])
            if intCurrent == sliderManager.defaultValues[index] {
                resetAllowed.append(false)
            } else {
               resetAllowed.append(true)
           }
        }
    }
}

/*struct FiltersEditorView_Previews: PreviewProvider {
    static var previews: some View {
        FiltersEditorView(sliders: [], choosenSliders: [])
    }
}*/


