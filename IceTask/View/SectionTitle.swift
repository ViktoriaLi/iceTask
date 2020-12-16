//
//  SectionTitle.swift
//  IceTask
//
//  Created by Mac Developer on 16.12.2020.
//  Copyright © 2020 Viktoria. All rights reserved.
//

import SwiftUI

struct SectionTitle: View {
    
    var index: Int
    
    var body: some View {
        HStack(alignment: .center)
        {
            Text("\(index + 1)")
            .foregroundColor(.black)
            .font(.system(size: 17))
            .frame(height: 34)
        }
        
    }
}

