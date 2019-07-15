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
    override func viewDidLoad() {
        super.viewDidLoad()
        //gifImageView.loadGif(name: "gifexample")
        uiBackground.backgroundColor = #colorLiteral(red: 0.7058823529, green: 0.4823529412, blue: 0.5490196078, alpha: 1)
        logoImageView.image = UIImage(named: "Visus")
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

