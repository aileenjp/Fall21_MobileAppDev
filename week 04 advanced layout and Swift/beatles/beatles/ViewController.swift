//
//  ViewController.swift
//  beatles
//
//  Created by Aileen Pierce
//  Copyright (c) Aileen Pierce. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var beatlesImage: UIImageView!
    @IBOutlet weak var imageControl: UISegmentedControl!
    @IBOutlet weak var capitalSwitch: UISwitch!
    @IBOutlet weak var fontSizeLabel: UILabel!
    
    func updateImage(){
        if imageControl.selectedSegmentIndex == 0 {
            titleLabel.text="Young Beatles"
            beatlesImage.image=UIImage(named: "beatles1")
        }
        else if imageControl.selectedSegmentIndex == 1 {
            titleLabel.text="Not so young Beatles"
            beatlesImage.image=UIImage(named: "beatles2")
        }
    }
    
    func updateCaps(){
        if capitalSwitch.isOn {
            titleLabel.text=titleLabel.text?.uppercased()
        } else {
            titleLabel.text=titleLabel.text?.lowercased()
        }
    }
    @IBAction func changeInfo(_ sender: UISegmentedControl) {
        updateImage()
        updateCaps()
    }
    
    @IBAction func updateFont(_ sender: UISwitch) {
        updateCaps()
    }
    
    @IBAction func changeFontSize(_ sender: UISlider) {
        let fontSize=sender.value //float
        fontSizeLabel.text=String(format: "%.0f", fontSize) //create a String from the float value
        let fontSizeCGFloat=CGFloat(fontSize) //create a CGFloat from a float
        titleLabel.font=UIFont.systemFont(ofSize: fontSizeCGFloat) //create a UIFont object and assign to the font property
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

