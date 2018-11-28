//
//  adjustmentSurveyQ1ViewController.swift
//  AnchorApplication
//
//  Created by Keith Leung on 2018-11-17.
//  Copyright © 2018 Keith Leung. All rights reserved.
//

import UIKit

class adjustmentSurveyQ1ViewController: UIViewController {
    
    
        static var globalWearingOff: Int = 0
        static var globalDyskinesia: Int = 0
    
    static var prevWearingOffQ1: Int = 0
    static var prevDyskinesiaQ1: Int = 0
    

    override func viewDidLoad() {
        print("On adjustmentSurveyQ1...")
        super.viewDidLoad()
        //print("Previous wearing off: ", 0)
        //print("Previous dyskinesia: ", 0)
        print("Current wearing off: ", adjustmentSurveyQ1ViewController.globalWearingOff)
        print("Current dyskinesia: ", adjustmentSurveyQ1ViewController.globalDyskinesia)
        assignbackground()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func yesClicked(_ sender: Any) {
        adjustmentSurveyQ1ViewController.prevDyskinesiaQ1 = adjustmentSurveyQ1ViewController.globalDyskinesia
        adjustmentSurveyQ1ViewController.prevWearingOffQ1 = adjustmentSurveyQ1ViewController.globalWearingOff
        adjustmentSurveyQ1ViewController.globalWearingOff = adjustmentSurveyQ1ViewController.globalWearingOff + 1
        performSegue(withIdentifier: "toadjustmentSurveyQ2", sender: self)
    }
    
    
    
    //override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //let vc = segue.destination as! adjustmentSurveyQ2ViewController
    //}
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
