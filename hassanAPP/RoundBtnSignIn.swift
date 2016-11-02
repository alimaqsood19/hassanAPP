//
//  RoundBtnSignIn.swift
//  hassanAPP
//
//  Created by Ambar Maqsood on 2016-11-02.
//  Copyright © 2016 Ambar Maqsood. All rights reserved.
//

import UIKit

class RoundBtnSignIn: UIButton {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.shadowColor = UIColor(red: SHADOW_GRAY, green: SHADOW_GRAY, blue: SHADOW_GRAY, alpha: 0.7).cgColor
        layer.shadowOpacity = 0.8
        layer.shadowRadius = 5.0
        layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        layer.cornerRadius = 3.0
    }

}
