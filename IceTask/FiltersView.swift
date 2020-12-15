//
//  ContentView.swift
//  IceTask
//
//  Created by Mac Developer on 14.12.2020.
//  Copyright © 2020 Viktoria. All rights reserved.
//

import SwiftUI

struct FiltersView: View {
    
    let sliderManager = SliderSettings(width: UIScreen.main.bounds.width - 60)
    
    @State var sliders: [SliderLocationInfo]

     @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
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
            self.loadSliders()
        })
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


