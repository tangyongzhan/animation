//
//  ViewController.swift
//  A02
//
//  Created by pm on 2018/12/12.
//  Copyright © 2018 pm. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let counterLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 28)
        label.text = "未开始"
        label.textAlignment = NSTextAlignment.center
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(counterLabel)
        counterLabel.frame = view.frame
        /* UIView动画
        UIView.animate(withDuration: 2.5, animations: {
            self.counterLabel.text = "999999"
        })
        */
        
        // 每秒60帧，刷新屏幕 create my CADisplayLink
        let displayLink = CADisplayLink(target: self, selector: #selector(handleUpdate))
        displayLink.add(to: RunLoop.main, forMode: RunLoop.Mode.default)
    }
    
    //初始值，结束值，动画时间和开始时间
    var startValue: Double = 3000.00
    var endValue: Double  = 9999.00
    let animationDuration : Double = 2.5
    let animationStartDate = Date()
    
    // 毫秒/动画时间 *（结束值 - 开始值） 得到每次值变化
    @objc func handleUpdate () {
        let elapsedTime = Date().timeIntervalSince(animationStartDate)
        if elapsedTime > animationDuration {
            counterLabel.text = String(format: "%.2f", endValue)
        } else {
            let precentage = elapsedTime / animationDuration
            let value =  startValue + precentage * (endValue - startValue)
            counterLabel.text = String(format: "%.2f", value)
        }

//        print("\(startValue)")
//        print(Date().timeIntervalSince1970)

        
    }

    

}

