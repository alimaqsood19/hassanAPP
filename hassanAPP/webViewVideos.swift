//
//  webViewVideos.swift
//  hassanAPP
//
//  Created by Ambar Maqsood on 2016-09-29.
//  Copyright © 2016 Ambar Maqsood. All rights reserved.
//

import UIKit

class webViewVideos: UIViewController {
    
    @IBAction func backBtnPressed(_ sender: AnyObject) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet weak var videoTitleLbl: UILabel!
    @IBOutlet weak var webView: UIWebView!
    private var _ytvideo: YoutubeVideo!
    
    var ytvideo: YoutubeVideo {
        get {
            return _ytvideo
        } set {
            _ytvideo = newValue
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        

        
        webView.scrollView.isScrollEnabled = false
        webView.scalesPageToFit = true
        webView.contentMode = UIViewContentMode.scaleAspectFit
        
        videoTitleLbl.text = ytvideo.videoTitle
        webView.loadHTMLString(ytvideo.videoURL, baseURL: nil)

            }



}
