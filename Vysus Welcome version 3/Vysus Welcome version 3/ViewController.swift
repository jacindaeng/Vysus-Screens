//
//  ViewController.swift
//  Vysus Welcome version 3
//
//  Created by Jacinda Eng on 7/14/19.
//  Copyright © 2019 Jacinda Eng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var gifImageView: UIImageView!
    @IBOutlet var uiBackground: UIView!
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var animationImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //gifImageView.loadGif(name: "gifexample")
        uiBackground.backgroundColor = #colorLiteral(red: 0.7058823529, green: 0.4823529412, blue: 0.5490196078, alpha: 1)
        logoImageView.image = UIImage(named: "Visus")
        //animationImageView.image = UIImage(named: "purple")
        animateImage()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func animateImage() { //function called addRippleEffect
        addRippleEffect(to: logoImageView)
    }

    @IBAction func animateButton(_ sender: UIButton) {
        addRippleEffect(to: sender)
    }

    func addRippleEffect(to referenceView: UIView) {
        /*! Creates a circular path around the view*/
        let path = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: referenceView.bounds.size.width, height: referenceView.bounds.size.height))
        /*! Position where the shape layer should be */
        let shapePosition = CGPoint(x: referenceView.bounds.size.width / 2.0, y: referenceView.bounds.size.height / 2.0)
        let rippleShape = CAShapeLayer()
        rippleShape.bounds = CGRect(x: 0, y: 0, width: referenceView.bounds.size.width, height: referenceView.bounds.size.height)
        rippleShape.path = path.cgPath
        rippleShape.fillColor = UIColor.clear.cgColor
        rippleShape.strokeColor = UIColor.gray.cgColor
        rippleShape.lineWidth = 4
        rippleShape.position = shapePosition
        rippleShape.opacity = 0

        /*! Add the ripple layer as the sublayer of the reference view */
        referenceView.layer.addSublayer(rippleShape)
        /*! Create scale animation of the ripples */
        let scaleAnim = CABasicAnimation(keyPath: "transform.scale")
        scaleAnim.fromValue = NSValue(caTransform3D: CATransform3DIdentity)
        scaleAnim.toValue = NSValue(caTransform3D: CATransform3DMakeScale(2, 2, 1))
        /*! Create animation for opacity of the ripples */
        let opacityAnim = CABasicAnimation(keyPath: "opacity")
        opacityAnim.fromValue = 1
        opacityAnim.toValue = nil
        /*! Group the opacity and scale animations */
        let animation = CAAnimationGroup()
        animation.animations = [scaleAnim, opacityAnim]
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
        animation.duration = CFTimeInterval(1.3)
        animation.repeatCount = 100
        animation.isRemovedOnCompletion = true
        rippleShape.add(animation, forKey: "rippleEffect")
    }
}

