//
//  Roll.swift
//  dice
//
//  Created by Scott Pastor on 10/7/17.
//  Copyright © 2017 Scott Pastor. All rights reserved.
//

import Foundation
import UIKit
class Roll {
    var result:String
    var backgroundColor:UIColor
    var image:UIImage?

    init(pipCount:String) {
        result = pipCount
        backgroundColor = UIColor(red: 39/255,
                            green: 78/255,
                            blue: 51/255,
                            alpha: 1)
        image = UIImage()
    }
    init(){
      backgroundColor = UIColor()
      result = ""
        image = UIImage()
    }
}








