//
//  SignInViewController.swift
//  Carousel
//
//  Created by Rebecca Goldman on 5/13/15.
//  Copyright (c) 2015 codepath. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController, UIScrollViewDelegate, UIAlertViewDelegate, UITextFieldDelegate {

    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var loginView: UIView!
    @IBOutlet weak var forgotPasswordButton: UIButton!
    @IBOutlet weak var loginButtonsView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var navView: UIImageView!
    
    var isPresenting: Bool = true

    @IBOutlet weak var loadingIndicatorView: UIActivityIndicatorView!
    @IBOutlet var onTap: UITapGestureRecognizer!
    
    
    
    
    override func viewDidLoad() {
    
        super.viewDidLoad()
        
        scrollView.delegate = self
        emailField.delegate = self
        passwordField.delegate = self
        
        scrollView.contentSize = CGSizeMake(320, 568)
        
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)

    }
    
 
    override func viewWillAppear(animated: Bool) {
        
        super.viewWillAppear(animated)
        loginView.alpha = 0
        loginView.center.y += 100
        loginView.transform = CGAffineTransformMakeScale(0.8, 0.8)
        
        navView.alpha = 0
        navView.center.y += 100
        navView.transform = CGAffineTransformMakeScale(0.8, 0.8)

        loginButtonsView.alpha = 0
        loginButtonsView.center.y -= 100
        loginButtonsView.transform = CGAffineTransformMakeScale(0.8, 0.8)

        
        
    }
    
    override func viewDidAppear(animated: Bool) {
        
        super.viewDidAppear(animated)
        
        
        UIView.animateWithDuration(0.1, delay: 0.0, options: UIViewAnimationOptions.CurveEaseInOut, animations: {
            self.loginView.alpha = 1
            self.loginView.center.y -= 100
            self.loginView.transform = CGAffineTransformMakeScale(1, 1)
            self.navView.alpha = 1
            self.navView.transform = CGAffineTransformMakeScale(1, 1)
            self.navView.center.y -= 100
            
            self.loginButtonsView.alpha = 1
            self.loginButtonsView.center.y += 100
            self.loginButtonsView.transform = CGAffineTransformMakeScale(1, 1)

            self.loginView.layoutIfNeeded()

            }, completion: nil)
        
        
        }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    

    @IBAction func signInButtonTapped(sender: AnyObject) {


        if emailField.text.isEmpty || passwordField.text.isEmpty == true {
            
            var alertView = UIAlertView(title: "Error", message: "Please enter email and password", delegate: self, cancelButtonTitle: "OK")
            
            alertView.show()
            
        } else {
            
//            loadingIndicatorView.startAnimating()
            
            if emailField.text == "rebecca@goldman.org" && passwordField.text == "password" {
                
                var alertView = UIAlertView(title: "Signing in...", message: nil, delegate: self, cancelButtonTitle: nil)
                
                alertView.show()
                
                
            delay(1.6, { () -> () in
                
//                self.loadingIndicatorView.stopAnimating()
                alertView.dismissWithClickedButtonIndex(0, animated: true)

                
            
            })
        
            delay(2, { () -> () in

                self.performSegueWithIdentifier("segueToTutorial", sender: nil)
                    
                })

            } else {
            
                
                var signingInView = UIAlertView(title: "Signing in...", message: nil, delegate: self, cancelButtonTitle: nil)
                signingInView.show()

                
                delay(0.8, { () -> () in
                    

                    signingInView.dismissWithClickedButtonIndex(0, animated: true)

                var credentialErrorView = UIAlertView(title: "Error", message: "Incorrect email and password", delegate: self, cancelButtonTitle: "OK")
                
                credentialErrorView.show()
                     })
       }
        }
    }
    
    
    
    func keyboardWillShow(notification: NSNotification!) {
        
     
        var userInfo = notification.userInfo!
        
        var kbSize = (userInfo[UIKeyboardFrameEndUserInfoKey] as! NSValue).CGRectValue().size

        
        scrollView.transform = CGAffineTransformMakeTranslation(0, -120)
        loginButtonsView.transform = CGAffineTransformMakeTranslation(0, -200)
        
    }
    
    func keyboardWillHide(notification: NSNotification!) {
    
    
            scrollView.transform = CGAffineTransformMakeTranslation(0, 0)
            loginButtonsView.transform = CGAffineTransformMakeTranslation(0, 0)
        
        
    }

    
    @IBAction func backButtonTapped(sender: AnyObject) {
        
        navigationController?.popToRootViewControllerAnimated(true)
        
        
    }
    
    
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        view.endEditing(true)
    }
 
}
