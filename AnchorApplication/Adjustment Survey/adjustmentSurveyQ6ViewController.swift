//
//  adjustmentSurveyQ6ViewController.swift
//  AnchorApplication
//
//  Created by Keith Leung on 2018-11-18.
//  Copyright © 2018 Keith Leung. All rights reserved.
//

import UIKit

class adjustmentSurveyQ6ViewController: UIViewController {

    var wearingOffQ6: Int = 0
    var dyskinesiaQ6: Int = 0
    
    override func viewDidLoad() {
        print("On adjustmentSurveyQ6...")
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func yesClicked(_ sender: Any) {
        dyskinesiaQ6 = dyskinesiaQ6 + 1
        wearingOffQ6 = wearingOffQ6 + 1
        print("Current dyskinesia: ", dyskinesiaQ6)
        print("Current wearing off: ", wearingOffQ6)
        performSegue(withIdentifier: "toadjustmentSurveyQ7", sender: self)
    }
    
    
    @IBAction func noClicked(_ sender: Any) {
        wearingOffQ6 = wearingOffQ6 + 1
        print("Current dyskinesia: ", dyskinesiaQ6)
        print("Current wearing off: ", wearingOffQ6)
        performSegue(withIdentifier: "toadjustmentSurveyQ7", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! adjustmentSurveyQ7ViewController
        vc.dyskinesiaQ7 = self.dyskinesiaQ6
        vc.wearingOffQ7 = self.wearingOffQ6
        
    }


}
