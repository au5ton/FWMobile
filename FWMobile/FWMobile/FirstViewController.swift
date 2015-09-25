//
//  FirstViewController.swift
//  FWMobile
//
//  Created by Austin Jackson on 9/23/15.
//  Copyright © 2015 Austin Jackson. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBAction func buttonGetStartedPressed(sender: UIButton) {
        
    }
    
    override func viewDidLoad() {
        let background = UIImage(named: "Background")
        let backgroundView = UIImageView(image: background)
        view.addSubview(backgroundView)
        view.sendSubviewToBack(backgroundView)
    
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }

}

