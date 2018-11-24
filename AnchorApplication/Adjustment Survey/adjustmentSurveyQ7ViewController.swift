//
//  adjustmentSurveyQ7ViewController.swift
//  AnchorApplication
//
//  Created by Keith Leung on 2018-11-18.
//  Copyright © 2018 Keith Leung. All rights reserved.
//

import UIKit

class adjustmentSurveyQ7ViewController: UIViewController {

    static var prevWearingOffQ7: Int = adjustmentSurveyQ6ViewController.prevWearingOffQ6
    static var prevDyskinesiaQ7: Int = adjustmentSurveyQ6ViewController.prevDyskinesiaQ6
    
    override func viewDidLoad() {
        print("On adjustmentSurveyQ7...")
        print("Current wearing off: ", adjustmentSurveyQ1ViewController.globalWearingOff)
        print("Current dyskinesia: ", adjustmentSurveyQ1ViewController.globalDyskinesia)
        super.viewDidLoad()
        assignbackground()
    
    }
    
    @IBAction func yesClicked(_ sender: Any) {
        adjustmentSurveyQ7ViewController.prevDyskinesiaQ7 = adjustmentSurveyQ1ViewController.globalDyskinesia
        adjustmentSurveyQ7ViewController.prevWearingOffQ7 = adjustmentSurveyQ1ViewController.globalWearingOff
        adjustmentSurveyQ1ViewController.globalDyskinesia = adjustmentSurveyQ1ViewController.globalDyskinesia + 1
        adjustmentSurveyQ1ViewController.globalWearingOff = adjustmentSurveyQ1ViewController.globalWearingOff + 1
        performSegue(withIdentifier: "toadjustmentSurveyQ8", sender: self)
    }
    
    
    @IBAction func noClicked(_ sender: Any) {
        adjustmentSurveyQ7ViewController.prevDyskinesiaQ7 = adjustmentSurveyQ1ViewController.globalDyskinesia
        adjustmentSurveyQ7ViewController.prevWearingOffQ7 = adjustmentSurveyQ1ViewController.globalWearingOff
        adjustmentSurveyQ1ViewController.globalWearingOff = adjustmentSurveyQ1ViewController.globalWearingOff + 1
        performSegue(withIdentifier: "toadjustmentSurveyQ8", sender: self)
    }
    
    @IBAction func backClicked(_ sender: Any) {
        adjustmentSurveyQ1ViewController.globalWearingOff = adjustmentSurveyQ6ViewController.prevWearingOffQ6
        adjustmentSurveyQ1ViewController.globalDyskinesia = adjustmentSurveyQ6ViewController.prevDyskinesiaQ6
        performSegue(withIdentifier: "backToQ6", sender: self)
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
