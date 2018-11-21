//
//  decisionSurveyQ2ViewController.swift
//  AnchorApplication
//
//  Created by Keith Leung on 2018-11-15.
//  Copyright © 2018 Keith Leung. All rights reserved.
//
// decisionSurveyQ2ViewController.swift is applied only to question 2 in Decision Survey
// A help button will appear on the screen after ~6 seconds of idling to assist surveyees in answering the question
// To exit the helper screen, simply click on the background outside of the helper text

import UIKit

class decisionSurveyQ2ViewController: UIViewController {

    
    @IBOutlet weak var backgroundButton: UIButton!
    @IBOutlet weak var centerPopupConstraint: NSLayoutConstraint!
    @IBOutlet weak var popupView: UIView!
    
    @IBOutlet weak var helpButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        assignbackground()
        // Rounded corners for the popupView
        popupView.layer.cornerRadius = 10
        popupView.layer.masksToBounds = true
        // Initially hide the helpButton
        helpButton.isHidden = true
        // Reveal helpButton after ~6 seconds from user idling
        DispatchQueue.main.asyncAfter(deadline: .now() + 5){
            self.helpButton.isHidden = false
        }

        // Do any additional setup after loading the view.
    }
    
    @IBAction func showPopUp(_ sender: Any) {
        // centerPopupConstraint is set to 0 (or set to be on screen)
        centerPopupConstraint.constant = 0
        // popupView is animated when appearing on screen
        UIView.animate(withDuration: 0.3, animations: {
            self.view.layoutIfNeeded()
            // background is configured as a button and masks over the question with alpha = 0.70
            self.backgroundButton.alpha = 0.70
        })
        
    }
    
    
    @IBAction func closePopup(_ sender: Any) {
        // centerPopupContraint is set to -350 to move it off screen
        centerPopupConstraint.constant = -350
        UIView.animate(withDuration: 0.1, animations: {
            self.view.layoutIfNeeded()
            // background is configured as a button and is unmasked from the question
            self.backgroundButton.alpha = 0
        })
    }
    
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
