//
//  CustomImageView.swift
//  Dice
//
//  Created by Madwor1d3 on 23/02/2019.
//  Copyright © 2019 Madwor1d3. All rights reserved.
//

import UIKit

class CustomImageView: UIImageView {

    
    override func layoutSubviews() {
        
        setShadow()
    }
    
    
    func shake() {
        
        let shake           = CABasicAnimation(keyPath: "position")
        shake.duration      = 0.1
        shake.repeatCount   = 2
        shake.autoreverses  = true
        
        let fromPoint       = CGPoint(x: center.x, y: center.y - 10)
        let fromValue       = NSValue(cgPoint: fromPoint)
        
        let toPoint         = CGPoint(x: center.x, y: center.y + 10)
        let toValue         = NSValue(cgPoint: toPoint)
        
        shake.fromValue     = fromValue
        shake.toValue       = toValue
        
        layer.add(shake, forKey: "position")
    }
    
    
    private func setShadow() {
        
        layer.shadowColor   = UIColor.black.cgColor
        layer.shadowOffset  = CGSize(width: 0.0, height: 6.0)
        layer.shadowRadius  = 8
        layer.shadowOpacity = 0.5
        clipsToBounds       = true
        layer.masksToBounds = false
    }
}
