//
//  disclaimerViewController.swift
//  AnchorApplication
//
//  Created by Keith Leung on 2018-11-15.
//  Copyright © 2018 Keith Leung. All rights reserved.
//
//  disclaimerViewController.swift is applied on the decision survey disclaimer viewcontroller and adjustment survey disclaimer viewcontroller
//  Users are expected to read the disclaimer and intro to the surveys before proceeding
//  The switch on the disclaimer pages must be switched on in order to enable the proceedButton

import UIKit

class disclaimerViewController: UIViewController {

    @IBOutlet weak var proceedButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        assignbackground()
        print("Disclaimer View Loaded")
        
        // proceedButton is initially disabled until the switch is switched on
        proceedButton.isEnabled = false

        
    }
    
    @IBAction func agreeSwitched(_ sender: UISwitch) {
        
        // proceedButton is enabled when a sender of type UISwitch is switched on
        proceedButton.isEnabled = sender.isOn
    }
    

    //This function sets the background image
    func assignbackground(){
        //Importing Main Background
        let background = UIImage(named: "background2")
        var imageView : UIImageView!
        //Setting the background within the bounds
        imageView = UIImageView(frame: view.bounds)
        //Setting the background to fill the whole screen
        imageView.contentMode =  UIViewContentMode.scaleAspectFill
        //A boolean value that determines whether subviews are confined to the bounds
        imageView.clipsToBounds = true
        imageView.image = background
        //Center Aligning the Background image
        imageView.center = view.center
        view.addSubview(imageView)
        //Setting Background Image to the Back
        self.view.sendSubview(toBack: imageView)
    }
}
