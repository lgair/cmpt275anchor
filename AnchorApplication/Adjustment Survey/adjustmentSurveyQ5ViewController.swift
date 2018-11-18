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


}
