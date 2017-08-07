//
//  MaterialDetailsViewController.swift
//  Search3D
//
//  Created by Gaurav Saraf on 8/1/17.
//  Copyright © 2017 Gaurav Saraf. All rights reserved.
//

import UIKit

class MaterialDetailsViewController: UIViewController {

    @IBOutlet weak var multiColorButton: UIButton!
    private var multiColor: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    @IBAction func multiColorButtonClicked(_ sender: Any) {
        if multiColor {
            multiColorButton.setImage(#imageLiteral(resourceName: "UnChecked"), for: UIControlState.normal)
        } else {
            multiColorButton.setImage(#imageLiteral(resourceName: "Checked"), for: UIControlState.normal)
        }
        multiColor = !multiColor
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
