//
//  ViewController.swift
//  ExValidatorExample
//
//  Created by Kenta Nakai on 2015/05/23.
//  Copyright (c) 2015年 UROURO. All rights reserved.
//

import UIKit
import ExValidator

extension UITextField {
    func error() {
        self.layer.borderColor = UIColor(red:1, green:0.18, blue:0.33, alpha:1).CGColor
    }
    
    func success() {
        self.layer.borderColor = UIColor(red:0.3, green:0.85, blue:0.39, alpha:1).CGColor
    }
}

extension UILabel {
    func error() {
        self.textColor = UIColor(red:1, green:0.18, blue:0.33, alpha:1)
    }
    
    func success() {
        self.textColor = UIColor(red:0.3, green:0.85, blue:0.39, alpha:1)
    }
}

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var requiredField: UITextField!
    @IBOutlet weak var minLengthField: UITextField!
    @IBOutlet weak var maxLengthField: UITextField!
    @IBOutlet weak var stepperLabel: UILabel!
    @IBOutlet weak var stepper: UIStepper!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        for field: UITextField in [self.requiredField, self.minLengthField, self.maxLengthField] {
            field.layer.borderWidth = 2
            field.layer.borderColor = UIColor.lightGrayColor().CGColor
            field.layer.cornerRadius = 5.0
            
            self.validateField(field)
        }
    
        self.stepperLabel.textColor = UIColor.lightGrayColor()
        self.stepper.addTarget(self, action: "stepperValueChanged:", forControlEvents: .ValueChanged)
        self.stepperValueChanged(self.stepper)
    }
    
    
    // MARK: - Action
    
    func stepperValueChanged(stepper: UIStepper) {
        let value: Int = Int(stepper.value)
        
        self.stepperLabel.text = String(value)
        
        if value.validate([.Min(5)]) {
            self.stepperLabel.success()
        } else {
            self.stepperLabel.error()
        }
    }

    
    // MARK: - UITextFieldDelegate
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        self.validateField(textField)
        
        return true
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        self.validateField(textField)
    }
    
    
    // MARK: - Private Methods
    
    private func validateField(textField: UITextField) {
        var succeeded: Bool = true
        
        switch textField {
        case self.requiredField:
            succeeded = textField.text.validate([.Required])

        case self.minLengthField:
            succeeded = textField.text.validate([.Min(2)])
            
        case self.maxLengthField:
            succeeded = textField.text.validate([.Max(8)])
        default:
            break
        }

        if succeeded {
            textField.success()
        } else {
            textField.error()
        }
    }
}

