//
//  UserLevelDetailsViewController.swift
//  Search3D
//
//  Created by Gaurav Saraf on 8/1/17.
//  Copyright © 2017 Gaurav Saraf. All rights reserved.
//

import UIKit

class UserLevelDetailsViewController: UIViewController {

    @IBOutlet weak var userLevelTextField: UITextField!
    var userLevelPicker: UIPickerView!
    let userLevels: [String] = [UserLevel.Beginner.rawValue,
                                UserLevel.Designer.rawValue,
                                UserLevel.Professional.rawValue,
                                UserLevel.Medical.rawValue]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializePicker()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    private func initializePicker() {
        userLevelPicker = UIPickerView()
        userLevelPicker.dataSource = self
        userLevelPicker.delegate = self
        userLevelPicker.showsSelectionIndicator = true
        userLevelTextField.inputView = userLevelPicker
    }
}

extension UserLevelDetailsViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return userLevels.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return userLevels[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        userLevelTextField.text = userLevels[row]
    }
}
