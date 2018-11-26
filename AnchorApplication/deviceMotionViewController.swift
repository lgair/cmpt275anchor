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
  
//    @IBOutlet weak var xGyro: UILabel!
//    @IBOutlet weak var yGyro: UILabel!
//    @IBOutlet weak var zGyro: UILabel!
//
//    @IBOutlet weak var XAccel: UILabel!
//    @IBOutlet weak var yAccel: UILabel!
//    @IBOutlet weak var zAccel: UILabel!
    
    
    // Timer for device motion runtime
    var timer: Timer?
    var motionManager = CMMotionManager()
    // Acceleration data array of type Double
    var accDataSamples = [Double]()
    // Rotation rate data array of type Double
    var rotDataSamples = [Double]()
    // Sampling started indicator
    var samplingStarted = false
    
    
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var processIndicator: UIActivityIndicatorView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        }
    
    @IBAction func startClicked(_ sender: Any) {
        startButton.setTitle("Collecting data...", for: .normal)
        startButton.isEnabled = false
        processIndicator.startAnimating()
        startMotionManager()
        timer = Timer.scheduledTimer(withTimeInterval: 5.0, repeats: false, block: { (timer) in
            self.stopMotionManager()
            self.processIndicator.stopAnimating()
            print("Timer ended.")
        })
        
        // Output accDataSamples array data
        print("User acceleration data:")
        dump(accDataSamples)
        
        // Output rotDataSamples array data
        print("Rotational rate data:")
        dump(rotDataSamples)
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
    
    
//    func myGyroscope(){
//        print("Start Gyroscope")
//        motion.gyroUpdateInterval = 0.5
//        motion.startGyroUpdates(to: OperationQueue.current!) {
//            (data, error) in
//            print(data as Any)
//            if let trueData =  data {
//
//                self.view.reloadInputViews()
//                self.xGyro!.text = "x: \(trueData.rotationRate.x)"
//                self.yGyro!.text = "y: \(trueData.rotationRate.y)"
//                self.zGyro!.text = "z: \(trueData.rotationRate.z)"
//            }
//        }
//        return
//    }
//
//
//    func myAccelerometer() {
//        print("Start Accelerometer")
//        motion.accelerometerUpdateInterval = 0.5
//        motion.startAccelerometerUpdates(to: OperationQueue.current!) {
//            (data, error) in
//            print(data as Any)
//            if let trueData =  data {
//
//                self.view.reloadInputViews()
//                self.XAccel!.text = "x: \(trueData.acceleration.x)"
//                self.yAccel!.text = "y: \(trueData.acceleration.y)"
//                self.zAccel!.text = "z: \(trueData.acceleration.z)"
//            }
//        }
//
//        return
//    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }




}
