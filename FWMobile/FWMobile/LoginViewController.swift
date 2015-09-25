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
        
        FW_Mobile.session = "PHPSESSID=1moigfojmumjc6khnsv4butvq0"

        
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
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBAction func loginButtonPressed(sender: UIButton) {
        
        if(usernameTextField.hasText() && passwordTextField.hasText()) {
            self.activityIndicator.alpha = 1
        
            //Can't get Session ID from this, see current development workaround in viewDidLoad()
            
            
            /*Alamofire.request(.GET, FW_Mobile.host+"/", headers: headers)
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
