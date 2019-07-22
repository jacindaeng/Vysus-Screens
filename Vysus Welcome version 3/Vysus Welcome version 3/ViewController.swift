//
//  ViewController.swift
//  Vysus Welcome version 3
//
//  Created by Jacinda Eng on 7/14/19.
//  Copyright © 2019 Jacinda Eng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var uiBackground: UIView!

    @IBOutlet weak var imgvAvatar: UIImageView!
    
    @IBOutlet weak var logoImageView: UIImageView!
    
    var pulseArray = [CAShapeLayer]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        uiBackground.backgroundColor = #colorLiteral(red: 0.1121171787, green: 0.1581867933, blue: 0.2041456699, alpha: 1)
        imgvAvatar.layer.cornerRadius = imgvAvatar.frame.size.width/2.0
        logoImageView.image = UIImage(named: "Visus")
        createPulse()
        
    }
    
    func createPulse() {
        
        for _ in 0...2 {
            let circularPath = UIBezierPath(arcCenter: .zero, radius: ((self.imgvAvatar.superview?.frame.size.width )! )/1.8, startAngle: 0, endAngle: 2 * .pi , clockwise: true)
            let pulsatingLayer = CAShapeLayer()
            pulsatingLayer.path = circularPath.cgPath
            pulsatingLayer.lineWidth = 25
            pulsatingLayer.fillColor = UIColor.clear.cgColor
            pulsatingLayer.lineCap = CAShapeLayerLineCap.round
            pulsatingLayer.position = CGPoint(x: imgvAvatar.frame.size.width / 2.0, y: imgvAvatar.frame.size.width / 2.0)
            imgvAvatar.layer.addSublayer(pulsatingLayer)
            pulseArray.append(pulsatingLayer)
        }
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2, execute: {
            self.animatePulsatingLayerAt(index: 0)
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4, execute: {
                self.animatePulsatingLayerAt(index: 1)
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                    self.animatePulsatingLayerAt(index: 2)
                })
            })
        })
        
    }
    
    
    func animatePulsatingLayerAt(index:Int) {
        
        //Giving color to the layer
        pulseArray[index].strokeColor = #colorLiteral(red: 0.4, green: 0.9882352941, blue: 0.9450980392, alpha: 1)
        
        //Creating scale animation for the layer, from and to value should be in range of 0.0 to 1.0
        // 0.0 = minimum
        //1.0 = maximum
        let scaleAnimation = CABasicAnimation(keyPath: "transform.scale")
        scaleAnimation.fromValue = 0.4
        scaleAnimation.toValue = 0.75
        
        //Creating opacity animation for the layer, from and to value should be in range of 0.0 to 1.0
        // 0.0 = minimum
        //1.0 = maximum
        let opacityAnimation = CABasicAnimation(keyPath: #keyPath(CALayer.opacity))
        opacityAnimation.fromValue = 0.9
        opacityAnimation.toValue = 0.0
        
        // Grouping both animations and giving animation duration, animation repat count
        let groupAnimation = CAAnimationGroup()
        groupAnimation.animations = [scaleAnimation, opacityAnimation]
        groupAnimation.duration = 2.3
        groupAnimation.repeatCount = .greatestFiniteMagnitude
        groupAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
        //adding groupanimation to the layer
        pulseArray[index].add(groupAnimation, forKey: "groupanimation")
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}


