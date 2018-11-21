//
//  adjustmentSurveyQ9ViewController.swift
//  AnchorApplication
//
//  Created by Keith Leung on 2019-11-19.
//  Copyright © 2019 Keith Leung. All rights reserved.
//

import UIKit

class adjustmentSurveyQ9ViewController: UIViewController {
    
    var wearingOffQ9: Int = 0
    var dyskinesiaQ9: Int = 0

    

    override func viewDidLoad() {
        print("On adjustmentSurveyQ9...")
        super.viewDidLoad()
        assignbackground()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func yesClicked(_ sender: Any) {
        dyskinesiaQ9 = dyskinesiaQ9 + 1
        wearingOffQ9 = wearingOffQ9 + 1
        print("Current dyskinesia: ", dyskinesiaQ9)
        print("Current wearing off: ", wearingOffQ9)
        performSegue(withIdentifier: "toadjustmentSurveyQ10", sender: self)
    }
    
    
    @IBAction func noClicked(_ sender: Any) {
        wearingOffQ9 = wearingOffQ9 + 1
        print("Current dyskinesia: ", dyskinesiaQ9)
        print("Current wearing off: ", wearingOffQ9)
        performSegue(withIdentifier: "toadjustmentSurveyQ10", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! adjustmentSurveyQ10ViewController
        vc.dyskinesiaQ10 = self.dyskinesiaQ9
        vc.wearingOffQ10 = self.wearingOffQ9
        
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
