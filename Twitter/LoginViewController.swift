//
//  LoginViewController.swift
//  Twitter
//
//  Created by Mac Cooper on 2/14/20.
//  Copyright © 2020 Dan. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    let myUrl = "https://api.twitter.com/oauth/request_token"
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if UserDefaults.standard.bool(forKey: "userLoggedInbb") == true {
             self.performSegue(withIdentifier: "loginToHome", sender: self)
        }
    }
    
   
    @IBAction func onLoginButton(_ sender: Any) {
        TwitterAPICaller.client?.login(url: myUrl, success: {
            
            UserDefaults.standard.set(true, forKey: "userLoggedInbb")
            self.performSegue(withIdentifier: "loginToHome", sender: self)
        }, failure: { (Error) in
            print("Could not log in!")
        })
    }

}
