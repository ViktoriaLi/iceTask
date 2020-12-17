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
        
    private let sliderManager = SliderSettings()

    var body: some View {
        VStack {
            Form {
                ForEach(0..<choosenSliders.count - 1) { index in
                    Section(
                    header: SectionTitle(index: index)) {
                        RangeSlider(currentValue: self.$choosenSliders[index], resetAllowed: self.$resetAllowed[index])
                    }
                }
                Section(
                    header: SectionTitle(index: choosenSliders.count - 1),
                    footer: self.footer) {
                        RangeSlider(currentValue: self.$choosenSliders[choosenSliders.count - 1], resetAllowed: self.$resetAllowed[choosenSliders.count - 1])
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
                self.addResetTrigger()
            }.disabled(!resetAllowed.contains(true)))
            .foregroundColor(resetAllowed.contains(true) ? Constants.resetButtonColor: Color.gray)
    }
    
    private var footer: some View {
        VStack(alignment: .center) {
                Button(action: self.updateValues) {
                    Text("ПРИМЕНИТЬ")
                    .fontWeight(.bold)
                        .font(.system(size: Constants.textSizeApplyButton))
                }.buttonStyle(BlueButtonStyle())
                    .padding(.bottom, Constants.applyButtonBottom)
                    .padding(.top, Constants.applyButtonTop)
                    .padding(.leading, Constants.leadingPadding)
                    .padding(.trailing, Constants.trailingPadding)
        }
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
