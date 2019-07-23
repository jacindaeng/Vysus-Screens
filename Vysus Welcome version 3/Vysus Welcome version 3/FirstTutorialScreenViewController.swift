//
//  FirstTutorialScreenViewController.swift
//  Vysus Welcome version 3
//
//  Created by Jacinda Eng on 7/17/19.
//  Copyright © 2019 Jacinda Eng. All rights reserved.
//

import UIKit

class FirstTutorialScreenViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var upArrow: UIImageView!
    @IBOutlet weak var downArrow: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.clipsToBounds = true
        //imageView.layer.cornerRadius = 80.0
        
        // 3. Starting animation when app loads
        self.beginAnimation()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // 2. Function to pulse 3x
    func beginAnimation () {
        UIView.animate(withDuration: 1.0, animations: {
            UIView.setAnimationRepeatCount(100)
            self.upArrow.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
            self.downArrow.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
            
        }, completion: {completion in
            self.upArrow.transform = CGAffineTransform(scaleX: 1, y: 1)
            self.downArrow.transform = CGAffineTransform(scaleX: 1, y: 1)
        })
        

    }
}
