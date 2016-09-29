//
//  FacebookVC.swift
//  hassanAPP
//
//  Created by Ambar Maqsood on 2016-09-29.
//  Copyright © 2016 Ambar Maqsood. All rights reserved.
//

import UIKit

class FacebookVC: UIViewController {
    
    @IBOutlet weak var webViewFB: UIWebView!

    @IBAction func backBtnPressed(_ sender: AnyObject) {
        dismiss(animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        let fbURL = NSURL(string: "https://www.facebook.com/realHASSANartist/")
        let requestObj = NSURLRequest(url: fbURL! as URL)
        webViewFB.loadRequest(requestObj as URLRequest)
        


        
    }



}
