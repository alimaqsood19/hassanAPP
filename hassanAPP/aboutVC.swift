//
//  aboutVC.swift
//  hassanAPP
//
//  Created by Ambar Maqsood on 2016-09-28.
//  Copyright © 2016 Ambar Maqsood. All rights reserved.
//

import UIKit

class aboutVC: UIViewController {
    
    @IBOutlet weak var textView: UITextView!
    
    @IBAction func backBtnPressed(_ sender: AnyObject) {
        dismiss(animated: true, completion: nil)
    
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        self.textView.scrollRangeToVisible(NSMakeRange(0, 0))
        
        
    }

    override func viewDidLayoutSubviews() {
         super.viewDidLayoutSubviews()
        textView.setContentOffset(CGPoint.zero, animated: false)
    }
}
