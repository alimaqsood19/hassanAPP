//
//  ShadowsRound.swift
//  hassanAPP
//
//  Created by Ambar Maqsood on 2016-11-02.
//  Copyright © 2016 Ambar Maqsood. All rights reserved.
//

import UIKit

protocol DropshadowRound {}

extension DropshadowRound where Self: UIView {
    func addDropShadow() {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.7
        layer.shadowOffset = CGSize.zero
        layer.shadowRadius = 5.0
    }
    func addRounded() {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        imageView.layer.cornerRadius = 3.0
        
        
    }

}
