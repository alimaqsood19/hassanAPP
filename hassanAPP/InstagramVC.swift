//
//  InstagramVC.swift
//  hassanAPP
//
//  Created by Ambar Maqsood on 2016-09-29.
//  Copyright © 2016 Ambar Maqsood. All rights reserved.
//

import UIKit

class InstagramVC: UIViewController {
    
    @IBOutlet weak var webViewInstagram: UIWebView!
    
    @IBAction func backBtnPressed(_ sender: AnyObject) {
        dismiss(animated: true, completion: nil)
    }


    override func viewDidLoad() {
        super.viewDidLoad()

        let IGURL = NSURL(string: "https://www.instagram.com/realhassanmusic/")
        let requestObj = NSURLRequest(url: IGURL! as URL)
        webViewInstagram.loadRequest(requestObj as URLRequest)
    }


}
