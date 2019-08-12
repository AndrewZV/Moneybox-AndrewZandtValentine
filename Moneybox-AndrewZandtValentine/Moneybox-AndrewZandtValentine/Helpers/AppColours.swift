//
//  AppColours.swift
//  Moneybox-AndrewZandtValentine
//
//  Created by Andrew Zandt-Valentine on 10/08/2019.
//  Copyright © 2019 Andrew Zandt-Valentine. All rights reserved.
//

import UIKit

extension UIColor {
    //Easily create new colour
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    struct AppColours {
        static let moneyboxBlue = UIColor(red: 106, green: 189, blue: 186)
        static let white = UIColor(red: 255, green: 255, blue: 255)
        static let darkGrey = UIColor(red: 85, green: 98, blue: 113)
        static let purple = UIColor(red: 128, green: 106, blue: 189)
        static let red = UIColor(red: 222, green: 70, blue: 64)
        static let orange = UIColor(red: 234, green: 157, blue: 79)
    }
}
