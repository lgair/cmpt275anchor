//
//  shapedButton.swift
//  AnchorApplication
//
//  Created by Keith Leung on 10/25/18.
//  Copyright © 2018 Keith Leung. All rights reserved.
//
// Team Siwash - Group 12
// CMPT 275
//
// shapedButton.swift adds the following three attributes to the button object:
// 1) Corner Radius - used to round the border corners of a button
// 2) Border Width - modifies the thickness of the button border
// 3) Border Color - modifies the color of the button border
//
// shapedButton.swift is a parent class of bounceButton.swift

import UIKit

@IBDesignable class shapedButton: bounceButton  {

    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            self.layer.borderWidth = borderWidth
        }
    }
    @IBInspectable var borderColor: UIColor = UIColor.clear {
        didSet {
            self.layer.borderColor = borderColor.cgColor
        }
    }
    

}
