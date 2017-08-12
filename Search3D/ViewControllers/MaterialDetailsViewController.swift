//
//  MaterialDetailsViewController.swift
//  Search3D
//
//  Created by Gaurav Saraf on 8/1/17.
//  Copyright © 2017 Gaurav Saraf. All rights reserved.
//

import UIKit
import CLTokenInputView

class MaterialDetailsViewController: UIViewController {

    @IBOutlet weak var multiColorButton: UIButton!
    @IBOutlet weak var materialsInputView: CLTokenInputView!
    @IBOutlet weak var materialsTableView: UITableView!
    @IBOutlet weak var materialsSearchView: UIView!
    @IBOutlet weak var resolutionSlider: BetterSlider!
    @IBOutlet weak var partCostSlider: BetterSlider!
    
    public var viewModel: SearchViewModelProtocol!
    
    private var multiColor: Bool = false
    let materials: [String] = PrinterResources.PrinterMaterials
    var filteredMaterial: [String] = [String]()
    var selectedMaterials: [String] = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        materialsInputView.delegate = self
        materialsTableView.delegate = self
        materialsTableView.dataSource = self
        materialsSearchView.isHidden = true

        resolutionSlider.slider.addTarget(self, action: #selector(resolutionChanged), for: UIControlEvents.valueChanged)
        partCostSlider.slider.addTarget(self, action: #selector(partCostChanged), for: UIControlEvents.valueChanged)
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
        viewModel.multiColor = multiColor
    }
    
    func resolutionChanged() {
        viewModel.resolution = Int(resolutionSlider.sliderValue)
    }
    
    func partCostChanged() {
        viewModel.partCost = partCostSlider.sliderValue
    }

    @IBAction func search(_ sender: Any) {
        performSegue(withIdentifier: "ShowSearchResults", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowSearchResults" {
            if let destinationVC = segue.destination as? SearchResultsViewController {
                destinationVC.viewModel = viewModel
            }
        }
    }
}

extension MaterialDetailsViewController: CLTokenInputViewDelegate {
    
    func tokenInputViewDidEndEditing(_ view: CLTokenInputView) {
        materialsSearchView.isHidden = true
    }
    
    func tokenInputView(_ view: CLTokenInputView, didChangeText text: String?) {
        self.filteredMaterial = materials.filter{ $0.localizedCaseInsensitiveContains(text!) }
        if (self.filteredMaterial.count > 0) {
            materialsSearchView.isHidden = false
            materialsTableView.reloadData()
        } else {
            materialsSearchView.isHidden = true
        }
    }
    
    func tokenInputView(_ view: CLTokenInputView, didAdd token: CLToken) {
        selectedMaterials.append(token.displayText)
        viewModel.material = selectedMaterials
    }
    
    func tokenInputView(_ view: CLTokenInputView, didRemove token: CLToken) {
        selectedMaterials = selectedMaterials.filter { $0 != token.displayText}
        viewModel.material = selectedMaterials
    }
}

extension MaterialDetailsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(filteredMaterial.count)
        return filteredMaterial.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MaterialsTableViewCell")!
        cell.textLabel?.text = filteredMaterial[indexPath.row]
        cell.textLabel?.textColor = Colors.materialsTableViewCellTextColor
        cell.backgroundColor = Colors.materialsTableViewCellBackgroundColor
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let material = filteredMaterial[indexPath.row]
        let token: CLToken = CLToken.init(displayText: material, context: nil)
        materialsInputView.add(token)
        materialsSearchView.isHidden = true
    }
}
