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
    
    
    @IBOutlet weak var passwordCharacterLength: UILabel!
    
    
    @IBOutlet weak var emailField: FancyField!
    
    @IBOutlet weak var passwordField: FancyField!
    
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
    
    //Authenticating with just email
    @IBAction func signUpTapped(_ sender: AnyObject) {
        if let email = emailField.text, let password = passwordField.text {
            FIRAuth.auth()?.signIn(withEmail: email, password: password, completion: { (user, error) in
                if error == nil { //user existed and pw cor
                    print("ALI: Email User authenticated with firebase")
                }else {
                    FIRAuth.auth()?.createUser(withEmail: email, password: password, completion: { (user, error) in
                        if error != nil {
                            print("ALI: Email unable to authenticate with firebase")
                        }else {
                            self.passwordCharacterLength.isHidden = false
                            print("ALI: Successfully email authenticated with firebase")
                            self.passwordCharacterLength.text = "Successfully created a new account!"
                        }
                    })
                }
            })
        }
        
        if (passwordField.text?.characters.count)! < 6 {
            passwordCharacterLength.isHidden = false
        }else {
            passwordCharacterLength.isHidden = true
        }
    }
    
   
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        hassanLogoImg.addRounded()
        hassanLogoImg.addDropShadow()

        
    }


}
