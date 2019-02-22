//
//  ViewController.swift
//  Dice
//
//  Created by Madwor1d3 on 22/02/2019.
//  Copyright © 2019 Madwor1d3. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var diceArray : Array = ["dice1", "dice2", "dice3", "dice4", "dice5", "dice6"]
    var firstRandomIndex : Int = 0
    var secondRandomIndex : Int = 0
    let topContainer = UIView()
    let midContainer = UIView()
    let bottomContainer = UIView()
    let backgroundImage = UIImageView()
    let diceLogo = UIImageView()
    let leftDiceImageView = UIImageView()
    let rightDiceImageView = UIImageView()
    let button = CustomButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        diceArray = ["dice1", "dice2", "dice3", "dice4", "dice5", "dice6"]
        
        setBackground()
        
        setContainers()
        
        setDiceLogo()
        
        setDiceViews()
        
        setRollButton()
        
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            updateDiceImages()
        }
    }
    
    
    @objc func rollButtonPressed() {
        
        updateDiceImages()
    }
    
    
    
    func updateDiceImages() {
        
        firstRandomIndex = Int(arc4random_uniform(6))
        secondRandomIndex = Int(arc4random_uniform(6))
        
        leftDiceImageView.image = UIImage(named: diceArray[firstRandomIndex])
        rightDiceImageView.image = UIImage(named: diceArray[secondRandomIndex])
    }
    
    
    func setBackground() {
        
        view.addSubview(backgroundImage)
        
        backgroundImage.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor)
        
        backgroundImage.image = UIImage(named: "newbackground")
    }
    
    
    
    func setContainers() {
        
        [topContainer, midContainer, bottomContainer].forEach { backgroundImage.addSubview($0) }
        [topContainer, midContainer, bottomContainer].forEach { $0.isOpaque = false }
        
        topContainer.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor)
        
        midContainer.anchor(top: topContainer.bottomAnchor, leading: nil, bottom: nil, trailing: nil, size: .init(width: 250, height: 100))
        midContainer.centering(midContainer, in: view)
        
        bottomContainer.anchor(top: midContainer.bottomAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor)
    }
    
    
    func  setDiceLogo() {
        
        topContainer.addSubview(diceLogo)
        diceLogo.image = UIImage(named: "diceeLogo")
        diceLogo.anchor(top: nil, leading: nil, bottom: nil, trailing: nil, size: .init(width: 240, height: 130))
        diceLogo.centering(diceLogo, in: topContainer)
    }
    
    
    func setDiceViews() {
        
        [leftDiceImageView, rightDiceImageView].forEach { midContainer.addSubview($0) }
        
        leftDiceImageView.anchor(top: nil, leading: midContainer.leadingAnchor, bottom: nil, trailing: nil, size: .init(width: 100, height: 0))
        leftDiceImageView.heightAnchor.constraint(equalTo: leftDiceImageView.widthAnchor).isActive = true
        
        rightDiceImageView.anchor(top: nil, leading: nil, bottom: nil, trailing: midContainer.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 0), size: .init(width: 100, height: 0))
        rightDiceImageView.heightAnchor.constraint(equalTo: rightDiceImageView.widthAnchor).isActive = true
        
        leftDiceImageView.image = UIImage(named: "dice1")
        rightDiceImageView.image = UIImage(named: "dice1")
    }
    
    func setRollButton() {
        
        bottomContainer.addSubview(button)
        button.anchor(top: nil, leading: nil, bottom: nil, trailing: nil, size: .init(width: 155, height: 60))
        button.centering(button, in: bottomContainer)
        button.setTitle("Roll", for: .normal)
        button.addTarget(self, action: #selector(rollButtonPressed), for: .touchUpInside)
    }
    
    
}

extension UIView {
    
    func fillSuperview() {
        
        anchor(top: superview?.topAnchor, leading: superview?.leadingAnchor, bottom: superview?.bottomAnchor, trailing: superview?.trailingAnchor)
    }
    
    
    func centering(_ childView: UIView, in parentView: UIView) {
        
        childView.center = parentView.center
        childView.centerXAnchor.constraint(equalTo: parentView.centerXAnchor).isActive = true
        childView.centerYAnchor.constraint(equalTo: parentView.centerYAnchor).isActive = true
    }
    
    
    func anchorSize(to view: UIView) {
        
        widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
    }
    
    
    func anchor(top: NSLayoutYAxisAnchor?, leading: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, trailing: NSLayoutXAxisAnchor?, padding: UIEdgeInsets = .zero, size: CGSize = .zero) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: padding.top).isActive = true
        }
        
        if let leading = leading {
            leadingAnchor.constraint(equalTo: leading, constant: padding.left).isActive = true
        }
        
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom).isActive = true
        }
        
        if let trailing = trailing {
            trailingAnchor.constraint(equalTo: trailing, constant: -padding.right).isActive = true
        }
        
        if size.width != 0 {
            widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }
        
        if size.height != 0 {
            heightAnchor.constraint(equalToConstant: size.height).isActive = true
        }
    }
}

