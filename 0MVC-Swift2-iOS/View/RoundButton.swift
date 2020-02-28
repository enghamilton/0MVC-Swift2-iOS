//
//  RoundButton.swift
//  0MVC-Swift2-iOS
//
//  Created by macOS on 01/12/19.
//  Copyright © 2019 macOS. All rights reserved.
//

import UIKit
import QuartzCore

@IBDesignable
class RoundButton: UIButton {
    @IBInspectable var cornerRadius :CGFloat = 0 {
        didSet{
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable var borderWidth :CGFloat = 0 {
        didSet{
            self.layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var borderColor :UIColor = UIColor.clearColor() {
        didSet{
            self.layer.borderColor = borderColor.CGColor
        }
    }
}
