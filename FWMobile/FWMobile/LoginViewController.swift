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
    @IBOutlet weak var loginViewTitle: UILabel!
    
    func trySecurityTest() {
        print("trying security test")
        let headers = [
            "Cookie": FW_Mobile.cookie,
            "Referer": "http://108.197.28.233/homepage.php"
        ]
        
        Alamofire.request(.GET, FW_Mobile.host+"/login_redirect.php", headers: headers)
            .responseJSON { response in
                //print(response)
                if let response = response.1 {
                    print("GET /login_redirect.php \(response.statusCode)")
                }
                
        }
    }
    
    func getNewCookie() {
        print("getting new cookie")
        Alamofire.request(.GET, FW_Mobile.host+"/api/get_session_id.php")
            .responseJSON { response in
                if let session = response.2.value {
                    FW_Mobile.cookie = "PHPSESSID="+(session as! String)
                    FW_Mobile.defaults.setValue(FW_Mobile.cookie, forKey: FW_Mobile.keys.cookie)
                    print("Saved cookie: "+FW_Mobile.defaults.stringForKey(FW_Mobile.keys.cookie)!)
                }
        }
    }
    func getNewCookieAndTrySecurityTest() {
        print("getting new cookie AND retrying security test")
        Alamofire.request(.GET, FW_Mobile.host+"/api/get_session_id.php")
            .responseJSON { response in
                if let session = response.2.value {
                    FW_Mobile.cookie = "PHPSESSID="+(session as! String)
                    FW_Mobile.defaults.setValue(FW_Mobile.cookie, forKey: FW_Mobile.keys.cookie)
                    print("Saved cookie: "+FW_Mobile.defaults.stringForKey(FW_Mobile.keys.cookie)!)
                    self.trySecurityTest()
                }
                else {
                    print("Session cookie not received from server")
                }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapView = UITapGestureRecognizer(target: self, action: "tapView")
        view.addGestureRecognizer(tapView)
        
        activityIndicator.alpha = 0
        
        
        if let cookie = FW_Mobile.defaults.stringForKey(FW_Mobile.keys.cookie) {
            print("Cookie already saved: "+cookie)
            FW_Mobile.cookie = cookie
            getNewCookieAndTrySecurityTest()
        }
        else {
            print("Cookie not saved, generating a new one.")
            getNewCookieAndTrySecurityTest()
        }
        
        
        
    }
    
    @IBAction func loginButtonPressed(sender: UIButton) {
        
        if usernameTextField.hasText() && passwordTextField.hasText() {
            print("Trying to login with credentials:\nUsername:\'\(usernameTextField.text!)\'\nPassword: \'\(passwordTextField.text!)\'")
            self.activityIndicator.alpha = 1
            
            let URL = NSURL(string: FW_Mobile.host+"/main_login.php")!
            let mutableUrlRequest = NSMutableURLRequest(URL: URL)
            mutableUrlRequest.HTTPMethod = "POST"
            
            let credentials = "myusername=\(usernameTextField.text!)&mypassword=\(passwordTextField.text!)&Submit=Login"
            mutableUrlRequest.HTTPBody = credentials.dataUsingEncoding(NSUTF8StringEncoding)
            
            mutableUrlRequest.addValue("http://108.197.28.233/homepage.php", forHTTPHeaderField: "Referer")
            
            Alamofire.request(mutableUrlRequest)
                .responseJSON { response in
                    
                    if let response = response.1 {
                        print("POST /main_login.php \(response.statusCode)")
                        //print("Status code: \(response.statusCode)")
                        if(response.statusCode == 404) {
                            print("login failed with cookie: \(FW_Mobile.cookie)")
                            self.getNewCookieAndTrySecurityTest()
                            self.activityIndicator.alpha = 0
                            self.loginViewTitle.text = "Title ❌"
                        }
                        else if(response.statusCode == 401) {
                            print("wrong login credentials entered: \(FW_Mobile.cookie)")
                            self.getNewCookieAndTrySecurityTest()
                            self.activityIndicator.alpha = 0
                            self.loginViewTitle.text = "Title ⚠️"
                        }
                        else if(response.statusCode == 302 || response.statusCode == 200) {
                            print("login successful! with cookie: \(FW_Mobile.cookie)")
                            self.activityIndicator.alpha = 0
                            self.loginViewTitle.text = "Title ✅"
                        }
                        else {
                            self.activityIndicator.alpha = 0
                            self.loginViewTitle.text = "Title ❌"
                        }
                    }
                    else {
                        print("no response.1")
                        self.activityIndicator.alpha = 0
                        self.loginViewTitle.text = "Title ❌❌"
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
