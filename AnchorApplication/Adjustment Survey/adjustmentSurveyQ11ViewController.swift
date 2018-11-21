//
//  adjustmentSurveyQ11ViewController.swift
//  AnchorApplication
//
//  Created by Keith Leung on 2018-11-18.
//  Copyright © 2018 Keith Leung. All rights reserved.
//

import UIKit

class adjustmentSurveyQ11ViewController: UIViewController {

    var wearingOffQ11: Int = 0
    var dyskinesiaQ11: Int = 0
    
    override func viewDidLoad() {
        print("On adjustmentSurveyQ11")
        super.viewDidLoad()
        assignbackground()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func answerClicked(_ sender: Any) {
        if wearingOffQ11 == dyskinesiaQ11 && wearingOffQ11 != 0 && dyskinesiaQ11 != 0{
            print("wearing off is same as dyskinesia")
            performSegue(withIdentifier: "toResultTwo", sender: self)
            
        }
        else if dyskinesiaQ11 < wearingOffQ11 {
            print("dyskinesia less than wearing off")
            performSegue(withIdentifier: "toResultOne", sender: self)
        }
        else if dyskinesiaQ11 > wearingOffQ11 {
            print("dyskinesia greater than wearing off")
            performSegue(withIdentifier: "toResultThree", sender: self)
            
        }
        else {
            print("No adjustments")
            performSegue(withIdentifier: "toResultFour", sender: self)
        }
    }
    //This function sets the background image
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
