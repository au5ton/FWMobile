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


class ChatViewController: UIViewController, UITextFieldDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //Looks for single or multiple taps.
        //let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "DismissKeyboard")
        //view.addGestureRecognizer(tap)
        
        //chatMessageField.becomeFirstResponder()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func sendButtonPressed(sender: UIButton) {
        
        print("Send button has been pressed.")
        
        
        if(chatMessageField.hasText()) {
            print("Text field contains: "+chatMessageField.text!)
            Alamofire.request(.POST, "http://108.197.28.233/scripts/chat_post.php", headers: ["Cookie": "PHPSESSID=17hjqu05s36go9uunsvc0mhqq2"], parameters: ["chat_text":chatMessageField.text!, "chat_submit": "Send"])
                .responseString { _, _, result in
                    
                    print("Success: \(result.isSuccess)")
                    //print("Response String: \(result.value)")
            }
            
        }
        
        /*Alamofire.request(.GET, "http://108.197.28.233/home.php", headers: ["Cookie": "PHPSESSID=17hjqu05s36go9uunsvc0mhqq2"])
            .responseString { _, _, result in
                
                print("Success: \(result.isSuccess)")
                print("Response String: \(result.value)")
        }
        
        Alamofire.request(.POST, "http://108.197.28.233/scripts/chat_post.php", headers: ["Cookie": "PHPSESSID=17hjqu05s36go9uunsvc0mhqq2"], parameters: ["chat_text":chatMessageField.text!, "chat_submit": "Send"])
            .responseString { _, _, result in
                
                print("Success: \(result.isSuccess)")
                print("Response String: \(result.value)")
        }*/
        
        
        
        
    }

    @IBOutlet weak var chatMessageField: UITextView!
    
    
}

