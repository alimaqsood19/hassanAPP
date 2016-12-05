//
//  DataService.swift
//  hassanAPP
//
//  Created by Ambar Maqsood on 2016-11-16.
//  Copyright © 2016 Ambar Maqsood. All rights reserved.
//

import Foundation
import Firebase
import SwiftKeychainWrapper

let DB_BASE = FIRDatabase.database().reference() //The url to the root database, its in the googleService-info.plist under DATABASE_URL
let STORAGE_BASE = FIRStorage.storage().reference() //URL root for storage same as above

class DataService {
    
    static let ds = DataService()  //Creates a singleton, creates a single instance to this class, where it can be accessed globally anywhere
    
    private var _REF_POSTED_IMAGES = STORAGE_BASE.child("post-pics") //get everything under the post-pics endpoint 
    
    //DATABASE References
    private var _REF_BASE = DB_BASE
    private var _REF_POSTS = DB_BASE.child("posts")  //end points in database created
    private var _REF_USERS = DB_BASE.child("users")
    
    
    var REF_BASE: FIRDatabaseReference {
        return _REF_BASE
    }
    
    var REF_POSTS: FIRDatabaseReference {
        return _REF_POSTS
    }
    
    var REF_USERS: FIRDatabaseReference {
        return _REF_USERS
    }
    
    var REF_USER_CURRENT: FIRDatabaseReference {
        let uid = KeychainWrapper.standard.string(forKey: KEY_UID) //retrieves string value from keychain
        let user = REF_USERS.child(uid!) //reference to current user
        return user
    }
    
    var REF_POSTED_IMAGES: FIRStorageReference {
        return _REF_POSTED_IMAGES
    }
    
    
    
    func createFirebaseDBUser(uid: String, userData: Dictionary<String, String>) {
        
        REF_USERS.child(uid).updateChildValues(userData) //References the user ID under the users endpoint in the database, firebase will create the UID for us, Creates the USER in database
        
    }
    
    
}
