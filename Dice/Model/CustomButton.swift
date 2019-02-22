//
//  CustomButton.swift
//  Dice
//
//  Created by Madwor1d3 on 22/02/2019.
//  Copyright © 2019 Madwor1d3. All rights reserved.
//

import UIKit

class CustomButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        
        layer.borderWidth = 5.0
        layer.borderColor = UIColor.white.cgColor
        tintColor = UIColor.white
        layer.cornerRadius = 15.0
        titleLabel?.font = UIFont(name: "Avenir", size: 37)
        backgroundColor = UIColor(red: 201/255, green: 63/255, blue: 69/255, alpha: 1.0)
    }
    
}
