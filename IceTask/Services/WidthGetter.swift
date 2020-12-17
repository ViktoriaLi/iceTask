//
//  WidthGetter.swift
//  IceTask
//
//  Created by Mac Developer on 17.12.2020.
//  Copyright © 2020 Viktoria. All rights reserved.
//

import Foundation
import SwiftUI

class WidthGetter {
     static var width: CGFloat {
        return UIScreen.main.bounds.width - Constants.leadingPadding - Constants.trailingPadding - Constants.circleWidth - Constants.circleWidth / 2
       }
}
