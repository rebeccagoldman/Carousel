//
//  FeedViewController.swift
//  Carousel
//
//  Created by Rebecca Goldman on 5/16/15.
//  Copyright (c) 2015 codepath. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var feedImage: UIImageView!
    @IBOutlet weak var settingsButton: UIButton!
    @IBOutlet weak var learnMoreButton: UIButton!
    @IBOutlet weak var xButton: UIButton!
    @IBOutlet weak var imageButton: UIButton!
    @IBOutlet var swipeLeftRightRecognizer: UISwipeGestureRecognizer!
    @IBOutlet weak var shareButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var shareNavView: UIView!
    @IBOutlet weak var selectButton: UIButton!
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        

        
        feedImage.center.y += 22
        shareNavView.hidden = true

        scrollView.contentSize = feedImage.image!.size
        

        
        var defaults = NSUserDefaults.standardUserDefaults()
        defaults.setBool(false, forKey: "photoPressedEvent")
        defaults.setBool(false, forKey: "shareEvent")
        defaults.setBool(false, forKey: "screenSwipedEvent")
        defaults.synchronize()

//
//        
//        if photoPressed == true {
//            
//            println("\(photoPressed)")
//            
//            UIView.animateWithDuration(0.5, delay: 0.0, options: UIViewAnimationOptions.CurveEaseInOut, animations: {
//                
//                self.learnMoreButton.hidden = true
//                self.feedImage.center.y -= 44
//                
//                }, completion: nil)
//        }
        

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(animated: Bool) {
  
        super.viewDidAppear(true)



    }
    
    @IBAction func userDidTapShare(sender: AnyObject) {
        
        var sharingItems = [AnyObject]()
        
        let activityViewController = UIActivityViewController(activityItems: sharingItems, applicationActivities: nil)
        self.presentViewController(activityViewController, animated: true, completion: nil)
        
        
        println("tappedShare")
        var defaults = NSUserDefaults.standardUserDefaults()
        defaults.setObject(true, forKey: "shareEvent")
        defaults.synchronize()
        
        println("\(defaults)")
        
        
        
        
    }
    @IBAction func userDidTapImage(sender: AnyObject) {
        
        println("tapped")
        var defaults = NSUserDefaults.standardUserDefaults()
        defaults.setObject(true, forKey: "photoPressedEvent")
        defaults.synchronize()
        
        println("\(defaults)")
        
    }
    
    @IBAction func userSwipedLeftRight(sender: AnyObject) {
        
        println("swiped")
        var defaults = NSUserDefaults.standardUserDefaults()
        defaults.setObject(true, forKey: "screenSwipedEvent")
        defaults.synchronize()
        
        
        
        println("\(defaults)")
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func dismissLearnMoreBanner(sender: AnyObject) {
        
      
        UIView.animateWithDuration(0.5, delay: 0.0, options: UIViewAnimationOptions.CurveEaseInOut, animations: {
            
        self.learnMoreButton.hidden = true
        self.feedImage.center.y -= 44
        
            }, completion: nil)
        
    }
    
    @IBAction func userDidTapSelectButton(sender: AnyObject) {
        
        shareNavView.hidden = false
        
    }
    
    @IBAction func userDidTapCancelButton(sender: AnyObject) {
        
        shareNavView.hidden = true

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