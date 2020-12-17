//
//  PointConverter.swift
//  IceTask
//
//  Created by Mac Developer on 17.12.2020.
//  Copyright © 2020 Viktoria. All rights reserved.
//

import Foundation
import SwiftUI

class PointConverter {
    
    func intValue(from float: CGFloat, step: Int, width: CGFloat) -> Int {
        let unit: CGFloat = (float / CGFloat(step)) * 32.0
        return Int(unit / width) * step
    }
    
    func floatValue(from value: Int, step: Int, width: CGFloat) -> CGFloat {
        var result = CGFloat(value) * ((width / 32.0) * CGFloat(step))
        if result > width {
            result = width
        }
        return result
    }
}
