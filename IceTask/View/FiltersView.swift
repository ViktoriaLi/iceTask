//
//  ContentView.swift
//  IceTask
//
//  Created by Mac Developer on 14.12.2020.
//  Copyright © 2020 Viktoria. All rights reserved.
//

import SwiftUI

struct FiltersEditorView: View {
    
    @Binding var sliders: [SliderLocationInfo]
    @Binding var choosenSliders: [SliderPointLocation]
    @Binding var choosenSlidersInt: [SliderPoint]
    
    @Environment(\.presentationMode) var presentationMode
    
    let sliderManager = SliderSettings(width: UIScreen.main.bounds.width - 60)
    
    var body: some View {
        VStack {
            Form {
                
                ForEach(0..<sliders.count) { index in
                    Section(header: Text("\(index + 1)")
                        //.foregroundColor(.black)
                        //.alignmentGuide(.center)
                        .font(.system(size: 17))) {
                        RangeSlider(metaData: self.$sliders[index], currentValue: self.$choosenSliders[index])
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
        })
    }
    
    func updateValues() {
        choosenSlidersInt = sliderManager.currentIntValues(values: choosenSliders)
    }
    
    func resetSliders() {
        choosenSliders = sliders.map({$0.currentPoint})
    }
}

/*struct FiltersEditorView_Previews: PreviewProvider {
    static var previews: some View {
        FiltersEditorView(sliders: [], choosenSliders: [])
    }
}*/


