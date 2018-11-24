//
//  adjustmentSurveyQ3ViewController.swift
//  AnchorApplication
//
//  Created by Keith Leung on 2018-11-17.
//  Copyright © 2018 Keith Leung. All rights reserved.
//

import UIKit

class adjustmentSurveyQ3ViewController: UIViewController {
    
    static var prevWearingOffQ3: Int = adjustmentSurveyQ2ViewController.prevWearingOffQ2
    static var prevDyskinesiaQ3: Int = adjustmentSurveyQ2ViewController.prevDyskinesiaQ2
    

    override func viewDidLoad() {
        print("On adjustmentSurveyQ3...")
        //print("Previous wearing off: ", adjustmentSurveyQ3ViewController.prevWearingOffQ3)
        //print("Previous dyskinesia: ", adjustmentSurveyQ3ViewController.prevDyskinesiaQ3)
        print("Current wearing off: ", adjustmentSurveyQ1ViewController.globalWearingOff)
        print("Current dyskinesia: ", adjustmentSurveyQ1ViewController.globalDyskinesia)
        super.viewDidLoad()
        assignbackground()

        // Do any additional setup after loading the view.
    }


    @IBAction func yesClicked(_ sender: Any) {
        adjustmentSurveyQ3ViewController.prevDyskinesiaQ3 = adjustmentSurveyQ1ViewController.globalDyskinesia
        adjustmentSurveyQ3ViewController.prevWearingOffQ3 = adjustmentSurveyQ1ViewController.globalWearingOff
        adjustmentSurveyQ1ViewController.globalDyskinesia = adjustmentSurveyQ1ViewController.globalDyskinesia + 1
        adjustmentSurveyQ1ViewController.globalWearingOff = adjustmentSurveyQ1ViewController.globalWearingOff + 1
        performSegue(withIdentifier: "toadjustmentSurveyQ4", sender: self)
    }


    @IBAction func noClicked(_ sender: Any) {
      adjustmentSurveyQ3ViewController.prevDyskinesiaQ3 = adjustmentSurveyQ1ViewController.globalDyskinesia
      adjustmentSurveyQ3ViewController.prevWearingOffQ3 = adjustmentSurveyQ1ViewController.globalWearingOff
        adjustmentSurveyQ1ViewController.globalWearingOff = adjustmentSurveyQ1ViewController.globalWearingOff + 1
        print("Current dyskinesia: ", adjustmentSurveyQ1ViewController.globalDyskinesia)
        print("Current wearing off: ", adjustmentSurveyQ1ViewController.globalWearingOff)
        performSegue(withIdentifier: "toadjustmentSurveyQ4", sender: self)
    }

    @IBAction func backClicked(_ sender: Any) {
        adjustmentSurveyQ1ViewController.globalWearingOff = adjustmentSurveyQ2ViewController.prevWearingOffQ2
        adjustmentSurveyQ1ViewController.globalDyskinesia = adjustmentSurveyQ2ViewController.prevDyskinesiaQ2
        performSegue(withIdentifier: "backToQ2", sender: self)
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
