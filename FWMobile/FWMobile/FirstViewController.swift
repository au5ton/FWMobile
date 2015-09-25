//
//  FirstViewController.swift
//  FWMobile
//
//  Created by Austin Jackson on 9/23/15.
//  Copyright © 2015 Austin Jackson. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        
        // Do any additional setup after loading the view, typically from a nib.
        let background = UIImage(named: "Background")
        let backgroundView = UIImageView(image: background)
        self.view.addSubview(backgroundView)
        self.view.sendSubviewToBack(backgroundView)
        
        super.viewDidLoad()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }

    @IBAction func buttonGetStartedPressed(sender: UIButton) {
        
        
        
    }

}

