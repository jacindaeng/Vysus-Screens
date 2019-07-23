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

    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = UIImage(named: "husky.jpg")
        
        // 3. Starting animation when app loads

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
