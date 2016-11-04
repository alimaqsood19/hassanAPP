//
//  SignUpAuthVC.swift
//  hassanAPP
//
//  Created by Ambar Maqsood on 2016-11-02.
//  Copyright © 2016 Ambar Maqsood. All rights reserved.
//

import UIKit
import Firebase
import FBSDKCoreKit
import FBSDKLoginKit

class SignUpAuthVC: UIViewController {
    
    
    @IBOutlet weak var hassanLogoImg: Logo!
    
    @IBAction func facebookBtnTapped(_ sender: AnyObject) {
        //allows facebook to authenticate login
        let facebookLogin = FBSDKLoginManager()
        
        //permission to login with facebook credentials
        facebookLogin.logIn(withReadPermissions: ["email"], from: self) { (result, error) in
            if error != nil {
                print("ALI: Unable to authenticate with facebook - \(error)")
            }else if result?.isCancelled == true {
                print("ALI: User cancelled facebook authentication")
            }else {
                print("ALI: Sucessfully authenticated with facebook")
                let credential = FIRFacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
                self.firebaseAuth(credential)
            }
        }
    }
    //Authenticating with firebase
    func firebaseAuth(_ credential: FIRAuthCredential) {
        FIRAuth.auth()?.signIn(with: credential, completion: { (user, error) in
            if error != nil {
                print("ALI: Unable to authenticate with Firbase - \(error)")
            }else {
                print("ALI: Succesfully authenticated with firebase")
            }
        })
    }
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        hassanLogoImg.addRounded()
        hassanLogoImg.addDropShadow()

        
    }


}
