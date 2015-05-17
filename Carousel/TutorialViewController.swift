//
//  TutorialViewController.swift
//  Carousel
//
//  Created by Rebecca Goldman on 5/12/15.
//  Copyright (c) 2015 codepath. All rights reserved.
//

import UIKit

class TutorialViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var horizontalScrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var getStartedButton: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.getStartedButton.hidden = true

        
        horizontalScrollView.delegate = self
        horizontalScrollView.contentSize = CGSize(width: 1280, height: 300)
    }
    
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        // Get the current page based on the scroll offset
        var page : Int = Int(round(horizontalScrollView.contentOffset.x / 320))
        
        // Set the current page, so the dots will update
        pageControl.currentPage = page
        
        if pageControl.currentPage == 3
        {

            delay(0, { () -> () in
            self.pageControl.hidden = true
            self.getStartedButton.hidden = false
            })
        } else {
            pageControl.hidden = false
            self.getStartedButton.hidden = true

        }
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
