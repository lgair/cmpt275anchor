//
//  ViewController.swift
//  IOS-Swift-CoreMotionAccelerometer
//
//  Created by Aigerim Omirbekova on 11/16/18.
//  Copyright © 2018 Aigerim Omirbekova. All rights reserved.
//

import UIKit
import CoreMotion

class deviceMotionViewController: UIViewController {
    
    
    // Timer for device motion runtime
    var timer: Timer?
    var timer2: Timer?
    var timer3: Timer?
    var motionManager = CMMotionManager()
    // Acceleration data array of type Double
    var accDataSamples = [Double]()
    // Rotation rate data array of type Double
    var rotDataSamples = [Double]()
    // Sampling started indicator
    var samplingStarted = false
    
    
    
    @IBOutlet weak var startButton: shapedButton!
    @IBOutlet weak var processInfo: UILabel!
    @IBOutlet weak var processImage: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        processImage.isHidden = true
        processInfo.isHidden = true
        
    }
    
    @IBAction func startClicked(_ sender: Any) {
        startButton.isEnabled = false
        startButton.borderColor = UIColor.gray
        startButton.setTitleColor(UIColor.gray, for: .normal)
        startButton.setTitle("Assessment started", for: .normal)
        processImage.isHidden = false
        processInfo.isHidden = false
        
        // Start blinking animation of processImage
        UIImageView.animate(withDuration: 1, delay: 0.0, options: [.curveLinear, .repeat, .autoreverse], animations: {self.processImage.alpha = 0.0}, completion: nil)
        startMotionManager()
        
        // Device motion data collection runtime of 10 seconds
        timer = Timer.scheduledTimer(withTimeInterval: 10.0, repeats: false, block: { (timer) in
            self.stopMotionManager()
            
            // Summing elements of device motion arrays
            let sumAcc = self.accDataSamples.reduce(0,+)
            let sumRot = self.rotDataSamples.reduce(0,+)
            print("Sum of rotDataSamples: ", sumRot)
            print("Sum of accDataSamples: ", sumAcc)
            
            // Counting number of elements in device motion arrays
            let accCount = self.accDataSamples.count
            let rotCount = self.rotDataSamples.count
            print("accData count: ", accCount)
            print("rotData count: ", rotCount)
            
            // Computing absolute average of device motion arrays
            let avgAcc = abs(Float(sumAcc) / Float(accCount))
            let avgRot = abs(Float(sumRot) / Float(rotCount))
            print("Absolute average user acceleration: ", avgAcc)
            print("Absolute average rotation rate: ", avgRot)
            
            
            print("Timer ended.")
            
            // Data collection complete indicator
            self.processImage.alpha = 1.0
            self.processImage.image = UIImage(named: "greenCheck")
            self.processInfo.text = "Data collection complete!"
            self.processInfo.textAlignment = .center
            
            // Delay analysis by 5 seconds
            self.timer2 = Timer.scheduledTimer(withTimeInterval: 5.0, repeats: false, block: { (timer2) in
                self.processImage.alpha = 0.0
                self.processImage.image = UIImage(named: "analyze")
                self.processInfo.text = "Analyzing data..."
                self.processInfo.textAlignment = .center
                
                // Delay assessment results output by 5 seconds
                self.timer3 = Timer.scheduledTimer(withTimeInterval: 5.0, repeats: false, block: { (timer3) in
                    // Condition: absolute average of user accleration is greater than rotation rate
                    if avgAcc > avgRot {
                        adjustmentSurveyQ1ViewController.globalDyskinesia = adjustmentSurveyQ1ViewController.globalDyskinesia + 1
                        self.processImage.isHidden = true
                        self.processInfo.isHidden = true
                        let alert = UIAlertController(title: "Assessment Result", message: "Predominant problem is dyskinesia", preferredStyle: .alert)
                        let toSurvey = UIAlertAction(title: "Continue to survey", style: .default, handler: { _ in
                            self.performSegue(withIdentifier: "toQ1", sender: nil)
                        })
                        alert.addAction(toSurvey)
                        self.present(alert, animated: true, completion: nil)
                    }
                    // Condition: absolute averae rotation rate is greater than user acceleration
                    else {
                        adjustmentSurveyQ1ViewController.globalWearingOff = adjustmentSurveyQ1ViewController.globalWearingOff + 1
                        self.processImage.isHidden = true
                        self.processInfo.isHidden = true
                        let alert = UIAlertController(title: "Assessment Result", message: "Predominant problem is end-of-dose \"wearing off\"", preferredStyle: .alert)
                        let toSurvey = UIAlertAction(title: "Continue to survey", style: .default, handler: { _ in
                            self.performSegue(withIdentifier: "toQ1", sender: nil)
                        })
                        alert.addAction(toSurvey)
                        self.present(alert, animated: true, completion: nil)
                    }
                })
            })
            
            
        })
        
        
        
        
        
    }
    
    func collectDataSamples(motion: CMDeviceMotion!, error: NSError!) {
        if (error != nil) {
            print(error)
        }
        
        let acceleration: CMAcceleration = motion.userAcceleration
        let rotation: CMRotationRate = motion.rotationRate
        
        let accY = acceleration.y
        let rotY = rotation.y
        
        accDataSamples.append(accY)
        rotDataSamples.append(rotY)
    }
    
    func startMotionManager() {
        if motionManager.isAccelerometerAvailable {
            print("Accelerometer is available.")
            samplingStarted = true
            motionManager.startDeviceMotionUpdates(to: OperationQueue.current!) { (motion, error) in
                self.collectDataSamples(motion: motion, error: error! as NSError)
                print("Collecting Device Motion data...")
            }
        }
        else {
            print("Accelerometer is not available.")
        }
    }
    
    func stopMotionManager() {
        samplingStarted = false
        motionManager.stopDeviceMotionUpdates()
        print("Device Motion data collection has stopped.")
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
}
