//
//  ViewController.swift
//  ios
//
//  Created by Lucas Freitas on 4/15/17.
//  Copyright © 2017 Everyday Activism. All rights reserved.
//

import UIKit
import FacebookLogin

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Add Facebook Login button.
        let loginButton = LoginButton(readPermissions: [ .publicProfile ])
        loginButton.center = view.center
        
        //view.addSubview(loginButton)

    }

    //MARK: Navigation
    @IBAction func back(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }


}

