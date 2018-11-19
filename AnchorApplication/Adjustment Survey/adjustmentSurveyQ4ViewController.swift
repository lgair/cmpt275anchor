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

    

}
