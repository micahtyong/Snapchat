//
//  LoginViewController.swift
//  Snapchat
//
//  Created by Micah Yong on 3/4/19.
//  All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // Segues to Snapchat Homepage
    @IBAction func loginAction(_ sender: Any) {
        performSegue(withIdentifier: "loginSegue", sender: sender)
    }

    // Essentialy performs same action as loginAction in another way
    @IBAction func signupAction(_ sender: UIButton) {
        let mainTabController = storyboard?.instantiateViewController(withIdentifier: "MainTabController") as! MainTabController
        mainTabController.selectedViewController = mainTabController.viewControllers?[1]
        present(mainTabController, animated: true, completion: nil)
    }
}


