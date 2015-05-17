//
//  IntroViewController.swift
//  Carousel
//
//  Created by Rebecca Goldman on 5/12/15.
//  Copyright (c) 2015 codepath. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var backgroundImage: UIImageView!
    
    @IBOutlet weak var tile1View: UIImageView!
    @IBOutlet weak var tile2View: UIImageView!
    @IBOutlet weak var tile3View: UIImageView!
    @IBOutlet weak var tile4View: UIImageView!
    @IBOutlet weak var tile5View: UIImageView!
    @IBOutlet weak var tile6View: UIImageView!
    
    var isPresenting: Bool = true


    var yOffsets : [Float] = [-280, -250, -420, -400, -510, -490]
    var xOffsets : [Float] = [-75, 35, 8, 85, -115, -100]
    var scales : [Float] = [1, 1.65, 1.7, 1.6, 1.65, 1.65]
    var rotations : [Float] = [-10, -10, 10, 10, 10, -10]
    var tiles: [UIImageView] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tiles = [tile1View, tile2View, tile3View, tile4View, tile5View, tile6View]
        
        transformView(0)

        scrollView.contentSize = backgroundImage.image!.size
        scrollView.delegate = self
        scrollView.sendSubviewToBack(backgroundImage)
        

        // Do any additional setup after loading the view.
    }
    
    
    func convertValue(value: Float, r1Min: Float, r1Max: Float, r2Min: Float, r2Max: Float) -> Float {
        
        var ratio = (r2Max - r2Min) / (r1Max - r1Min)
        return value * ratio + r2Min - r1Min * ratio
        
    }
    
    
    func transformView(offset: Float) {
    

        
    // transform coordinates
        
        
        for tile in enumerate(tiles) {
            
            
    var tx = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: xOffsets[tile.index], r2Max: 0)
    var ty = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: yOffsets[tile.index], r2Max: 0)
    
    // scale
    var scale = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: scales[tile.index], r2Max: 1)
    // rotate
    
    var rotation = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: rotations[tile.index], r2Max: 0)
    
    
    tile.element.transform = CGAffineTransformMakeTranslation(CGFloat(tx), CGFloat(ty))
    tile.element.transform = CGAffineTransformScale(tile.element.transform, CGFloat(scale), CGFloat(scale))
    tile.element.transform = CGAffineTransformRotate(tile.element.transform, CGFloat(Double(rotation) * M_PI / 180.0))
            
        }

    }
    
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        
        var offset = Float(scrollView.contentOffset.y)
        
        transformView(offset)
        
        println("Content offset: \(scrollView.contentOffset.y)")
        
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
