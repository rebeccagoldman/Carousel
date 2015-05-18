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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        feedImage.center.y += 22

        scrollView.contentSize = feedImage.image!.size

        // Do any additional setup after loading the view.
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
    
    @IBAction func userDidTapImage(sender: AnyObject) {
    
        println("tapped")
        var defaults = NSUserDefaults.standardUserDefaults()
        defaults.setObject("pressed_photo", forKey: "photoPressedEvent")
        defaults.synchronize()

       println("\(defaults)")
        
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