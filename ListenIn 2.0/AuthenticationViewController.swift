//
//  AuthenticationViewController.swift
//  ListenIn 2.0
//
//  Created by Sam Lee on 1/31/17.
//  Copyright © 2017 Sam Lee. All rights reserved.
//

import UIKit

class AuthenticationViewController: UIViewController, SPTAuthViewDelegate {
    
    @IBOutlet weak var logInButton: UIButton!
    
    let clientID = "be6510d70bda4a288b2725ff06c4b2e3"
    let callbackURL = "listenin://callback"
    
    let spotifyAuthenticator = SPTAuth.defaultInstance()
    var session: SPTSession?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeView()
    }
    
    @IBAction func didPressLogIn(_ sender: Any) {
        passInAuthenticationDetails()
        presentSpotifyLogInVC()
    }
    
    func initializeView() {
        // Load background
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "LaunchScreen")
        backgroundImage.contentMode =  UIViewContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
        
        // Modify on-screen images
//        logInButton.layer.cornerRadius = 0.5 * logInButton.bounds.height
    }
    
    func passInAuthenticationDetails() {
        spotifyAuthenticator?.clientID = clientID
        spotifyAuthenticator?.redirectURL = URL(string: callbackURL)
        spotifyAuthenticator?.requestedScopes = [SPTAuthPlaylistModifyPublicScope, SPTAuthUserFollowReadScope, SPTAuthUserLibraryReadScope, SPTAuthStreamingScope]
    }
    
    func presentSpotifyLogInVC() {
        let spotifyAuthenticationVC = SPTAuthViewController.authentication()
        spotifyAuthenticationVC?.delegate = self
        spotifyAuthenticationVC?.modalPresentationStyle = UIModalPresentationStyle.currentContext
        spotifyAuthenticationVC?.modalTransitionStyle = .crossDissolve
        self.modalPresentationStyle = .currentContext
        self.definesPresentationContext = true
        self.present(spotifyAuthenticationVC!, animated: true, completion: nil)
    }
    
    // MARK: - Login responses
    
    func authenticationViewController(_ authenticationViewController: SPTAuthViewController!, didLoginWith session: SPTSession!) {
        print("authenticated")
//        let vc = self.storyboard!.instantiateViewController(withIdentifier: "mainScreen")
//        appDelegate.window!.rootViewController = vc
    }
    
    func authenticationViewController(_ authenticationViewController: SPTAuthViewController!, didFailToLogin error: Error!) {
        print("Login failed... \(error)")
    }
    
    func authenticationViewControllerDidCancelLogin(_ authenticationViewController: SPTAuthViewController!) {
        print("Login was cancelled")
    }
}
