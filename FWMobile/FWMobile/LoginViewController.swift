//
//  ViewController.swift
//  FWMobile
//
//  Created by Austin Jackson on 9/23/15.
//  Copyright © 2015 Austin Jackson. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var passwordTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapView = UITapGestureRecognizer(target: self, action: "tapView")
        view.addGestureRecognizer(tapView)
        
        usernameTextField.delegate = self
        activityIndicator.alpha = 0
        
        if let cookie = FW_Mobile.defaults.stringForKey(FW_Mobile.keys.session) {
            print("Cookie already saved: "+cookie)
            FW_Mobile.cookie = cookie
        }
        else {
            print("Cookie not saved, generating a new one.")
            Alamofire.request(.GET, FW_Mobile.host+"/api/get_session_id.php")
                .responseString { response in
                    //print("Response String: \(response)")
                }
                .responseJSON { response in
                    //print("Response JSON: \()")
                    if let session = response.2.value {
                        FW_Mobile.cookie = "PHPSESSID="+(session as! String)
                        FW_Mobile.session = (session as! String)
                        FW_Mobile.defaults.setValue(FW_Mobile.session, forKey: FW_Mobile.keys.session)
                        FW_Mobile.defaults.setValue(FW_Mobile.cookie, forKey: FW_Mobile.keys.cookie)
                        print("Saved session: "+FW_Mobile.defaults.stringForKey(FW_Mobile.keys.session)!)
                        print("Saved cookie: "+FW_Mobile.defaults.stringForKey(FW_Mobile.keys.cookie)!)
                    }
            }
        }
    
    }
    
    @IBAction func loginButtonPressed(sender: UIButton) {
        
        if usernameTextField.hasText() && passwordTextField.hasText() {
            print("Trying to login with credentials...")
            self.activityIndicator.alpha = 1
            
            var defaultHeaders = Alamofire.Manager.sharedInstance.session.configuration.HTTPAdditionalHeaders ?? [:]
            defaultHeaders["Cookie"] = FW_Mobile.cookie
            
            let configuration = NSURLSessionConfiguration.defaultSessionConfiguration()
            configuration.HTTPAdditionalHeaders = defaultHeaders
            
            let manager = Alamofire.Manager(configuration: configuration)
            
            let credentials = [
                "myusername": usernameTextField.text!,
                "mypassword": passwordTextField.text!,
                "Submit":"Login"
            ]
            
            manager.request(.POST, FW_Mobile.host+"/main_login.php", parameters: credentials)
                .responseJSON { response in
                    
                    if let response = response.0 {
                        print(response)
                    }
                    else {
                        print("no response.0")
                    }
                    if let response = response.1 {
                        print(response)
                        print("Status code: \(response.statusCode)")
                    }
                    else {
                        print("no response.1")
                    }
                    if let response = response.2.value {
                        print(response)
                    }
                    else {
                        print("no response.2")
                    }
            }
        }
        print("login pressed")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tapView() {
        self.view.endEditing(true)
    }

    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
