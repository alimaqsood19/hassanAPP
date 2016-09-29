//
//  youtubeVideos.swift
//  hassanAPP
//
//  Created by Ambar Maqsood on 2016-09-29.
//  Copyright © 2016 Ambar Maqsood. All rights reserved.
//

import Foundation

class YoutubeVideo {
    
    private var _imageURL: String!
    private var _videoURL: String!
    private var _videoTitle: String!
    
    var imageURL: String {
        return _imageURL
    }
    
    var videoURL: String {
        return _videoURL
    }
    
    var videoTitle: String {
        return _videoTitle
    }
    
    init(imageURL: String, videoURL: String, videoTitle: String) {
        
        _imageURL = imageURL
        _videoURL = videoURL
        _videoTitle = videoTitle
    }
}
