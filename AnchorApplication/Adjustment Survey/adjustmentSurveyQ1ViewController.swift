//
//  adjustmentSurveyQ1ViewController.swift
//  AnchorApplication
//
//  Created by Keith Leung on 2018-11-17.
//  Copyright © 2018 Keith Leung. All rights reserved.
//

import UIKit

class adjustmentSurveyQ1ViewController: UIViewController {
    
    var wearingOffQ1 : Int = 0
    
    

    override func viewDidLoad() {
        print("On adjustmentSurveyQ1...")
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func yesClicked(_ sender: Any) {
        wearingOffQ1 = wearingOffQ1 + 1
        print("Current wearing off: ", wearingOffQ1)
        performSegue(withIdentifier: "toadjustmentSurveyQ2", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! adjustmentSurveyQ2ViewController
        vc.wearingOffQ2 = self.wearingOffQ1
        
    }

}
