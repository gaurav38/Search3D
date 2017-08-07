//
//  SearchViewModelProtocol.swift
//  Search3D
//
//  Created by Gaurav Saraf on 8/5/17.
//  Copyright © 2017 Gaurav Saraf. All rights reserved.
//

import Foundation

protocol SearchViewModelProtocol: class {
    var userLevel: UserLevel { get set }
    var length: Float { get set }
    var width: Float { get set }
    var height: Float { get set }
    var multiColor: Bool { get set }
    var resolution: Int { get set }
    var partCost: Float { get set }
    var material: String { get set }
    
    init()
    func executeSearch()
}
