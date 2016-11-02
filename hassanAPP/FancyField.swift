//
//  FancyField.swift
//  hassanAPP
//
//  Created by Ambar Maqsood on 2016-11-02.
//  Copyright © 2016 Ambar Maqsood. All rights reserved.
//

import UIKit

class FancyField: UITextField {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //Custom border for uitextfield
        layer.borderColor = UIColor(red: SHADOW_GRAY, green: SHADOW_GRAY, blue: SHADOW_GRAY, alpha: 0.2).cgColor
        layer.borderWidth = 1.0
        layer.cornerRadius = 3.0
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 10, dy: 5) //placeholder text indents it a little
    }
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 10, dy: 5)
    }
    
    

}
