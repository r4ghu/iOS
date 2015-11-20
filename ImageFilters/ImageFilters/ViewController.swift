//
//  ViewController.swift
//  ImageFilters
//
//  Created by Sri Raghu Malireddi on 18/11/15.
//  Copyright © 2015 Sri Raghu Malireddi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var filteredImage:UIImage?

    @IBOutlet weak var ImageView: UIImageView!
    @IBOutlet weak var ImageToggle: UIButton!
    @IBAction func onImageToggle(sender: UIButton) {
        if ImageToggle.selected{
            let image = UIImage(named: "sample")!
            ImageView.image = image
            ImageToggle.selected = false
        }else{
            ImageView.image = filteredImage
            ImageToggle.selected = true
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        ImageToggle.setTitle("Show Before Image", forState: .Selected)
        
        let image = UIImage(named: "sample")!
        let rgbaImage = RGBAImage(image: image)!
        
        let avgRed = 118
        let avgGreen = 98
        let avgBlue = 83
        let sum = avgRed + avgGreen + avgBlue
        
        
        //Code to increase the contrast in the image
        for y in 0..<rgbaImage.height {
            for x in 0..<rgbaImage.width {
                let index = y * rgbaImage.width + x
                var pixel = rgbaImage.pixels[index]
                
                let redDelta = Int(pixel.red) - avgRed
                let greenDelta = Int(pixel.green) - avgGreen
                let blueDelta = Int(pixel.blue) - avgBlue
                
                var modifier = 2
                if (Int(pixel.red) + Int(pixel.green) + Int(pixel.blue) < sum){
                    modifier = 1
                }
                
                pixel.red = UInt8(max(min(255, avgRed + modifier * redDelta),0))
                pixel.blue = UInt8(max(min(255, avgBlue + modifier * blueDelta),0))
                pixel.green = UInt8(max(min(255, avgGreen + modifier * greenDelta),0))
                rgbaImage.pixels[index] = pixel
                
            }
        }
        filteredImage = rgbaImage.toUIImage()
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

