//
//  adjustmentSurveyQ11ViewController.swift
//  AnchorApplication
//
//  Created by Keith Leung on 2018-11-18.
//  Copyright © 2018 Keith Leung. All rights reserved.
//

import UIKit

class adjustmentSurveyQ11ViewController: UIViewController {

    static var prevWearingOffQ11 : Int = adjustmentSurveyQ10ViewController.prevWearingOffQ10
    static var prevDyskinesiaQ11: Int = adjustmentSurveyQ10ViewController.prevDyskinesiaQ10
    
    override func viewDidLoad() {
        print("On adjustmentSurveyQ11")
        print("Current wearing off: ", adjustmentSurveyQ1ViewController.globalWearingOff)
        print("Current dyskinesia: ", adjustmentSurveyQ1ViewController.globalDyskinesia)
        super.viewDidLoad()
        assignbackground()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func answerClicked(_ sender: Any) {
        if adjustmentSurveyQ1ViewController.globalDyskinesia == adjustmentSurveyQ1ViewController.globalWearingOff && adjustmentSurveyQ1ViewController.globalWearingOff != 0 && adjustmentSurveyQ1ViewController.globalDyskinesia != 0{
            print("wearing off is same as dyskinesia")
            performSegue(withIdentifier: "toResultTwo", sender: self)
            
        }
        else if adjustmentSurveyQ1ViewController.globalDyskinesia < adjustmentSurveyQ1ViewController.globalWearingOff {
            print("dyskinesia less than wearing off")
            performSegue(withIdentifier: "toResultOne", sender: self)
        }
        else if adjustmentSurveyQ1ViewController.globalDyskinesia > adjustmentSurveyQ1ViewController.globalWearingOff {
            print("dyskinesia greater than wearing off")
            performSegue(withIdentifier: "toResultThree", sender: self)
            
        }
        else {
            print("No adjustments")
            performSegue(withIdentifier: "toResultFour", sender: self)
        }
    }
    
    @IBAction func backClicked(_ sender: Any) {
        adjustmentSurveyQ1ViewController.globalWearingOff = adjustmentSurveyQ10ViewController.prevWearingOffQ10
        adjustmentSurveyQ1ViewController.globalDyskinesia = adjustmentSurveyQ10ViewController.prevDyskinesiaQ10
        performSegue(withIdentifier: "backToQ10", sender: self)
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
