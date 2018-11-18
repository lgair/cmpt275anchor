//
//  ViewController.swift
//  IOS-Swift-CoreMotionAccelerometer
//
//  Created by Aigerim Omirbekova on 11/16/18.
//  Copyright © 2018 Aigerim Omirbekova. All rights reserved.
//

import UIKit
import CoreMotion
import CoreLocation
import MapKit

class ViewController: UIViewController , CLLocationManagerDelegate {
  
    @IBOutlet weak var xGyro: UILabel!
    @IBOutlet weak var yGyro: UILabel!
    @IBOutlet weak var zGyro: UILabel!

    @IBOutlet weak var XAccel: UILabel!
    @IBOutlet weak var yAccel: UILabel!
    @IBOutlet weak var zAccel: UILabel!
    
    var timer: Timer?
    var motion = CMMotionManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.myGyroscope()
        self.myAccelerometer()
        timer = Timer.scheduledTimer(withTimeInterval: 5.0, repeats: false, block: { (timer) in
            self.motion.stopGyroUpdates()
            self.motion.stopAccelerometerUpdates()
            print("Timer ended")
        })
        
    }

    
    func myGyroscope(){
        print("Start Gyroscope")
        motion.gyroUpdateInterval = 0.5
        motion.startGyroUpdates(to: OperationQueue.current!) {
            (data, error) in
            print(data as Any)
            if let trueData =  data {
                
                self.view.reloadInputViews()
                self.xGyro!.text = "x: \(trueData.rotationRate.x)"
                self.yGyro!.text = "y: \(trueData.rotationRate.y)"
                self.zGyro!.text = "z: \(trueData.rotationRate.z)"
            }
        }
        return
    }
    
    
    func myAccelerometer() {
        print("Start Accelerometer")
        motion.accelerometerUpdateInterval = 0.5
        motion.startAccelerometerUpdates(to: OperationQueue.current!) {
            (data, error) in
            print(data as Any)
            if let trueData =  data {
                
                self.view.reloadInputViews()
                self.XAccel!.text = "x: \(trueData.acceleration.x)"
                self.yAccel!.text = "y: \(trueData.acceleration.y)"
                self.zAccel!.text = "z: \(trueData.acceleration.z)"
            }
        }

        return
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

