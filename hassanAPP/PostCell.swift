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
    
    var post: Post!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        
    }
    
    func configureCell(post: Post, img: UIImage? = nil ) { //default value for img = nil if no image
        self.post = post
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
    }
}
