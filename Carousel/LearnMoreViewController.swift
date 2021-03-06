//
//  LearnMoreViewController.swift
//  Carousel
//
//  Created by Rebecca Goldman on 5/17/15.
//  Copyright (c) 2015 codepath. All rights reserved.
//

import UIKit

class LearnMoreViewController: UIViewController {

    @IBOutlet weak var doneButton: UIButton!
    
    @IBOutlet weak var event1CompleteView: UIImageView!
    @IBOutlet weak var event2CompleteView: UIImageView!
    @IBOutlet weak var event3CompleteView: UIImageView!
    
    @IBOutlet weak var event1IncompleteView: UIImageView!
    @IBOutlet weak var event2IncompleteView: UIImageView!
    @IBOutlet weak var event3IncompleteView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var savedValue = NSUserDefaults.standardUserDefaults()
        savedValue.objectForKey("photoPressedEvent")
        
        var savedValue2 = NSUserDefaults.standardUserDefaults()
        savedValue2.objectForKey("shareEvent")
        
        var savedValue3 = NSUserDefaults.standardUserDefaults()
        savedValue3.objectForKey("screenSwipedEvent")


        if savedValue == "" {
            // You've never written to pressed_photo before, so should be unchecked.
            event1CompleteView.hidden = true

            
        } else {
            // Check the box
            event1CompleteView.hidden = false
            event1IncompleteView.hidden = true
            
        }
        
            
        if savedValue2 == "" {
            event2CompleteView.hidden = true
            
            } else {
            event2CompleteView.hidden = false
            event2IncompleteView.hidden = true
            
            }
        
        if savedValue3 == "" {
            event3CompleteView.hidden = true
            
        } else {
            event3CompleteView.hidden = false
            event3IncompleteView.hidden = true
            
        }
        
    

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func doneButtonTapped(sender: AnyObject) {
        
        dismissViewControllerAnimated(true, completion: nil)
        
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
