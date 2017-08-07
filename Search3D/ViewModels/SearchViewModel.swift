//
//  SearchViewModel.swift
//  Search3D
//
//  Created by Gaurav Saraf on 8/5/17.
//  Copyright © 2017 Gaurav Saraf. All rights reserved.
//

import Foundation

class SearchViewModel: SearchViewModelProtocol {
    var userLevel: UserLevel = UserLevel.Beginner
    var length: Float = 0.00
    var width: Float = 0.0
    var height: Float = 0.0
    var material: String = "multi-material"
    var multiColor: Bool = false
    var resolution: Int = 100
    var partCost: Float = 0.00
    
    required init() {
        
    }
    
    func executeSearch() {
    }
}
