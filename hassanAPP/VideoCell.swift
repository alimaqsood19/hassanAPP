//
//  VideoCell.swift
//  hassanAPP
//
//  Created by Ambar Maqsood on 2016-09-28.
//  Copyright © 2016 Ambar Maqsood. All rights reserved.
//

import UIKit

class VideoCell: UITableViewCell {
    
    @IBOutlet weak var viewPreviewImg: UIImageView!
    
    @IBOutlet weak var videoTitle: UILabel!
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func updateUI(videos: YoutubeVideo) {
        videoTitle.text = videos.videoTitle
        
        let url = URL(string: videos.imageURL)!
        
        DispatchQueue.global().async {
            do {
                let data = try Data(contentsOf: url)
                DispatchQueue.global().sync {
                    self.viewPreviewImg.image = UIImage(data: data)
                }
            }catch {
                //handles error
            }
        }
        
    }

}
