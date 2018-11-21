//
//  adjustmentSurveyQ5ViewController.swift
//  AnchorApplication
//
//  Created by Keith Leung on 2018-11-17.
//  Copyright © 2018 Keith Leung. All rights reserved.
//

import UIKit

class adjustmentSurveyQ5ViewController: UIViewController {
    
    var wearingOffQ5: Int = 0
    var dyskinesiaQ5: Int = 0

    override func viewDidLoad() {
        print("On adjustmentSurveyQ5...")
        super.viewDidLoad()
        assignbackground()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func yesClicked(_ sender: Any) {
        dyskinesiaQ5 = dyskinesiaQ5 + 1
        wearingOffQ5 = wearingOffQ5 + 1
        print("Current dyskinesia: ", dyskinesiaQ5)
        print("Current wearing off: ", wearingOffQ5)
        performSegue(withIdentifier: "toadjustmentSurveyQ6", sender: self)
    }
    
    
    @IBAction func noClicked(_ sender: Any) {
        wearingOffQ5 = wearingOffQ5 + 1
        print("Current dyskinesia: ", dyskinesiaQ5)
        print("Current wearing off: ", wearingOffQ5)
        performSegue(withIdentifier: "toadjustmentSurveyQ6", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! adjustmentSurveyQ6ViewController
        vc.dyskinesiaQ6 = self.dyskinesiaQ5
        vc.wearingOffQ6 = self.wearingOffQ5
        
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
