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

class FeedVC: UIViewController, UITableViewDelegate, UITableViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var posts = [Post]()
    var imagePicker: UIImagePickerController!
    static var imageCache: NSCache<NSString, UIImage> = NSCache() //globally accesible variable / string reference to key and object is UIImage, cache for images
    var imageSelected = false

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = true //Allows user to crop images
        imagePicker.delegate = self
        
        
        //gives us back the information under the posts endpoint, all children under Posts object
        DataService.ds.REF_POSTS.observe(.value, with: { (snapshot) in
            self.posts = [] //Clears the posts array at the begining of the listener so it is cleared every time the listener fires otherwise they'll be duplicate posts because its just continuing to append - this clears it every time
            
            if let snapshot = snapshot.children.allObjects as? [FIRDataSnapshot] {
                for snap in snapshot {
                    print("SNAP: \(snap)")
                    
                    if let postDictionary = snap.value as? Dictionary<String, AnyObject> {
                        //Casting the snap value into a dictionary
                        let key = snap.key //key is the ID for the post
                        let post = Post(postKey: key, postData: postDictionary) //Adds the posts to an array
                        self.posts.append(post) //Creates an array of posts
                    }
                }
            }
            self.tableView.reloadData()
        })


    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return posts.count //number of cells to be the number of objects in the array posts
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let post = posts[indexPath.row]
        
        
        //configure tableview to take the posts array data and implment into cells
        if let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell") as? PostCell {

            if let img = FeedVC.imageCache.object(forKey: post.imageUrl as NSString) {
                cell.configureCell(post: post, img: img)
                return cell
            }else {
                cell.configureCell(post: post)
                return cell
            }
        }else {
            return PostCell()
        }

    }
    
    //Picks an image
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerEditedImage] as? UIImage {
            imageAdd.image = image //The image is replaced with the user choosen image
            imageSelected = true
        }else {
            print("ALI: A valid image wasn't selected")
        }
        imagePicker.dismiss(animated: true, completion: nil) //Once youve selected an image, dismisses the image picker
    }
    
    @IBOutlet weak var imageAdd: CircleView!
    
    
    @IBOutlet weak var captionField: FancyField!
    
    
    @IBAction func postBtnTapped(_ sender: Any) {
        guard let caption = captionField.text, caption != "" else { //basically asking if it exists pass it into the new constant caption, also make sure that new constant "caption" is not empty
            print("ALI: Caption must be entered")
            return
        }

        guard let img = imageAdd.image, imageSelected == true else {
            print("ALI: An image must be selected")
            return
            //basically making sure that there is something in imageAdd, if there is make it = to the created constant img
        }
        
        if let imgData = UIImageJPEGRepresentation(img, 0.2) {//converting our image into image data so it can be passed into firebase storage and compresses - conserves data and increases speed in uploading
            
            let imgUID = NSUUID().uuidString //creates random string of characters (UID) - unique
            let metaData = FIRStorageMetadata()
            metaData.contentType = "image/jpeg" //tells firebase storage that were passing in jpeg instead of letting it infer
            
            DataService.ds.REF_POSTED_IMAGES.child(imgUID).put(imgData, metadata: metaData) { (metaData, error) in
                if error != nil {
                    print("ALI: Unable to upload image to FirebaseStorage \(error)")
                }else {
                    print("ALI: Succesfuly uploaded image to Firebase Storage")
                    let downloadURL = metaData?.downloadURL()?.absoluteString // the metaData in the completion handler contains the downloadUrl for image and converting it into an absoluteString(so its exactly right)
                    if let url = downloadURL {
                        self.postToFirebase(imgUrl: url) //downloadURL contains the url
                    }
                    
                }
            }//child is the image name were uploading to FBDB
            
        }
    }
    
    func postToFirebase(imgUrl: String) {
        let post: Dictionary<String, Any> = [
            "caption": captionField.text!,
            "imageUrl": imgUrl,
            "likes": 0
        ] //Creates a dictionary, where caption comes from the user entered text, imageUrl comes from the downloadURL above and likes is currently 0
        
        let firebasePost = DataService.ds.REF_POSTS.childByAutoId() //automatically generates a unique identifier for us postKey ID
        firebasePost.setValue(post)
        
        captionField.text = ""
        imageSelected = false
        imageAdd.image = UIImage(named: "add-image")
        
        tableView.reloadData()
    }
    
    @IBAction func addImageTapped(_ sender: Any) {
        present(imagePicker, animated: true, completion: nil) //Opens up image picker
    }
    
    @IBAction func signOutTapped(_ sender: Any) {
        let keychainResult = KeychainWrapper.standard.removeObject(forKey: KEY_UID)
        print("ALI: ID removed from keychain \(keychainResult) ")
        try! FIRAuth.auth()?.signOut()
        dismiss(animated: true, completion: nil) //Removes credentials from keychain and dismisses view back to log in screen
    }


    


}
