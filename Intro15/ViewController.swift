//
//  ViewController.swift
//  Intro15
//
//  Created by SwiftiCode on 7/8/16.
//  Copyright © 2016 SwiftiCode. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: Properties
    @IBOutlet weak var alert3TextField: UITextField!
    @IBOutlet weak var alert3Label: UILabel!

    // MARK: Default Template
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        alert3TextField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: UITextFieldDelegate
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        
        return true
    }

    // MARK: Alert Action 1 and Alert Action 2
    @IBAction func alertAction1(sender: UIButton) {
        
        // Create alert controller
        let alertControl1 = UIAlertController(title: "Warning", message: "Beware! You have been warned!", preferredStyle: .Alert)
        
        // Create alert action
        let alertActionOk = UIAlertAction(title: "OK", style: .Default, handler: nil)
        
        // Add alert action to controller
        alertControl1.addAction(alertActionOk)
        
        // Present alert view controller
        presentViewController(alertControl1, animated: true, completion: nil)
        
    }

    @IBAction func alertAction2(sender: UIButton) {
        
        // Create alert controller
        let alertControl2 = UIAlertController(title: "Alert 2", message: "Your action will be process", preferredStyle: .Alert)
        
        // Create alert action
        let alertActionOk = UIAlertAction(title: "Ok", style: .Default, handler: { (action:UIAlertAction) -> Void in print("Will processing alert 2 trigger...") })
            
        // Add alert action to controller
        alertControl2.addAction(alertActionOk)
        
        // Present alert view controller
        presentViewController(alertControl2, animated: true, completion: nil)
        
    }
    
    // MARK: Alert Action 3
    @IBAction func alertAction3(sender: UIButton) {
       
        // Create alert controller
        let alertControl3 = UIAlertController(title: "Alert 2", message: "Your action will be process", preferredStyle: .Alert)
        
        // Create alert action
        let alertActionCancel = UIAlertAction(title: "Cancel", style: .Cancel, handler: { (action:UIAlertAction) -> Void in print("Canceling..."); self.alert3Label.text = "Alert 3 just cancelled!" })
        
        let alertActionConfirm = UIAlertAction(title: "Confirm", style: .Default, handler: alert3OkHandlingProcess)
        
        // Add alert action to controller
        alertControl3.addAction(alertActionCancel)
        alertControl3.addAction(alertActionConfirm)
        
        // Present alert view controller
        presentViewController(alertControl3, animated: true, completion: nil)

        
    }
    
    func alert3OkHandlingProcess(action: UIAlertAction) {
        
        if alert3TextField.text?.isEmpty == true {
            
            alert3TextField.text = "Default"
        }
        
        alert3Label.text = alert3TextField.text!
        
        print("Confirmed!!!")
        
    }
 
    // MARK: Alert Action 4
    @IBAction func alertAction4(sender: UIButton) {
       
        // Create alert controller
        let alertControl4 = UIAlertController(title: "Selection", message: "Make a Choice:", preferredStyle: .ActionSheet)
        
        // Create alert action sheet
        let select1 = UIAlertAction(title: "Option1", style: .Default, handler: responseHandler)
        
        let select2 = UIAlertAction(title: "Option2", style: .Default, handler: responseHandler)
 
        // Action sheet 3 with sub action sheet
        let select3 = UIAlertAction(title: "Option3", style: .Default) { (action:UIAlertAction) -> Void in
 
            // Create action sheet within action sheet
            
            // Create sub option controller
            let option3AlertControl = UIAlertController(title: "Option 3", message: "Choose Sub Option", preferredStyle: .ActionSheet)

            // Create action sheet for sub option
            let subOptionA = UIAlertAction(title: "Option3A", style: .Default, handler: self.responseHandler)
            
            let subOptionB = UIAlertAction(title: "Option3B", style: .Default, handler: self.responseHandler)
            
            // Add sub option
            option3AlertControl.addAction(subOptionA)
            option3AlertControl.addAction(subOptionB)
            
            // Present view controller for sub option
            self.presentViewController(option3AlertControl, animated: true, completion: nil)
            
        }
        
        let selectCancel = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)

        // Add alert action to controller
        alertControl4.addAction(select1)
        alertControl4.addAction(select2)
        alertControl4.addAction(select3)
        alertControl4.addAction(selectCancel)
        
        // Present alert view controller
        presentViewController(alertControl4, animated: true, completion: nil)
        
    }
    
    func responseHandler(action:UIAlertAction)  {
    
        let alertUserBack = UIAlertController(title: "Your Selection", message: "You Chose " + action.title!, preferredStyle: .Alert)
        
        let alertUserBackOK = UIAlertAction(title: "OK", style: .Default, handler: nil)
        
        alertUserBack.addAction(alertUserBackOK)
        
        presentViewController(alertUserBack, animated: true, completion: nil)
    }
    
  
    // MARK: Alert Action User Login
    @IBAction func userLoginAction(sender: UIButton) {
        
        // Create alert controller
        let userLoginAlertControl = UIAlertController(title: "Login", message: "Enter your ID and Password", preferredStyle: .Alert)
        
        // Add textField configuration to alert controller
        userLoginAlertControl.addTextFieldWithConfigurationHandler { (userIDTextField:UITextField) -> Void in
            userIDTextField.placeholder = "ID or email"
        }
        
        userLoginAlertControl.addTextFieldWithConfigurationHandler(passwordConfigurationHandler)
        
        // Create alert action
        let cancelLogin = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
        
        let okLogin = UIAlertAction(title: "Login", style: .Default) { (action:UIAlertAction) in
            
            let userIDTextField = userLoginAlertControl.textFields![0] as UITextField
            let userPasswordTextField = userLoginAlertControl.textFields![1] as UITextField
            
            let userID = userIDTextField.text ?? ""
            let password = userPasswordTextField.text ?? ""
            
            print("User ID:", userID)
            print("Password:", password)
            
            print("Login process underway....")
        }
        
        userLoginAlertControl.addAction(cancelLogin)
        userLoginAlertControl.addAction(okLogin)
        
        presentViewController(userLoginAlertControl, animated: true, completion: nil)
        
    }
    
    func passwordConfigurationHandler(userPasswordTextField: UITextField) {
        
        userPasswordTextField.placeholder = "password"
        userPasswordTextField.secureTextEntry = true
        
    }
}

