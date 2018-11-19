//
//  adjustmentSurveyQ10ViewController.swift
//  AnchorApplication
//
//  Created by Keith Leung on 2018-11-18.
//  Copyright © 2018 Keith Leung. All rights reserved.
//

import UIKit

class adjustmentSurveyQ10ViewController: UIViewController {
    
    var wearingOffQ10: Int = 0
    var dyskinesiaQ10: Int = 0

    override func viewDidLoad() {
        print("On adjustmentSurveyQ10...")
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func yesClicked(_ sender: Any) {
        dyskinesiaQ10 = dyskinesiaQ10 + 1
        wearingOffQ10 = wearingOffQ10 + 1
        print("Current dyskinesia: ", dyskinesiaQ10)
        print("Current wearing off: ", wearingOffQ10)
        performSegue(withIdentifier: "toadjustmentSurveyQ11", sender: self)
    }
    
    
    @IBAction func noClicked(_ sender: Any) {
        wearingOffQ10 = wearingOffQ10 + 1
        print("Current dyskinesia: ", dyskinesiaQ10)
        print("Current wearing off: ", wearingOffQ10)
        performSegue(withIdentifier: "toadjustmentSurveyQ11", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! adjustmentSurveyQ11ViewController
        vc.dyskinesiaQ11 = self.dyskinesiaQ10
        vc.wearingOffQ11 = self.wearingOffQ10
        
    }


}
