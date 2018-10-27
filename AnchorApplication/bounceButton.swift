//
//  bounceButton.swift
//  AnchorApplication
//
//  Created by Keith Leung on 10/26/18.
//  Copyright © 2018 Keith Leung. All rights reserved.
//

import UIKit

class bounceButton: UIButton {

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 6, options: .allowUserInteraction, animations: {self.transform = CGAffineTransform.identity}, completion: nil)
        
        super.touchesBegan(touches, with: event)
    }
}

