//
//  adjustmentSurveyQ6ViewController.swift
//  AnchorApplication
//
//  Created by Keith Leung on 2018-11-18.
//  Copyright © 2018 Keith Leung. All rights reserved.
//

import UIKit

class adjustmentSurveyQ6ViewController: UIViewController {

    static var prevWearingOffQ6: Int = adjustmentSurveyQ5ViewController.prevWearingOffQ5
    static var prevDyskinesiaQ6: Int = adjustmentSurveyQ5ViewController.prevDyskinesiaQ5
    
    override func viewDidLoad() {
        print("On adjustmentSurveyQ6...")
        print("Current wearing off: ", adjustmentSurveyQ1ViewController.globalWearingOff)
        print("Current dyskinesia: ", adjustmentSurveyQ1ViewController.globalDyskinesia)
        super.viewDidLoad()
        assignbackground()
    }
    
    @IBAction func yesClicked(_ sender: Any) {
        adjustmentSurveyQ6ViewController.prevDyskinesiaQ6 = adjustmentSurveyQ1ViewController.globalDyskinesia
        adjustmentSurveyQ6ViewController.prevWearingOffQ6 = adjustmentSurveyQ1ViewController.globalWearingOff
        adjustmentSurveyQ1ViewController.globalDyskinesia = adjustmentSurveyQ1ViewController.globalDyskinesia + 1
        adjustmentSurveyQ1ViewController.globalWearingOff = adjustmentSurveyQ1ViewController.globalWearingOff + 1
        performSegue(withIdentifier: "toadjustmentSurveyQ7", sender: self)
    }
    
    
    @IBAction func noClicked(_ sender: Any) {
        adjustmentSurveyQ6ViewController.prevDyskinesiaQ6 = adjustmentSurveyQ1ViewController.globalDyskinesia
        adjustmentSurveyQ6ViewController.prevWearingOffQ6 = adjustmentSurveyQ1ViewController.globalWearingOff
        adjustmentSurveyQ1ViewController.globalWearingOff = adjustmentSurveyQ1ViewController.globalWearingOff + 1
        performSegue(withIdentifier: "toadjustmentSurveyQ7", sender: self)
    }
    
    @IBAction func backClicked(_ sender: Any) {
        adjustmentSurveyQ1ViewController.globalWearingOff = adjustmentSurveyQ5ViewController.prevWearingOffQ5
        adjustmentSurveyQ1ViewController.globalDyskinesia = adjustmentSurveyQ5ViewController.prevDyskinesiaQ5
        performSegue(withIdentifier: "backToQ5", sender: self)
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
