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
import FirebaseDatabase

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
    
    // Indicate which button has been pressed (immediate or controlledrelease
    var button: Int = 0
    
    // initialize dosage variable
    var currentDosage: Int = 0
    
    // declare reference variable for firebase realtime database
    var ref: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // create instance for database
        ref = Database.database().reference()
        
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
        
        // perform the button action to wrtie to database
        //self.nextPageBtnClicked(sender: nextPageButton)
        
    }
    
    //self.nextPageBtnClicked(nextPageButton)
    
    @IBAction func immediateReleaseBtnClicked(_ sender: shapedButton) {
        print("Immediate release button clicked")
        
        controlledReleaseButton.borderColor = UIColor.lightGray
        immediateReleaseButton.borderColor = UIColor.green
        
        // Set a value for firebase to take in
        button = 1
        
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
        
        //Set a value for firebase to take in
        button = 2
        
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
            currentDosage = inputToInt!
            nextPageButton.isEnabled = true
        }
    }
    
    // writing to database when button is clicked
    @IBAction func nextPressed(_ sender: bounceButton) {
        // set the current date to use as key for database
        let currentDate = Date()
        // format Date() as to only include the date and not time
        let formatter = DateFormatter()
        //****use "yyyy-MM-dd" for actual, use "yyyy-MM-dd HH:mm:ss" to test multiple data
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        // note that it is now string, to compare dates later convert back to date()
        var dateString = formatter.string(from: currentDate)
        //*****check date ->print("current date ", dateString)
        
        // dictionary with currentDosage, button as its values
        let values = ["dosage": currentDosage, "type": button]
        
        // child reference to sort by date
        let timeRef = ref.child("progress").child(dateString)
        // write to database using current date as key
        timeRef.updateChildValues(values, withCompletionBlock: { (err, ref) in
            // check if error while writing
            if err != nil {
                print(err)
                return
            }
            print("saved successfully into firebasedb")
        })
    }
    
}
