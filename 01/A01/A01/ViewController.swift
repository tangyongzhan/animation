//
//  ViewController.swift
//  A01
//
//  Created by pm on 2018/12/12.
//  Copyright © 2018 pm. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //创建背景图view
    let bgImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "x1"))
        return imageView
    }()
    
    //创建动画view
    let iconsContainerView: UIView = {
       let container = UIView()
        container.backgroundColor = .red
        container.frame = CGRect(x: 0, y: 0, width: 240, height: 80)
        return container
    }()
    
    //隐藏状态条
    override var prefersStatusBarHidden: Bool { return true }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(bgImageView)
        bgImageView.frame = view.frame
        
        setupLongPressGesture()
    }
    
    //添加长按事件
    fileprivate func setupLongPressGesture(){
        view.addGestureRecognizer(UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress)))
    }
    
    @objc func handleLongPress(gesture: UILongPressGestureRecognizer){
        //长按开始
        if gesture.state == .began {
            handleGestureBegan(gesture: gesture)
        }
        //长按结束
        else if gesture.state == .ended {
            iconsContainerView.removeFromSuperview()
        }
    }
    
    @objc func handleGestureBegan(gesture: UILongPressGestureRecognizer) {
        view.addSubview(iconsContainerView)
        //获取点击的区域,坐标信息
        let location = gesture.location(in: self.view)
        //计算元素在中心位置的x偏移值
        let centerX = (view.frame.width - iconsContainerView.frame.width) / 2
        iconsContainerView.transform = CGAffineTransform(translationX: centerX, y: location.y)
        iconsContainerView.alpha = 0
        
        //添加动画
        UIView.animate(withDuration: 0.8, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            //动画信息
            self.iconsContainerView.alpha = 1
            self.iconsContainerView.transform = CGAffineTransform(translationX: centerX, y: location.y - self.iconsContainerView.frame.height)
        })
    }
    

}

