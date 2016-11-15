//
//  FeedVC.swift
//  hassanAPP
//
//  Created by Ambar Maqsood on 2016-11-08.
//  Copyright © 2016 Ambar Maqsood. All rights reserved.
//

import UIKit
import SwiftKeychainWrapper
import Firebase

class FeedVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()


    }
    
    
    @IBAction func signOutTapped(_ sender: Any) {
        let keychainResult = KeychainWrapper.standard.removeObject(forKey: KEY_UID)
        print("ALI: ID removed from keychain \(keychainResult) ")
        try! FIRAuth.auth()?.signOut()
        dismiss(animated: true, completion: nil)
    }


    


}
