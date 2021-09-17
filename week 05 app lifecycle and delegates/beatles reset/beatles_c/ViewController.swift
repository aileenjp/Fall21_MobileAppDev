//
//  ViewController.swift
//  beatles_c
//
//  Created by Aileen Pierce
//  Copyright © 2019 Aileen Pierce. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var beatlesImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageControl: UISegmentedControl!
    @IBOutlet weak var fontSizeLabel: UILabel!
    @IBOutlet weak var capitalSwitch: UISwitch!
    @IBOutlet weak var fontSlider: UISlider!
    
    func updateImage(){
        if imageControl.selectedSegmentIndex == 0{
            titleLabel.text="Young Beatles"
            beatlesImage.image=UIImage(named: "beatles1")
        } else if imageControl.selectedSegmentIndex == 1{
            titleLabel.text="Not so young Beatles"
            beatlesImage.image=UIImage(named: "beatles2")
        }
    }
    
    func updateCaps(){
        if capitalSwitch.isOn {
            titleLabel.text = titleLabel.text?.uppercased()
        } else {
            titleLabel.text = titleLabel.text?.lowercased()
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
        let fontSize = sender.value
        fontSizeLabel.text=String(format: "%.0f", fontSize)
        let fontSizeCGFloat=CGFloat(fontSize)
        titleLabel.font=UIFont.systemFont(ofSize: fontSizeCGFloat)
    }
    
    func refreshUI(){
        titleLabel.text="The Beatles"
        imageControl.selectedSegmentIndex = -1
        capitalSwitch.isOn = false
        beatlesImage.image=UIImage(named: "Beatles_Abbey_Road")
        fontSlider.value = 16
        fontSizeLabel.text = "16"
        titleLabel.font=UIFont.systemFont(ofSize: CGFloat(16))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

