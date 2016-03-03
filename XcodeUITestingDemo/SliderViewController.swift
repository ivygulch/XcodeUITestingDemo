//
//  SliderViewController.swift
//  XcodeUITestingDemo
//
//  Created by Douglas Sjoquist on 3/3/16.
//  Copyright © 2016 Ivy Gulch LLC. All rights reserved.
//

import UIKit

class SliderViewController: UIViewController {

    @IBOutlet var slider:UISlider!
    @IBOutlet var valueLabel:UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.value = 50

        updateValueLabel()
    }

    @IBAction func sliderAction(sender:UISlider) {
        updateValueLabel()
    }

    func updateValueLabel() {
        let iValue = Int(slider.value)
        valueLabel.text = "Value=\(iValue)"
    }
}

