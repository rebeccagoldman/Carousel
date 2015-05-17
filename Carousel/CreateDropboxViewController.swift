//
//  CreateDropboxViewController.swift
//  Carousel
//
//  Created by Rebecca Goldman on 5/12/15.
//  Copyright (c) 2015 codepath. All rights reserved.
//

import UIKit

class CreateDropboxViewController: UIViewController, UIScrollViewDelegate {
    
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var firstNameField: UITextField!
    @IBOutlet weak var termsButton: UIButton!
    @IBOutlet weak var checkBoxButton: UIButton!
    @IBOutlet weak var createButton: UIButton!
    @IBOutlet weak var createButtonView: UIView!
    @IBOutlet weak var formView: UIView!

    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        scrollView.delegate = self
        scrollView.contentSize = CGSizeMake(320, 568)
        
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
   
        formView.transform = CGAffineTransformMakeTranslation(0, -120)
        createButtonView.transform = CGAffineTransformMakeTranslation(0, -200)
        
    }
    
    func keyboardWillHide(notification: NSNotification!) {
     
        
        formView.transform = CGAffineTransformMakeTranslation(0, 0)
        createButtonView.transform = CGAffineTransformMakeTranslation(0, 0)
        
        
    }
    

    @IBAction func scrollViewDidScroll(UIScrollView) {
         view.endEditing(true)
    }
}
