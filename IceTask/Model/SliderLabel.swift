//
//  SliderLabel.swift
//  IceTask
//
//  Created by Mac Developer on 15.12.2020.
//  Copyright © 2020 Viktoria. All rights reserved.
//

import Foundation

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
