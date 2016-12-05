//
//  PostCell.swift
//  hassanAPP
//
//  Created by Ambar Maqsood on 2016-11-14.
//  Copyright © 2016 Ambar Maqsood. All rights reserved.
//

import UIKit
import Firebase

class PostCell: UITableViewCell {
    
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var usernameLbl: UILabel!
    @IBOutlet weak var postImg: UIImageView!
    @IBOutlet weak var captionTxt: UITextView!
    @IBOutlet weak var likesLbl: UILabel!
    @IBOutlet weak var likeImg: UIImageView!
    
    var post: Post!
    var likesRef: FIRDatabaseReference!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector (likeTapped))
        tap.numberOfTapsRequired = 1
        likeImg.addGestureRecognizer(tap)
        likeImg.isUserInteractionEnabled = true
        
        
        
    }
    
    func configureCell(post: Post, img: UIImage? = nil ) { //default value for img = nil if no image
        self.post = post
        likesRef = DataService.ds.REF_USER_CURRENT.child("likes").child(post.postKey)
        
        self.captionTxt.text = post.caption
        self.likesLbl.text = "\(post.likes)"
        //from the posts array data
        
        
        //Downloading images and saving them to the cache
        if img != nil {
            self.postImg.image = img  //If the image exists in the cashe, set the posted image to that image
        }else { //IF NOT then
                let ref = FIRStorage.storage().reference(forURL: post.imageUrl)
                ref.data(withMaxSize: 2 * 1024 * 1024, completion: { (data, error) in  //2 megabytes storage capacity
                    if error != nil {
                        print("ALI: Unable to download image from Firebase storage \(error)")
                    }else {
                        print("ALI: Image downloaded from Firebase storage")
                        if let imgData = data {
                            if let img = UIImage(data: imgData) {
                                self.postImg.image = img
                                FeedVC.imageCache.setObject(img, forKey: post.imageUrl as NSString)
                            }
                        }
                    }
            })
        }
        //referring to the child post likes under users

        likesRef.observeSingleEvent(of: .value, with: { (snapshot) in
            if let _ = snapshot.value as? NSNull { //if the like is null/zero then
                self.likeImg.image = UIImage(named: "empty-heart")
            }else { //otherwise if its liked then display
                self.likeImg.image = UIImage(named: "filled-heart")
            }
        })
    }
    func likeTapped(sender: UITapGestureRecognizer) {
        let likesRef = DataService.ds.REF_USER_CURRENT.child("likes")
        likesRef.observeSingleEvent(of: .value, with: { (snapshot) in
            if let _ = snapshot.value as? NSNull { //if the like is null/zero then
                self.likeImg.image = UIImage(named: "filled-heart")
                self.post.adjustLikes(addLike: true)
                self.likesRef.setValue(true) //adding true to the user ID/that particular post
            }else { //otherwise if its liked then display
                self.likeImg.image = UIImage(named: "empty-heart")
                self.post.adjustLikes(addLike: false)
                self.likesRef.removeValue()
            }
        })
    }
}
