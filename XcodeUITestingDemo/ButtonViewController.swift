//
//  ButtonViewController.swift
//  XcodeUITestingDemo
//
//  Created by Douglas Sjoquist on 3/3/16.
//  Copyright © 2016 Ivy Gulch LLC. All rights reserved.
//

import UIKit

class ButtonViewController: UIViewController {

    var value = 0 {
        didSet {
            updateValueLabel()
        }
    }
    @IBOutlet var valueLabel:UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        updateValueLabel()
    }

    @IBAction func incrementAction(button:UIButton) {
        if (value < 10) {
            value += 1
        }
    }

    @IBAction func decrementAction(button:UIButton) {
        if (value > 0) {
            value -= 1
        }
    }

    func updateValueLabel() {
        valueLabel.text = "Value=\(value)"
    }
}

