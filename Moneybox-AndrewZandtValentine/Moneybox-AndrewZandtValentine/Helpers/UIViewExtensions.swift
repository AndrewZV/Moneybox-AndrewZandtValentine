//
//  UIViewExtensions.swift
//  Moneybox-AndrewZandtValentine
//
//  Created by Andrew Zandt-Valentine on 11/08/2019.
//  Copyright © 2019 Andrew Zandt-Valentine. All rights reserved.
//

import UIKit

public extension UIView {
    func set(cornerRadius: CGFloat) {
        self.clipsToBounds = true
        self.layer.cornerRadius = cornerRadius
    }
}

public extension UIView {
    func setSubviewForAutoLayout(_ subview: UIView) {
        subview.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(subview)
    }
    
    func setSubviewsForAutoLayout(_ subviews: [UIView]) {
        subviews.forEach(self.setSubviewForAutoLayout)
    }
}
