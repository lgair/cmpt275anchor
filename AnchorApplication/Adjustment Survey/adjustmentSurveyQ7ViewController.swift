//
//  adjustmentSurveyQ7ViewController.swift
//  AnchorApplication
//
//  Created by Keith Leung on 2018-11-18.
//  Copyright © 2018 Keith Leung. All rights reserved.
//

import UIKit

class adjustmentSurveyQ7ViewController: UIViewController {

    var wearingOffQ7: Int = 0
    var dyskinesiaQ7: Int = 0
    
    override func viewDidLoad() {
        print("On adjustmentSurveyQ7...")
        super.viewDidLoad()
        assignbackground()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func yesClicked(_ sender: Any) {
        dyskinesiaQ7 = dyskinesiaQ7 + 1
        wearingOffQ7 = wearingOffQ7 + 1
        print("Current dyskinesia: ", dyskinesiaQ7)
        print("Current wearing off: ", wearingOffQ7)
        performSegue(withIdentifier: "toadjustmentSurveyQ8", sender: self)
    }
    
    
    @IBAction func noClicked(_ sender: Any) {
        wearingOffQ7 = wearingOffQ7 + 1
        print("Current dyskinesia: ", dyskinesiaQ7)
        print("Current wearing off: ", wearingOffQ7)
        performSegue(withIdentifier: "toadjustmentSurveyQ8", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! adjustmentSurveyQ8ViewController
        vc.dyskinesiaQ8 = self.dyskinesiaQ7
        vc.wearingOffQ8 = self.wearingOffQ7
        
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
