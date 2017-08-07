//
//  BetterTextField.swift
//  Search3D
//
//  Created by Gaurav Saraf on 8/3/17.
//  Copyright © 2017 Gaurav Saraf. All rights reserved.
//

import UIKit

@IBDesignable class BetterTextField: UITextField {

    // MARK: Properties
    
    @IBInspectable var borderColor: UIColor = Colors.currentPageTintColor {
        didSet {
            self.layer.borderColor = borderColor.cgColor
        }
    }
    @IBInspectable var borderThickness: CGFloat = 1.0 {
        didSet {
            self.layer.borderWidth = borderThickness
        }
    }
    
    var padding: UIEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    
    // MARK: Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK: Rect overrides
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
