//
//  ViewController.swift
//  JoyStick_Swift
//
//  Created by harvey on 16/6/12.
//  Copyright © 2016年 harvey. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

   
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        
        let joystick = mJoyStick(frame:CGRectMake(100,100,180,180))
        joystick.delegate = self
        self.view.addSubview(joystick)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
   
    }
}

extension ViewController:JoyStickDelegate{

    
    func joyStickValueChange(location: CGPoint) {
        
        print(location)
    }


}