//
//  ViewController.swift
//  A03
//
//  Created by pm on 2018/12/12.
//  Copyright © 2018 pm. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.black
        
        let rect = CGRect(x: 0, y: 0, width: view.frame.width, height: 400)
        
        let darkTextLabel = UILabel()
        darkTextLabel.text = "Shimer"
        darkTextLabel.font = UIFont.systemFont(ofSize: 100)
        darkTextLabel.textColor = UIColor.init(white: 1, alpha: 0.15)
        darkTextLabel.textAlignment = .center
        darkTextLabel.frame = rect
        
        
        
        let lightTextLabel = UILabel()
        lightTextLabel.text = "Shimer"
        lightTextLabel.font = UIFont.systemFont(ofSize: 100)
        lightTextLabel.textColor = .white
        lightTextLabel.textAlignment = .center
        lightTextLabel.frame = rect
        
        
        // 创建渐变
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.clear.cgColor,UIColor.black.cgColor,UIColor.clear.cgColor]
        gradientLayer.locations = [0,0.5,1]
        gradientLayer.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 400)
        let angel = 45 * CGFloat.pi / 180
        gradientLayer.transform = CATransform3DMakeRotation(angel, 0, 0, 1)
        
        
//        view.layer.addSublayer(gradientLayer)
        
        
        //运用动画
        let animation = CABasicAnimation(keyPath: "transform.translation.x")
        animation.fromValue = -view.frame.width
        animation.toValue = view.frame.width
        animation.repeatCount = Float.infinity
        animation.duration = 2
        gradientLayer.add(animation, forKey: "translation x offset ")
        
        //应用渐变蒙版层
        lightTextLabel.layer.mask = gradientLayer
        view.addSubview(darkTextLabel)
        view.addSubview(lightTextLabel)
    }


}

