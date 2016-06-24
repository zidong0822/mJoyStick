//
//  mJoyStick.swift
//  JoyStick_Swift
//
//  Created by harvey on 16/6/23.
//  Copyright © 2016年 harvey. All rights reserved.
//

import UIKit

class mJoyStick: UIView {

    var handleImageView:UIImageView!
    var delegate:JoyStickDelegate!
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        self.backgroundColor = UIColor(patternImage:UIImage(named:"stick_bg")!)
        
        
        let handleImage = UIImage(named:"stick")
        
        handleImageView = UIImageView(frame:CGRectMake(self.bounds.size.width*0.5-handleImage!.size.width*0.5,
            self.bounds.size.height*0.5-handleImage!.size.height*0.5,
            handleImage!.size.width,
            handleImage!.size.height))
        handleImageView.image = handleImage
        self.addSubview(handleImageView)
   
        
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        let aTouch: UITouch = touches.first! as UITouch
        let location = aTouch.locationInView(self)
       
        handlePositionWithLocation(location)
        
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
     
        let aTouch: UITouch = touches.first! as UITouch
        let location = aTouch.locationInView(self)
        resetHandle()
        rockerValueChanged(location)
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
     
        let aTouch: UITouch = touches.first! as UITouch
        
        let location = aTouch.locationInView(self)
  
        handlePositionWithLocation(location)
        
        rockerValueChanged(location)
        
        
        
        
    }
    
    override func touchesCancelled(touches: Set<UITouch>?, withEvent event: UIEvent?) {
        
        let aTouch: UITouch = touches!.first! as UITouch
        let location = aTouch.locationInView(self)
        resetHandle()
        rockerValueChanged(location)
    }
    

    func handlePositionWithLocation(location:CGPoint){
    
        
        let xx = location.x >= 0 ? location.x : 0
        let xxx = xx >= 180 ? 90 : xx/2
        let yy = location.y >= 0 ? location.y : 0
        let yyy = yy >= 180 ? 90 : yy/2
        
        handleImageView.frame.origin = CGPointMake(xxx,yyy)
    
    
    }
    
    
    func resetHandle(){
    
        let handleImage = UIImage(named:"stick")
        var handleImageFrame = handleImageView.frame
        handleImageFrame.origin = CGPointMake(self.bounds.size.width*0.5-handleImage!.size.width*0.5,
                                              self.bounds.size.height*0.5-handleImage!.size.height*0.5)
        handleImageView.frame = handleImageFrame
        
    }
    
    
    func rockerValueChanged(location:CGPoint){
    
        var x:CGFloat = 0
        var y:CGFloat = 0
       
        if(location.x<=90){
            
            x = 90 - (location.x)>90 ? -90:-(90 - (location.x))
            
        }else{
            
            x = (location.x) - 90>90 ? 90:(location.x) - 90
            
        }
        if(location.y<=90){
            
            y = 90 - (location.y)>90 ? 90:90 - (location.y)
            
        }else{
            
            y = (location.y) - 90>90 ? -90:-((location.y) - 90)
            
        }
        
        delegate.joyStickValueChange(CGPointMake(x,y))
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
protocol JoyStickDelegate {
    
    func joyStickValueChange(location:CGPoint)
    
}
