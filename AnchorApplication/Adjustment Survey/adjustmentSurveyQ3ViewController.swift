//
//  adjustmentSurveyQ3ViewController.swift
//  AnchorApplication
//
//  Created by Keith Leung on 2018-11-17.
//  Copyright © 2018 Keith Leung. All rights reserved.
//

import UIKit

class adjustmentSurveyQ3ViewController: UIViewController {
    
    var wearingOffQ3: Int = 0
    var dyskinesiaQ3: Int = 0

    override func viewDidLoad() {
        print("On adjustmentSurveyQ3...")
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func yesClicked(_ sender: Any) {
        dyskinesiaQ3 = dyskinesiaQ3 + 1
        wearingOffQ3 = wearingOffQ3 + 1
        print("Current dyskinesia: ", dyskinesiaQ3)
        print("Current wearing off: ", wearingOffQ3)
        performSegue(withIdentifier: "toadjustmentSurveyQ4", sender: self)
    }
    
    
    @IBAction func noClicked(_ sender: Any) {
        wearingOffQ3 = wearingOffQ3 + 1
        print("Current dyskinesia: ", dyskinesiaQ3)
        print("Current wearing off: ", wearingOffQ3)
        performSegue(withIdentifier: "toadjustmentSurveyQ4", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! adjustmentSurveyQ4ViewController
        vc.dyskinesiaQ4 = self.dyskinesiaQ3
        vc.wearingOffQ4 = self.wearingOffQ3
        
    }

}
