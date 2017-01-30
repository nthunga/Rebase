//
//  ViewController.swift
//  AnimationSample
//
//  Created by Naveen Thunga on 1/20/17.
//  Copyright © 2017 Y Media Labs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var testView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let button = UIButton(frame: CGRect(x: 20, y: 20, width: 60, height: 40))
        button.addTarget(self, action: #selector(ViewController.animateView), for: .touchUpInside)
        button.backgroundColor = UIColor.black
        button.setTitle("TAP", for: .normal)
        self.view.addSubview(button)
        
        let transformButton = UIButton(frame: CGRect(x: button.frame.maxY + 40, y: 20 , width: 140, height: 40))
        transformButton.addTarget(self, action: #selector(ViewController.transform), for: .touchUpInside)
        transformButton.backgroundColor = UIColor.black
        transformButton.setTitle("TRANSFORM", for: .normal)
        self.view.addSubview(transformButton)
        
        let shakeButton = UIButton(frame: CGRect(x: self.view.frame.size.width-80, y: 20, width: 60, height: 40))
        shakeButton.addTarget(self, action: #selector(ViewController.shakeView), for: .touchUpInside)
        shakeButton.backgroundColor = UIColor.black
        shakeButton.setTitle("SHAKE", for: .normal)
        self.view.addSubview(shakeButton)
    }

    func animateView()  {
        let animation = CAKeyframeAnimation()
        animation.keyPath = "position.y"
        animation.values = [0, 100, 0]
        animation.keyTimes = [0, 0.5, 1]
        animation.duration = 2
        animation.isAdditive = true
        animation.autoreverses = true
        
        testView.layer.add(animation, forKey: "move")
    }
 
    func transform() {
        let animation = CAKeyframeAnimation()
        animation.keyPath = "transform"
        animation.values         = [NSValue(caTransform3D: CATransform3DMakeRotation(3 * CGFloat(M_PI/180), 0, 0, -1)),
                                        NSValue(caTransform3D: CATransform3DConcat(CATransform3DMakeScale(1.5, 1.5, 1), CATransform3DMakeRotation(3 * CGFloat(M_PI/180), 0, 0, 1))),
                                        NSValue(caTransform3D: CATransform3DMakeScale(1.5, 1.5, 1)),
                                        NSValue(caTransform3D: CATransform3DConcat(CATransform3DMakeScale(1.2, 1.2, 1), CATransform3DMakeRotation(-8 * CGFloat(M_PI/180), 0, 0, 1)))]
        animation.keyTimes       = [0, 0.349, 0.618, 1]
        animation.duration       = 1

        
        testView.layer.add(animation, forKey: "transform")
    }
    
    func shakeView() {
        let animation = CAKeyframeAnimation()
        animation.keyPath = "position.x"
        animation.values = [0, 10, -10, 10, -5, 5, -5, 0 ]
        animation.keyTimes = [0, 0.125, 0.25, 0.375, 0.5, 0.625, 0.75, 0.875, 1]
        animation.duration = 0.4
        animation.isAdditive = true
        
        testView.layer.add(animation, forKey: "shake")
    }
}

