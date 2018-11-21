//
//  dataPointViewController.swift
//  AnchorApplication
//
//  Created by Keith Leung on 2018-11-15.
//  Copyright © 2018 Keith Leung. All rights reserved.
//
//  dataPointViewController.swift prompts the user to choose his/her levedopa formulation:
//  1) Immediate Release formulation
//  2) Controlled Release formulation
//  It then prompts the user to input the dosage his/her are currently taking for the chosen levodopa formulation.
//  Users who input a dosage per tablet value less than 0 or equal to 0 will be alerted by an alert controller.
//  The nextPageButton will not be enabled until a formulation and a dosage per tablet entry are recevied.


import UIKit

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

class dataPointViewController: UIViewController {

    @IBOutlet weak var dosageText: UILabel!
    
    @IBOutlet weak var mgPerTablet: UILabel!
    
    @IBOutlet weak var mgPerTabletInput: UITextField!
    
    @IBOutlet weak var immediateReleaseButton: shapedButton!
    
    @IBOutlet weak var controlledReleaseButton: shapedButton!
    
    @IBOutlet weak var nextPageButton: bounceButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        assignbackground()
        print("Data point View Loaded")
        // Hides dosage per tablet input prior to choosing a levodopa formulation
        dosageText.isHidden = true
        mgPerTablet.isHidden = true
        mgPerTabletInput.isHidden = true
        // Disable button to next page before formulation and dosage input are completed
        nextPageButton.isEnabled = false
        
        //Looks for single or multiple taps.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        
        //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
        //tap.cancelsTouchesInView = false
        
        view.addGestureRecognizer(tap)
        }
        
    
    
    
    @IBAction func immediateReleaseBtnClicked(_ sender: shapedButton) {
            print("Immediate release button clicked")
        
            controlledReleaseButton.borderColor = UIColor.lightGray
            immediateReleaseButton.borderColor = UIColor.green
        
            // Reveal dosage per tablet input once immediate release formulation is selected
            dosageText.isHidden = false
            mgPerTablet.isHidden = false
            mgPerTabletInput.isHidden = false
    }
    
    @IBAction func controlledReleaseBtnClicked(_ sender: shapedButton) {
        print("Controlled release button clicked")
        
        immediateReleaseButton.borderColor = UIColor.lightGray
        
        // Indicate the selected formulation by green border
        controlledReleaseButton.borderColor = UIColor.green
        
        // Reveal dosage per tablet input once controlled release formulation is selected
        dosageText.isHidden = false
        mgPerTablet.isHidden = false
        mgPerTabletInput.isHidden = false
    }
    
   
    @IBAction func textFieldEditingChanged(_ sender: Any) {
        // inputToInt converts UITextField mgPerTabletInput into an integer
        let inputToInt = Int(mgPerTabletInput.text!)
        
        // nextPageButton is disabled when there is no input to mgPerTabletInput
        if mgPerTabletInput.text == "" {
            nextPageButton.isEnabled = false
        }
        // An alert message is presented when the user inputs a dosage below 0 mg/tablet
        else if inputToInt! <= 0 {
            nextPageButton.isEnabled = false
            let alert = UIAlertController(title: "", message: "Levedopa dosage must not be under 0 mg/tablet.", preferredStyle: .alert)
            self.present(alert, animated: true, completion: nil)
            let when = DispatchTime.now() + 3
            DispatchQueue.main.asyncAfter(deadline: when){
                alert.dismiss(animated: true, completion: nil)
            }
        }
        
        else {
            nextPageButton.isEnabled = true
        }
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


        
    

        
    
   


