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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapView = UITapGestureRecognizer(target: self, action: "tapView")
        self.view.addGestureRecognizer(tapView)
        
        usernameTextField.delegate = self
        activityIndicator.alpha = 0
        
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
    
    let FW_IP = "http://108.197.28.233"
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBAction func loginButtonPressed(sender: UIButton) {
        
        if(usernameTextField.hasText() && passwordTextField.hasText()) {
            self.activityIndicator.alpha = 1
            
            let headers = [
                "Host": "108.197.28.233",
                "User-Agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:40.0) Gecko/20100101 Firefox/40.0",
                "Accept": "text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8",
                "Accept-Language": "en-US,en;q=0.5",
                "Accept-Encoding": "gzip, deflate",
                "DNT": "1",
                "Connection": "keep-alive",
                "Cookie": ""
            ]
            
            
            
            
            /*Alamofire.request(.GET, FW_IP+"/", headers: headers)
                .response { request, response, data, error in
                    
                    
                    if let theError = error {
                        print(theError)
                        
                    }
                    
                    if let httpRequest = request {
                        print(httpRequest)
                        
                    }
                    
                    if let httpResponse = response {
                        print(httpResponse.allHeaderFields)
                    }
                }
            */
    
            }
        }
        
    }


    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
