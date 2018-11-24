//
//  adjustmentSurveyQ9ViewController.swift
//  AnchorApplication
//
//  Created by Keith Leung on 2019-11-19.
//  Copyright © 2019 Keith Leung. All rights reserved.
//

import UIKit

class adjustmentSurveyQ9ViewController: UIViewController {
    
    static var prevWearingOffQ9: Int = adjustmentSurveyQ8ViewController.prevWearingOffQ8
    static var prevDyskinesiaQ9: Int = adjustmentSurveyQ8ViewController.prevDyskinesiaQ8
    
    override func viewDidLoad() {
        print("On adjustmentSurveyQ9...")
        print("Current wearing off: ", adjustmentSurveyQ1ViewController.globalWearingOff)
        print("Current dyskinesia: ", adjustmentSurveyQ1ViewController.globalDyskinesia)
        super.viewDidLoad()
        assignbackground()
        
    }
    
    @IBAction func yesClicked(_ sender: Any) {
        adjustmentSurveyQ9ViewController.prevDyskinesiaQ9 = adjustmentSurveyQ1ViewController.globalDyskinesia
        adjustmentSurveyQ9ViewController.prevWearingOffQ9 = adjustmentSurveyQ1ViewController.globalWearingOff
        adjustmentSurveyQ1ViewController.globalDyskinesia = adjustmentSurveyQ1ViewController.globalDyskinesia + 1
        adjustmentSurveyQ1ViewController.globalWearingOff = adjustmentSurveyQ1ViewController.globalWearingOff + 1
        performSegue(withIdentifier: "toadjustmentSurveyQ10", sender: self)
    }
    
    
    @IBAction func noClicked(_ sender: Any) {
        adjustmentSurveyQ9ViewController.prevDyskinesiaQ9 = adjustmentSurveyQ1ViewController.globalDyskinesia
        adjustmentSurveyQ9ViewController.prevWearingOffQ9 = adjustmentSurveyQ1ViewController.globalWearingOff
        adjustmentSurveyQ1ViewController.globalWearingOff = adjustmentSurveyQ1ViewController.globalWearingOff + 1
        performSegue(withIdentifier: "toadjustmentSurveyQ10", sender: self)
    }
    
    @IBAction func backClicked(_ sender: Any) {
        adjustmentSurveyQ1ViewController.globalWearingOff = adjustmentSurveyQ8ViewController.prevWearingOffQ8
        adjustmentSurveyQ1ViewController.globalDyskinesia = adjustmentSurveyQ8ViewController.prevDyskinesiaQ8
        performSegue(withIdentifier: "backToQ8", sender: self)
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
