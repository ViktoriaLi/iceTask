//
//  ContentView.swift
//  IceTask
//
//  Created by Mac Developer on 14.12.2020.
//  Copyright © 2020 Viktoria. All rights reserved.
//

import SwiftUI

struct FiltersEditorView: View {
        
    @Binding var choosenSliders: [SliderPointLocation]
    @Binding var choosenSlidersInt: [SliderPoint]
    
    @Environment(\.presentationMode) var presentationMode
    
    @State private var resetAllowed = Array(repeating: false, count: 4)
        
    let sliderManager = SliderSettings(width: UIScreen.main.bounds.width - 60)
    
    var footer: some View {
        VStack(alignment: .center) {
                Button(action: self.updateValues) {
                    VStack(alignment: .center) {
                        Text("ПРИМЕНИТЬ")
                        .fontWeight(.bold)
                        .font(.system(size: 16))
                    }
                    .frame(width: UIScreen.main.bounds.width - 60, alignment: .center)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(Color.white)
                        .cornerRadius(10)
                        .shadow(color: Color("buttonShadow"), radius: 10, x: 0, y: 0)
                }
            .padding(.bottom, 25)
            .padding(.top, 50)
        }
    }
    
    var body: some View {
        VStack {
            Form {
                ForEach(0..<choosenSliders.count) { index in
                    Section(header:
                        SectionTitle(index: index)
                            .foregroundColor(.black)
                            .font(.system(size: 17)),
                            footer: (index == self.choosenSliders.count - 1) ? self.footer : nil) {
                                RangeSlider(currentValue: self.$choosenSliders[index], resetAllowed: self.$resetAllowed[index])
                    }
                }
            }
        }
        .onAppear(perform: addResetTrigger)
        .navigationBarBackButtonHidden(true)
        .navigationBarTitle("Фильтры", displayMode: .inline)
        .navigationBarItems(leading:
            Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }){
                Image("close")
                    .renderingMode(Image.TemplateRenderingMode?.init(Image.TemplateRenderingMode.original))
            }, trailing:
            Button("Сбросить") {
                self.resetSliders()
            }.disabled(!resetAllowed.contains(true)))
    }
    
    private func updateValues() {
        choosenSlidersInt = sliderManager.currentIntValues(values: choosenSliders)
        self.presentationMode.wrappedValue.dismiss()
    }
    
    private func resetSliders() {
        choosenSliders = sliderManager.defaultValuesCoordinates
    }
    
    private func addResetTrigger() {
        for index in 0..<choosenSliders.count {
            let intCurrent = sliderManager.convertToInt(from: choosenSliders[index])
            if intCurrent == sliderManager.defaultValues[index] {
                resetAllowed[index] = false
            } else {
               resetAllowed[index] = true
           }
        }
    }
}


struct BlueButtonStyle: ButtonStyle {

  func makeBody(configuration: Self.Configuration) -> some View {
    configuration.label
        .font(.headline)
        //.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        //.frame(height: 50, alignment: .center)
        //.contentShape(Rectangle())
        //.padding(16)
        //.cornerRadius(10)
        .foregroundColor(configuration.isPressed ? Color.white.opacity(0.5) : Color.white)
        .listRowBackground(configuration.isPressed ? Color.blue.opacity(0.5) : Color.blue)
    /*.foregroundColor(.white)
    .fontWeight(.bold)
    .font(.system(size: 16))
    .background(Color.blue)
    .
    .
    .frame(height: 50)*/
  }
}
