//
//  CreateDropboxViewController.swift
//  Carousel
//
//  Created by Rebecca Goldman on 5/12/15.
//  Copyright (c) 2015 codepath. All rights reserved.
//

import UIKit

class CreateDropboxViewController: UIViewController {
    
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var createButton: UIImageView!
    @IBOutlet weak var firstNameField: UITextField!
    @IBOutlet weak var scrollBackgroundView: UIView!
    @IBOutlet weak var termsButton: UIButton!
    @IBOutlet weak var checkBoxButton: UIButton!

    @IBOutlet var onTapRecognizer: UITapGestureRecognizer!
    
    var initialScrollCenter: CGPoint!
    var initialButtonCenter: CGPoint!
    
    override func viewDidLoad() {
        
        initialScrollCenter = scrollView.center
        initialButtonCenter = createButton.center
        super.viewDidLoad()
        scrollView.contentSize = CGSize(width: 320, height: 568)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)

        
    }
    

    @IBAction func checkBoxTapped(sender: AnyObject) {
        
        if checkBoxButton.selected == true {
            
            checkBoxButton.selected = false
            
        } else {
            checkBoxButton.selected = true
        }
        
    }
        
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    @IBAction func backButton(sender: AnyObject) {
        navigationController?.popToRootViewControllerAnimated(true)
    }

    
    func keyboardWillShow(notification: NSNotification!) {
        
        
        var userInfo = notification.userInfo!
        
        var kbSize = (userInfo[UIKeyboardFrameEndUserInfoKey] as! NSValue).CGRectValue().size
        println("\(kbSize)")
        var durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey] as! NSNumber
        var animationDuration = durationValue.doubleValue
        var curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey] as! NSNumber
        var animationCurve = curveValue.integerValue
        
        UIView.animateWithDuration(animationDuration, delay: 0.0, options: UIViewAnimationOptions(UInt(animationCurve << 16)), animations: {
            
            self.scrollView.center.y -= kbSize.height - 100
            self.createButton.center.y -= 110
            // If you need it, you can use the kbSize property above to get the keyboard width and height.
            }, completion: nil)

        
    }
    
    func keyboardWillHide(notification: NSNotification!) {
        
        
        var userInfo = notification.userInfo!
        
        var kbSize = (userInfo[UIKeyboardFrameEndUserInfoKey] as! NSValue).CGRectValue().size
        println("\(kbSize)")
        var durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey] as! NSNumber
        var animationDuration = durationValue.doubleValue
        var curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey] as! NSNumber
        var animationCurve = curveValue.integerValue
        
        UIView.animateWithDuration(animationDuration, delay: 0.0, options: UIViewAnimationOptions(UInt(animationCurve << 16)), animations: {
            
            self.scrollView.center = self.initialScrollCenter
            self.createButton.center = self.initialButtonCenter
            // If you need it, you can use the kbSize property above to get the keyboard width and height.
            }, completion: nil)

        
        
    }
    


    @IBAction func onTap(sender: AnyObject) {
         view.endEditing(true)
    }
}
