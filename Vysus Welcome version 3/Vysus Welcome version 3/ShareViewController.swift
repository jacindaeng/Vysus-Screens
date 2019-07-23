//
//  ShareViewController.swift
//  Vysus Welcome version 3
//
//  Created by Jacinda Eng on 7/23/19.
//  Copyright © 2019 Jacinda Eng. All rights reserved.
//

import UIKit

class ShareViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = UIImage(named: "husky.jpg")

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
