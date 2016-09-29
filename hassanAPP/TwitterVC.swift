//
//  TwitterVC.swift
//  hassanAPP
//
//  Created by Ambar Maqsood on 2016-09-29.
//  Copyright © 2016 Ambar Maqsood. All rights reserved.
//

import UIKit

class TwitterVC: UIViewController {
    @IBOutlet weak var webViewTwitter: UIWebView!

    @IBAction func backBtnPressed(_ sender: AnyObject) {
        dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let twitterURL = NSURL(string: "https://twitter.com/realhassanmusic")
        let requestObj = NSURLRequest(url: twitterURL! as URL)
        webViewTwitter.loadRequest(requestObj as URLRequest)


    }


}
