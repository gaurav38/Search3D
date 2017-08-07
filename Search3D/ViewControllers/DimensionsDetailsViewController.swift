//
//  DimensionsDetailsViewController.swift
//  Search3D
//
//  Created by Gaurav Saraf on 8/1/17.
//  Copyright © 2017 Gaurav Saraf. All rights reserved.
//

import UIKit

class DimensionsDetailsViewController: UIViewController {
    
    @IBOutlet weak var lengthSlider: BetterSlider!
    @IBOutlet weak var widthSlider: BetterSlider!
    @IBOutlet weak var heightSlider: BetterSlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lengthSlider.slider.addTarget(self, action: #selector(lengthChanged), for: UIControlEvents.valueChanged)
        widthSlider.slider.addTarget(self, action: #selector(widthChanged), for: UIControlEvents.valueChanged)
        heightSlider.slider.addTarget(self, action: #selector(heightChanged), for: UIControlEvents.valueChanged)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: Slider events
    
    func lengthChanged() {
        print(lengthSlider.sliderValue.format(f: ".2"))
    }
    
    func widthChanged() {
        print(widthSlider.sliderValue.format(f: ".2"))
    }
    
    func heightChanged() {
        print(heightSlider.sliderValue.format(f: ".2"))
    }
}
