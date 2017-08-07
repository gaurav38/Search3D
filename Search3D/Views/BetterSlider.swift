//
//  BetterSlider.swift
//  Search3D
//
//  Created by Gaurav Saraf on 8/3/17.
//  Copyright © 2017 Gaurav Saraf. All rights reserved.
//

import UIKit

@IBDesignable class BetterSlider: UIView {

    @IBOutlet var contentView: UIView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textField: BetterTextField!
    @IBOutlet weak var slider: UISlider!
    
    // MARK: Properties
    
    @IBInspectable var labelText: String = "Label" {
        didSet {
            label.text = labelText
        }
    }
    
    private(set) var sliderValue: Float = 0.0
    
    // MARK: Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        contentView = loadViewFromNib()
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        addSubview(contentView)
        
        textField.isUserInteractionEnabled = false
        textField.text = "0"
    }
    
    private func loadViewFromNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "BetterSlider", bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        return view
    }
    
    // MARK: IBAction
    
    @IBAction func sliderChanged(_ sender: Any) {
        sliderValue = slider.value
        textField.text = sliderValue.format(f: ".2")
    }
}

extension Int {
    func format(f: String) -> String {
        return String(format: "%\(f)f", self)
    }
}

extension Double {
    func format(f: String) -> String {
        return String(format: "%\(f)f", self)
    }
}

extension Float {
    func format(f: String) -> String {
        return String(format: "%\(f)f", self)
    }
}
