//
//  adjustmentSurveyQ2ViewController.swift
//  AnchorApplication
//
//  Created by Keith Leung on 2018-11-17.
//  Copyright © 2018 Keith Leung. All rights reserved.
//

import UIKit

class adjustmentSurveyQ2ViewController: UIViewController {
    
    var wearingOffQ2: Int = 0
    var dyskinesiaQ2: Int = 0
    

    override func viewDidLoad() {
        print("On adjustmentSurveyQ2...")
        print("Current wearing off: ", wearingOffQ2)
        print("Current dyskinesia: ", dyskinesiaQ2)
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func yesClicked(_ sender: Any) {
        dyskinesiaQ2 = dyskinesiaQ2 + 1
        print("Current dyskinesia: ", dyskinesiaQ2)
        print("Current wearing off: ", wearingOffQ2)
        performSegue(withIdentifier: "toadjustmentSurveyQ3", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! adjustmentSurveyQ3ViewController
        vc.dyskinesiaQ3 = self.dyskinesiaQ2
        vc.wearingOffQ3 = self.wearingOffQ2
    }
    
   

}
