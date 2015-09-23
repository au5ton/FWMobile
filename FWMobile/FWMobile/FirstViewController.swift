//
//  FirstViewController.swift
//  FWMobile
//
//  Created by Austin Jackson on 9/22/15.
//  Copyright © 2015 Austin Jackson. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON


class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //Looks for single or multiple taps.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "DismissKeyboard")
        view.addGestureRecognizer(tap)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //Calls this function when the tap is recognized.
    func DismissKeyboard(){
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    

    @IBAction func sendButtonPressed(sender: UIButton) {
        
        print("Send button has been pressed.")
        
        
        if(chatMessageField.hasText()) {
            print("Text field contains: "+chatMessageField.text!)
        }
        
        Alamofire.request(.GET, "http://108.197.28.233/home.php", headers: ["Cookie": "PHPSESSID=17hjqu05s36go9uunsvc0mhqq2"])
            .responseString { _, _, result in
                
                print("Success: \(result.isSuccess)")
                print("Response String: \(result.value)")
        }
        
        
        
        
    }

    
    @IBOutlet weak var chatMessageField: UITextField!
    
    
}

