//
//  UIButtonExtension.swift
//  FlatCalculator
//
//  Created by Hilario Cuervo on 16/08/2021.
//

import UIKit


extension UIButton {
    
    func curveAndShadow() {
        // Border
        layer.cornerRadius = frame.size.height / 5
        
        //Shadow
        layer.shadowOffset = CGSize(width: 1, height: 1)
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.7
        layer.shadowRadius = 3
    }
    
}
