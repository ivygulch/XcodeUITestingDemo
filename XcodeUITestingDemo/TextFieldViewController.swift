//
//  TextFieldViewController.swift
//  XcodeUITestingDemo
//
//  Created by Douglas Sjoquist on 3/3/16.
//  Copyright © 2016 Ivy Gulch LLC. All rights reserved.
//

import UIKit

class TextFieldViewController: UIViewController {

    @IBOutlet var valueLabel:UILabel!
    @IBOutlet var textField:UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        updateValueLabel()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "handleTextFieldDidChange:", name: UITextFieldTextDidChangeNotification, object: textField)
    }

    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }

    func handleTextFieldDidChange(notification:NSNotification) {
        updateValueLabel()
    }

    func updateValueLabel() {
        let text = textField.text ?? ""
        valueLabel.text = "Value=\(text)"
    }

}

