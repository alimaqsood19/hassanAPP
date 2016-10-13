//
//  SignUpVC.swift
//  hassanAPP
//
//  Created by Ambar Maqsood on 2016-10-01.
//  Copyright © 2016 Ambar Maqsood. All rights reserved.
//

import UIKit

class SignUpVC: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    
    @IBAction func backBTNPressed(_ sender: AnyObject) {
        dismiss(animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let webURL = NSURL(string: "http://officialhassan.com/signup")
        let requestOBJ = NSURLRequest(url: webURL! as URL)
        
        webView.loadRequest(requestOBJ as URLRequest)
        
    }


}
