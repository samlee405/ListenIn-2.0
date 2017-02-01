//
//  AuthenticationViewController.swift
//  ListenIn 2.0
//
//  Created by Sam Lee on 1/31/17.
//  Copyright © 2017 Sam Lee. All rights reserved.
//

import UIKit

class AuthenticationViewController: UIViewController {
    
    var session: SPTSession?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeView()
    }
    
    func initializeView() {
        // Load background
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "LaunchScreen")
        backgroundImage.contentMode =  UIViewContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
    }
}
