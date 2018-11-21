//
//  adjustmentSurveyQ4ViewController.swift
//  AnchorApplication
//
//  Created by Keith Leung on 2018-11-17.
//  Copyright © 2018 Keith Leung. All rights reserved.
//

import UIKit

class adjustmentSurveyQ4ViewController: UIViewController {
    
    var wearingOffQ4: Int = 0
    var dyskinesiaQ4: Int = 0
    
    override func viewDidLoad() {
        print("On adjustmentSurveyQ4...")
        super.viewDidLoad()
        assignbackground()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func yesClicked(_ sender: Any) {
        dyskinesiaQ4 = dyskinesiaQ4 + 1
        wearingOffQ4 = wearingOffQ4 + 1
        print("Current dyskinesia: ", dyskinesiaQ4)
        print("Current wearing off: ", wearingOffQ4)
        performSegue(withIdentifier: "toadjustmentSurveyQ5", sender: self)
    }
    
    
    @IBAction func noClicked(_ sender: Any) {
        wearingOffQ4 = wearingOffQ4 + 1
        print("Current dyskinesia: ", dyskinesiaQ4)
        print("Current wearing off: ", wearingOffQ4)
        performSegue(withIdentifier: "toadjustmentSurveyQ5", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! adjustmentSurveyQ5ViewController
        vc.dyskinesiaQ5 = self.dyskinesiaQ4
        vc.wearingOffQ5 = self.wearingOffQ4
        
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
