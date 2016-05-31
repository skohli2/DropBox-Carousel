//
//  LoginViewController.swift
//  DropBox
//
//  Created by Sumit Kohli on 5/26/16.
//  Copyright © 2016 Sumit Kohli. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UIScrollViewDelegate {

  
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var buttonParentView: UIView!
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var loginIndicator: UIActivityIndicatorView!
    
    var buttonInitialY: CGFloat!
    var buttonOffset: CGFloat!
    override func viewDidLoad() {
        super.viewDidLoad()
      scrollView.delegate = self
        scrollView.contentSize = scrollView.frame.size
        scrollView.contentInset.bottom = 100
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector
            (keyboardWillShow(_:)), name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector
            (keyboardWillHide(_:)), name: UIKeyboardWillHideNotification, object: nil)
        buttonInitialY = buttonParentView.frame.origin.y
        buttonOffset = -100
        }
    
    // The keyboard is about to be shown...
    func keyboardWillShow(notification: NSNotification) {
        print("keyboardWillShow")
        // Move the button up above keyboard
        buttonParentView.frame.origin.y = buttonInitialY + buttonOffset
        // Scroll the scrollview up
        scrollView.contentOffset.y = scrollView.contentInset.bottom
    }
    
    func keyboardWillHide(notification: NSNotification) {
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   
     //login conditions
  
    @IBAction func didPressLogin1(sender: UIButton) {
    
        
        
        if emailField.text!.isEmpty || passwordField.text!.isEmpty {
            
            
            
            let alertController = UIAlertController(title: "Email Required", message: "Please enter your email and password.", preferredStyle: .Alert)
            // create an OK action
            let OKAction = UIAlertAction(title: "OK", style: .Default) { (action) in
                // handle response here.
            }
            // add the OK action to the alert controller
            alertController.addAction(OKAction)
            presentViewController(alertController, animated: true) {
                // optional code for what happens after the alert controller has finished presenting
                
                }
            
            
        }
        
       else {
            // Start animating the activity indicator
            loginIndicator.startAnimating()
            // Set the Button state to "Selected"
            loginButton.selected = true
        // If both the email and password fields match what we are looking for...
       if emailField.text == "skohli19@gmail.com" && passwordField.text == "ayeena" {
            // Delay for 2 second.
            delay(10, closure: { () -> () in
                // Stop animating the activity indicator.
                self.loginIndicator.stopAnimating()
                // Set the button state back to default, "Not Selected".
                self.loginButton.selected = false
                // perform the Segue to the next screen.
                
                
                
                
                self.performSegueWithIdentifier("tutorialSegue", sender: nil)
            })
            // Otherwise, email or password are incorrect so...
        }
       else {
            // Delay for 2 second
            delay(2, closure: { () -> () in
                // Stop animating the activity indicator.
                self.loginIndicator.stopAnimating()
                // Set the button state back to default, "Not Selected".
                self.loginButton.selected = false
                // Create and Show UIAlertController...see guide, Using UIAlertController
                let alertController = UIAlertController(title: "Invalid Email or Password", message: "Please enter valid Email and Password.", preferredStyle: .Alert)
                // create an OK action
                let OKAction = UIAlertAction(title: "OK", style: .Default) { (action) in
                    // handle response here.
                }
                // add the OK action to the alert controller
                alertController.addAction(OKAction)
                self.presentViewController(alertController, animated: true) {
                    // optional code for what happens after the alert controller has finished presenting
                }
                
            })
        }
        }
    
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
