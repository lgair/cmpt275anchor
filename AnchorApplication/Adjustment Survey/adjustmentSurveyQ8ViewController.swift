//
//  adjustmentSurveyQ8ViewController.swift
//  AnchorApplication
//
//  Created by Keith Leung on 2018-11-18.
//  Copyright © 2018 Keith Leung. All rights reserved.
//

import UIKit

class adjustmentSurveyQ8ViewController: UIViewController {

    var wearingOffQ8: Int = 0
    var dyskinesiaQ8: Int = 0
    
    override func viewDidLoad() {
        print("On adjustmentSurveyQ8...")
        super.viewDidLoad()
        assignbackground()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func yesClicked(_ sender: Any) {
        dyskinesiaQ8 = dyskinesiaQ8 + 1
        wearingOffQ8 = wearingOffQ8 + 1
        print("Current dyskinesia: ", dyskinesiaQ8)
        print("Current wearing off: ", wearingOffQ8)
        performSegue(withIdentifier: "toadjustmentSurveyQ9", sender: self)
    }
    
    
    @IBAction func noClicked(_ sender: Any) {
        wearingOffQ8 = wearingOffQ8 + 1
        print("Current dyskinesia: ", dyskinesiaQ8)
        print("Current wearing off: ", wearingOffQ8)
        performSegue(withIdentifier: "toadjustmentSurveyQ9", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! adjustmentSurveyQ9ViewController
        vc.dyskinesiaQ9 = self.dyskinesiaQ8
        vc.wearingOffQ9 = self.wearingOffQ8
        
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
