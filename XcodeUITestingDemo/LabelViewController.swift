//
//  LabelViewController.swift
//  XcodeUITestingDemo
//
//  Created by Douglas Sjoquist on 3/3/16.
//  Copyright © 2016 Ivy Gulch LLC. All rights reserved.
//

import UIKit

var viewCount = 0

class LabelViewController: UIViewController {

    @IBOutlet var valueLabel:UILabel!

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)

        updateValueLabel()
    }

    func updateValueLabel() {
        viewCount += 1
        valueLabel.text = "Value=\(viewCount)"
    }

}

