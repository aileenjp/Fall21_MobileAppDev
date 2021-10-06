//
//  ViewController.swift
//  animation
//
//  Created by Aileen Pierce
//  Copyright Aileen Pierce. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var sliderLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var delta = CGPoint(x: 12, y: 4) //initialize the delta to move 12 points horizontally, 4 points vertically
    var ballRadius = CGFloat() //radius of the ball image
    var ballTimer = Timer() //animation timer
    
    //var translation = CGPoint(x: 0.0, y: 0.0) //specifies how many points the image will move
    //var angle: CGFloat=0.0 //angle for rotation
    
    //changes the position of the image view
    func moveImage(){
        let newCenter = CGPoint(x: imageView.center.x + delta.x, y: imageView.center.y + delta.y)
        imageView.center = newCenter
        
        //Animation
        let duration = Double(slider.value)
        let animator = UIViewPropertyAnimator(duration: duration, curve: .linear,
                                              animations:{self.imageView.center=newCenter}
                                              )
        animator.startAnimation()
        
        //Animation
        // {self.imageView.center=newCenter}
        
        
        //Translation
        //        {self.imageView.transform=CGAffineTransform(translationX: self.translation.x, y: self.translation.y)
        //            self.translation.x += self.delta.x
        //            self.translation.y += self.delta.y
        //        }
        
        
        //Rotation
//       {self.imageView.transform=CGAffineTransform(rotationAngle: self.angle)
//            self.imageView.center=CGPoint(x: self.imageView.center.x + self.delta.x, y: self.imageView.center.y + self.delta.y)
//            }
        
        
        //Scaling
//      {self.imageView.transform=CGAffineTransform(scaleX: self.angle, y: self.angle)
//      self.imageView.center=CGPoint(x: self.imageView.center.x + self.delta.x, y: self.imageView.center.y + self.delta.y)
//      }
        
        
        
        //Movement

        //Animation
        if imageView.center.x > view.bounds.size.width-ballRadius || imageView.center.x < ballRadius {
            delta.x = -delta.x
        }
        if imageView.center.y > view.bounds.size.height-ballRadius || imageView.center.y < ballRadius {
            delta.y = -delta.y
        }
        
        //Translation
//        if imageView.center.x + translation.x > view.bounds.size.width-ballRadius || imageView.center.x + translation.x < ballRadius {
//            delta.x = -delta.x
//        }
//        if imageView.center.y + translation.y > view.bounds.size.height-ballRadius || imageView.center.y + translation.y < ballRadius {
//            delta.y = -delta.y
//        }
        
        
        //Rotation
//        if imageView.center.x + translation.x > view.bounds.size.width-ballRadius || imageView.center.x + translation.x < ballRadius {
//            delta.x = -delta.x
//        }
//        if imageView.center.y + translation.y > view.bounds.size.height-ballRadius || imageView.center.y + translation.y < ballRadius {
//            delta.y = -delta.y
//        }
//        angle += 0.02 //amount by which you increment the angle
//        //if it's a full rotation reset the angle
//        if angle > .pi {
//            angle=0
//        }
        
    }
    
    //updates the timer and label with the current slider value
    func changeSliderValue() {
        sliderLabel.text = String(format: "%.2f", slider.value)
        ballTimer = Timer.scheduledTimer(withTimeInterval: Double(slider.value), repeats: true, block: {timer in self.moveImage()})
    }

    @IBAction func sliderMoved(_ sender: UISlider) {
        ballTimer.invalidate() //stops the timer
        changeSliderValue()
    }
    
    override func viewDidLoad() {
        //ball radius is half the width of the image
        ballRadius=imageView.frame.size.width/2
        //set the starting position for the image view
        imageView.center.x = view.bounds.size.width/2
        imageView.center.y = view.bounds.size.height/2
        changeSliderValue()
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

